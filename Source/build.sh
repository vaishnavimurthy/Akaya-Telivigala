TTF="TTF/AkayaTelivigala-Regular.ttf"

# Delete olf font to make sure we’re looking at a freshly generated font after here
rm -f $TTF

# Generate
fontmake -g Source/AkayaTelivigala.glyphs -o ufo --output-path Source/AkayaTelivigala-Regular.ufo

# echo 
echo "include(../Source/Features/Akaya_Telivigala_GSUB.txt); include(../Source/Features/Akaya_Telivigala_GPOS.txt);" > master_ufo/AkayaTelivigala-Regular.ufo/features.fea

# Generete
fontmake -u master_ufo/AkayaTelivigala-Regular.ufo -a -o ttf --output-path $TTF

gftools fix-hinting $TTF
mv $TTF.fix $TTF
gftools fix-dsig $TTF -a -f

rm -r instance_ufo
rm -r master_ufo
