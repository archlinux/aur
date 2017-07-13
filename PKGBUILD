# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: reflexing <reflexing@reflexing.ru>

_opt_Build=1 # Default 1
# 0=Build only Latin fonts package
# 1=Also build international fonts as separate packages for selective install. (the original, use with mksrcinfo)
# 2=Build all fonts in a single package. Easy install of all fonts.

_opt_SkipMissing=0 # Default 0
# 2=Skip missing and wrong checksums. Git-er-done easier than updating this PKGBUILD.
# 1=Skip missing fonts. Useful when you get tired of chasing down fonts like
#   Calibri Light you'll never use.
# 0=Require all fonts. (original)

_opt_ConvertTTC=1 # Default 1
# 1=Break out all TTC to TTF (slow, more space, possible conversion losses, TTF is better supported)
# 0=Add TTC as is (fast, compact, original, TTC not supported in all apps)

_opt_GetFontName=0 # Default 0
# For our custom updpkgsums:
# 1=Use Perl Font::TTF to get detailed version and name. (slow)
#   Useful for version comparison or publishing a detailed PKGBUILD.
# 0=Just get the version with sed. Fast. Useful to quick fix sums for installing.

_opt_Optimal=0 # Default 0
# 1=Use only the best versions of fonts and reject suboptimal fonts.
#   The best versions come from a fully updated Windows 8.1 SP1.
#   Installed software like Office shouldn't overwrite the Windows 8 fonts.
# 0=Use whatever fonts are supplied.

# Fixed: Managed font handling including sums, case, and options. source() is not well suited for all the variances in fonts.
# Fixed: Eliminate file conflict with ttf-office-2007-fonts
# Fixed: No more missed fonts, like Andale, Franklin Gothic, Palatino, Segoe and Lucidia Console.
# Added: File copy scripts provided that copy the remaining missing files.
# Added: International font packages.

# TODO: Set record for the largest PKGBUILD in Arch Linux
# TODO: Check all fonts
# TODO: I just copied the 20-*.conf files from ttf-ms-win8. I don't know if they are right.

# BUILD INSTRUCTIONS:
# ----------------------
# This package is based on 'ttf-win7-fonts' package with fixes,
# suggested by AUR's 'severach' user in comments.
#
# This package is intended as a more up-to-date replacement for the AUR
# 'ttf-ms-fonts', 'ttf-vista-fonts' and 'ttf-win7-fonts' packages.
# It provides newer versions of the fonts in these packages.
# Due to license issues and availability the fonts cannot be downloaded automatically.
#
# Please note, that usage of Microsoft fonts outside running Windows
# system is prohibited by EULA (although in certain countries EULA is invalid).
# Please consult Microsoft license before using fonts.
#
# You must acquire them from a running Windows 8 system or install media.
# Any edition of Windows 8.0 or 8.1 will work.
#  - Running Windows 8 system: fonts are located in C:\Windows\Fonts
#    and license file is C:\Windows\System32\license.rtf
#  - Windows 8 install media: fonts are located in sources/install.wim, which
#    is a "Windows Imaging Format" archive. This archive can be extracted with
#    7-zip (p7zip package): "7z x install.wim 1/Windows/Fonts"
#    Alternatively, you can use GNOME's File Roller (and maybe other archive
#    managers) to extract the files if the p7zip package is installed.
#  The 7Zip File Manager can be used in Windows to extract the files.
#  - install media alternate method:
#    You can freely download the Windows 8.1 Enterprise 90-day evaluation from:
#       http://technet.microsoft.com/en-US/evalcenter/hh699156.aspx
#    Fonts are located in 'sources/install.wim' file on the ISO, which
#    is a 'Windows Imaging Format' (WIM) archive.
#    You can extract WIM using wimextract ('wimlib' package from AUR).
#    Put the following script together with previously extracted
#   'Install.wim' and execute:
#       wimextract install.wim 1 /Windows/{Fonts/"*".{ttf,ttc},System32/license.rtf} --dest-dir fonts
#    Fonts and license will be located in the 'fonts' dir.
#
# Fonts are best viewed with Infinality freetype2 packages:
#    https://wiki.archlinux.org/index.php/Font_Configuration#Infinality
# Infinality offers great font rendering and customization.
#
# You need the files listed in the _fonts=() array. Place them in the same
# directory as this PKGBUILD file, then run 'makepkg -scCfi'.
#
# To make it easier to get the 82 fonts without having to pick each one out,
# two copy scripts have been provided. These scripts are disabled to prevent
# errant running and must be edited to enable and adapt them to your
# environment.

# If your Windows doesn't share, _COPY.BAT runs in Windows and copies the
# font files to a Samba share, desktop, flash drive, or some other folder
# you can ftp, sftp, or transfer any way you like.

# _COPY.sh copies the files directly from a Windows share using smbclient.
# Some fonts won't copy due to permissions errors.

# It is possible that the checksums don't match. This is due to the fact that
# different Windows releases may have older or newer fonts than the ones that
# were used to create the package. Some fonts may have been updated by Office
# or Windows Update. I've captured alternate sums for as many fonts
# as I can find. Should you find some fonts that aren't in the various sums
# arrays, the package won't build. First look through the sums arrays.
# If you've found a font source that I haven't then fix the sums. Otherwise
# find a better font source.

# To fix the sums, replace the _fnt256sums array or add to the _fnt256sumsx
# array in this PKGBUILD:
#  - On any mismatch a sums file PKGBUILD.tmp is generated automatically
#    unless you elect for optimal fonts.
#  - Copy and paste the sums from PKGBUILD.tmp into this file, replacing
#    the existing _fnt256sums=(...) array or adding differences to the
#    _fnt256sumsx array.
#  - If you want optimal fonts, replace the faulty fonts from the sources
#    noted as optimal.

# Consider sending me any new sums so they can be added to the PKGBUILD. Include
# the source for verification.

set -u
_pkgbase='ttf-ms-win8'
pkgbase="${_pkgbase}"
pkgname=("${pkgbase}"{,-arabic,-hebrew,-sea,-indic,-japanese,-korean,-zh_cn,-zh_tw,-thai,-other})
pkgver='6.3.9600.17238'
pkgrel='1'
_pkgdesc='Microsoft Windows 8.1 % TrueType fonts'
pkgdesc="${_pkgdesc//%/Latin and International}"
arch=('any')
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=161'
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
optdepends=('ttf-office-2007-fonts')
makedepends=() #'fontforge') # 'cabextract')
if [ "${_opt_GetFontName}" -ne 0 ]; then
  makedepends+=('perl' 'perl-font-ttf')
fi
if [ "${_opt_ConvertTTC}" -ne 0 ]; then
  makedepends+=('fontforge')
fi
provides=('ttf-font' 'ttf-ms-fonts' 'ttf-tahoma' 'ttf-vista-fonts' 'ttf-win7-fonts')
conflicts=('ttf-ms-fonts' 'ttf-tahoma' 'ttf-vista-fonts' 'ttf-win7-fonts' 'ttf-win7-fonts-autodownload')
#install="${pkgbase}.install"
_sfpath="https://downloads.sourceforge.net/corefonts"
source=('license.rtf' 'FONTVER.pl' "20-${_pkgbase}-"{latin,japanese,korean,zh_cn,zh_tw}'.conf')
source+=("${_sfpath}/andale32.exe") # "${_sfpath}/arialb32.exe")
unset _sfpath
_fnts_latinsf=('AndaleMo.TTF') # 'AriBlk.TTF') # Windows Arial Black seems to work now.
# Andale is an IE font, not a Windows font. Without it we can't be a replacement for ttf-ms-fonts.
sha256sums=('096cdd18e26b2b3d8cf0b3ec6a1ffb5b0eaae0fcc2105e3c145f19037a42d467'
            '32d534a6f469c8fc5613fcc5cc0934670da470036a94aa21c6f73c2a0f1ab19e'
            '4c46d930ac139018dff8d00695950251fb5b4306f38a625f0d3ac20b9f3c08e4'
            'd35adbff8bbc8829cd84478b0fe16c78b9930f56c0c4b007f68fb27ada6fa700'
            '3953ca5d604a1f3f6dd5d0ab0b13fa06c19d1de48b0c9e871e89e6c4b20cebcf'
            '700aad3b80067389ba6921bd16c9ebcda152e685330e113c38f1e06a84000619'
            '738a6be15b6c405742cce7f0d9a510e0b5cf8eb92e295db4f1185ebf58d0e9c7'
            '0524fe42951adc3a7eb870e32f0920313c71f170c859b5f770d82b4ee111e970')
PKGEXT='.pkg.tar' # because XZ compression is awfully slow
PKGEXT='.pkg.tar.gz' # XZ takes 8 minutes. TGZ takes 3 minutes. TAR takes the same and is double the space. With no TTC conversion TGZ is less than a minute.
#export BUILDDIR='/tmp/makepkg'

# See sums for font name and known versions.
_fonts=(
#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
arial.ttf      arialbd.ttf    ariali.ttf     arialbi.ttf    # Arial                       6.87
ariblk.ttf                                                  # Arial Black                 5.21
comic.ttf      comicbd.ttf    comici.ttf     comicz.ttf     # Comic Sans MS               5.11
cour.ttf       courbd.ttf     couri.ttf      courbi.ttf     # Courier New                 6.85
framd.ttf                                                   # Franklin Gothic Medium      5.01
                              framdit.ttf                   #   Italic                    5.00
Gabriola.ttf                                                # Gabriola                    5.92
georgia.ttf    georgiab.ttf   georgiai.ttf   georgiaz.ttf   # Georgia                     5.51
impact.ttf                                                  # Impact                      5.10
lucon.ttf                                                   # Lucida Console              5.00
l_10646.ttf                                                 # Lucida Sans Unicode         5.00
#marlett.ttf                                                 # Marlett                     5.00 Symbol
micross.ttf                                                 # Microsoft Sans Serif        6.02
pala.ttf       palab.ttf      palai.ttf      palabi.ttf     # Palatino Linotype           5.02
segoepr.ttf    segoeprb.ttf                                 # Segoe Print                 5.02
segoesc.ttf    segoescb.ttf                                 # Segoe Script                5.00
segoeui.ttf    segoeuib.ttf   segoeuii.ttf   segoeuiz.ttf   # Segoe UI                    5.35
seguibl.ttf                   seguibli.ttf                  # Segoe UI Black              2.00
seguiemj.ttf                                                # Segoe UI Emoji              1.02
segoeuil.ttf                  seguili.ttf                   # Segoe UI Light              5.35
seguisb.ttf                   seguisbi.ttf                  # Segoe UI Semibold           5.35
segoeuisl.ttf                 seguisli.ttf                  # Segoe UI Semilight          5.35
seguisym.ttf                                                # Segoe UI Symbol             6.09
Sitka.ttc      SitkaB.ttc     SitkaI.ttc     SitkaZ.ttc     # Sitka Banner                1.10 Latin, Greek and Cyrillic
#Sitka.ttc     #SitkaB.ttc    #SitkaI.ttc    #SitkaZ.ttc    # Sitka Display               1.10
#Sitka.ttc     #SitkaB.ttc    #SitkaI.ttc    #SitkaZ.ttc    # Sitka Heading               1.10
#Sitka.ttc     #SitkaB.ttc    #SitkaI.ttc    #SitkaZ.ttc    # Sitka Small                 1.10
#Sitka.ttc     #SitkaB.ttc    #SitkaI.ttc    #SitkaZ.ttc    # Sitka Subheading            1.10
#Sitka.ttc     #SitkaB.ttc    #SitkaI.ttc    #SitkaZ.ttc    # Sitka Text                  1.10
sylfaen.ttf                                                 # Sylfaen                     5.03
symbol.ttf                                                  # Symbol                      5.00
tahoma.ttf     tahomabd.ttf                                 # Tahoma                      6.03
times.ttf      timesbd.ttf    timesi.ttf     timesbi.ttf    # Times New Roman             6.87
trebuc.ttf     trebucbd.ttf   trebucit.ttf   trebucbi.ttf   # Trebuchet MS                5.12
verdana.ttf                                                 # Verdana                     5.31
               verdanab.ttf                                 #   Bold                      5.30
                              verdanai.ttf                  #   Italic                    5.30
                                             verdanaz.ttf   #   Bold Italic               5.30
webdings.ttf                                                # Webdings                    5.00 Symbol
wingding.ttf                                                # Wingdings                   5.00 Symbol

#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
calibri.ttf    calibrib.ttf   calibrii.ttf   calibriz.ttf   # Calibri                     5.87
calibril.ttf                  calibrili.ttf                 # Calibri Light               2.12
cambria.ttc    cambriab.ttf   cambriai.ttf   cambriaz.ttf   # Cambria                     6.82
#cambria.ttc                                                # Cambria Math                6.82
Candara.ttf    Candarab.ttf   Candarai.ttf   Candaraz.ttf   # Candara                     5.61
consola.ttf    consolab.ttf   consolai.ttf   consolaz.ttf   # Consolas                    5.34
constan.ttf                                                 # Constantia                  5.91
               constanb.ttf                                 #   Bold                      5.90
                              constani.ttf                  #   Italic                    5.90
                                             constanz.ttf   #   Bold Italic               5.90
corbel.ttf     corbelb.ttf    corbeli.ttf    corbelz.ttf    # Corbel                      5.61
)

_fonts=("${_fonts[@],,}")
_fnts_latin=("${_fonts[@]}" "${_fnts_latinsf[@]}")
unset _fnts_latinsf

# Some fonts we don't want.
# '511db37f04906eb2e77a91949edb04a61ce9838e9523011621dff4971a8d5867' #     marlett.ttf   en-US Version 5.00 Marlett

# Fonts pulled from Sourceforge
# 'dad7c04acb26e23dfe4780e79375ca193ddaf68409317e81577a30674668830e' #     AriBlk.TTF    en-US Version 2.35 Arial Black
# '48d9bc613917709d3b0e0f4a6d4fe33a5c544c5035dffe9e90bc11e50e822071' #     AndaleMo.TTF  en-US Version 2.00 Andale Mono

# The newest fonts found in a fully updated Windows 8.1
# These are the optimal fonts.
# _fonts and _fnt256sums must be in the same order. _fnt256sumsx can be in any order.
_fnt256sums=(
  'ad9ec01845a9e8707a4807ae26aeda8f90a4e3d62b8a62a224a6a7432590abb5' #   1 arial.ttf     en-US Version 6.89 Arial
  '0d5d1482307b800ec9c49f77cb6648666f88bcf2d0ce957f52af4e0fc3c6fcf8' #   2 arialbd.ttf   en-US Version 6.89 Arial Bold
  'bbc3f1fbcec46e834cb4c44b557f2d893c5fcfc50b20275825227431272d486f' #   3 ariali.ttf    en-US Version 6.89 Arial Italic
  '0aa21703a9907ebb13d988d8268e2b0868a19860ee9ed523adec306b5a26ae3c' #   4 arialbi.ttf   en-US Version 6.89 Arial Bold Italic
  '7bff8efabe06bb665d168a1b063c1ae56e3edc058106adb1d8ec5f582f357174' #   5 ariblk.ttf    en-US Version 5.21 Arial Black
  '1300142c0886fca1155689241d1f6a3c6c6d3cb9c292e7a47db7e6417401ddee' #   6 comic.ttf     en-US Version 5.11 Comic Sans MS
  'f13a7e4419f5e9d9b8efb2c436675f66607bf98e2d596b8c296d7b250f4c877b' #   7 comicbd.ttf   en-US Version 5.11 Comic Sans MS Bold
  '04bc106970b51bf365ac2d6f7c88d4171f489e512f42229d39a0fd375ca0f956' #   8 comici.ttf    en-US Version 5.11 Comic Sans MS Italic
  'c301881da0894256a919e819b944f1cad7eea8060330ff1a48acacd6323fd4b2' #   9 comicz.ttf    en-US Version 5.11 Comic Sans MS Bold Italic
  'eac3a438f29fdec80597c21dfe12fa30332b2e576262d89be3e7d59342ff5822' #  10 cour.ttf      en-US Version 6.87 Courier New
  'c79c29eb4be2994bcca3d94eb77d34227852e06cf2a32183ab92372e567b1c4e' #  11 courbd.ttf    en-US Version 6.87 Courier New Bold
  'c7ef56313cad91b254fd9092516cb93e423570e98a93a6a193775254ed5d7d97' #  12 couri.ttf     en-US Version 6.87 Courier New Italic
  '10af152a0e2dd42c4b6a41a560f55fda0b241defcea87b110b949f02d16df12b' #  13 courbi.ttf    en-US Version 6.87 Courier New Bold Italic
  '2d648599fc7acacb024ab08a0720a62e2f2cc070ff19582eb9b5c824e1515ecb' #  14 framd.ttf     en-US Version 5.01 Franklin Gothic Medium
  '68f1597a57a071f291449e66c888c1b86ad617d8eb18da52c7c2dbdf781ddc2f' #  15 framdit.ttf   en-US Version 5.00 Franklin Gothic Medium Italic
  '29eaa6d65d0f1508d2d550d5ddf4e7e3a4e23cf13b376ff93140a8a6115b2f82' #  16 gabriola.ttf  en-US Version 5.92 Gabriola
  '4e1830dffc05312a5910afe4aa492ce1d3848f37c52cc0132ed86aca9f84d705' #  17 georgia.ttf   en-US Version 5.51 Georgia
  '7365d280c2a48b983aea4491ce1d94600456e9e3f1f78b80e66f613ef44d69b1' #  18 georgiab.ttf  en-US Version 5.51 Georgia Bold
  'f2414e11ba2767f39be169e456e9a37845f2ed35cc9ce087d4933131860e6edd' #  19 georgiai.ttf  en-US Version 5.51 Georgia Italic
  '8958ed20eb2a92af41a209c32693af960a53a8dfb827fe8bbc3498e904c06c2d' #  20 georgiaz.ttf  en-US Version 5.51 Georgia Bold Italic
  'f93975b19a5d23890387f910786c7c7d4e91aeeb134690f1ea64278fa73f9371' #  21 impact.ttf    en-US Version 5.10 Impact
  'f4df4d6d1a69d24e08da2ad2f45203b4c7147ddaa5187ccd73087903ca36d177' #  22 lucon.ttf     en-US Version 5.00 Lucida Console
  'b9ed2bf08381f8b763673504d82b27c6e029156c73cede54e551e59fe8e940da' #  23 l_10646.ttf   en-US Version 5.00 Lucida Sans Unicode
  '4bf147ffed57f50cf5c43b11bbee0eb0a650f4549bda664660d28184fea04080' #  24 micross.ttf   en-US Version 6.03 Microsoft Sans Serif
  '2e03ecf35b3643c33ec0d68488f24b1caebed6fe7b40706603e6ca5a4fcfb9e1' #  25 pala.ttf      en-US Version 5.02 Palatino Linotype
  '66a97fa5d1afa922772377b68fc6a8c18eb11a9972a76da2aee6920c1e5b0bbf' #  26 palab.ttf     en-US Version 5.02 Palatino Linotype Bold
  'ffce42ca79bc15e453241e00a07bad6d4b1b1c1929a17a546b18602c999137e2' #  27 palai.ttf     en-US Version 5.02 Palatino Linotype Italic
  '1ec4e73e81f09fe867bb1e3a61496ac1eec382b53395ebf6b71b5c268a210f73' #  28 palabi.ttf    en-US Version 5.02 Palatino Linotype Bold Italic
  'ecf3f898c2970377f7853ff7d7dd973e069bb8fd6264a36c01fff56ee28af701' #  29 segoepr.ttf   en-US Version 5.02 Segoe Print
  'f1b950b4ffbcd71c581ecdaea184b789e1dbbc43da6391c790c096812b20f769' #  30 segoeprb.ttf  en-US Version 5.02 Segoe Print Bold
  '8f6328619340426b2c985f6fd305bb64d164b20b20a5b493a21533761bd5d631' #  31 segoesc.ttf   en-US Version 5.00 Segoe Script
  'abf76b314ca2432ab718a74a4028bb7707073cb0d50643547c59f41a540b66a5' #  32 segoescb.ttf  en-US Version 5.00 Segoe Script Bold
  'd118a62c7f119bcc534e6ee6082e3f02de276134fe6458ea15d1a7a343423931' #  33 segoeui.ttf   en-US Version 5.36 Segoe UI
  '5ddd8502db01c86f1fbefdec1f74c9e96befbe60e4347485100498a960ce3fe3' #  34 segoeuib.ttf  en-US Version 5.36 Segoe UI Bold
  '84e896ff1226423101da537121fec3165d5be027d94850f263383aea2826977c' #  35 segoeuii.ttf  en-US Version 5.36 Segoe UI Italic
  '5807a6614a9fb3337bcce57147c75786b0a74e8e43c39e760f44e45c2ed355bf' #  36 segoeuiz.ttf  en-US Version 5.36 Segoe UI Bold Italic
  '4098759bea7de30a5d9d38f90e8d0efd1d2fbba59046d35bf37269d717fa775c' #  37 seguibl.ttf   en-US Version 2.00 Segoe UI Black
  '99af6bcc95341bb123b40ae3a5ba5d1cbc8957dedfbe82cc6a80a02c08dfd86d' #  38 seguibli.ttf  en-US Version 2.00 Segoe UI Black Italic
  '86be288eed6561684be645f671409210c914815e3833a0fc3b587cbf64c03928' #  39 seguiemj.ttf  en-US Version 1.02 Segoe UI Emoji
  'f1a7c2d1a8c189dde9b3059208a44ed983df413ae22b21b8921af11806fd2b6d' #  40 segoeuil.ttf  en-US Version 5.36 Segoe UI Light
  'a8726b97b6e1448310b2aa3770057265c27947995a6fbf46eab8b5cafa090e67' #  41 seguili.ttf   en-US Version 5.36 Segoe UI Light Italic
  'cf78bb24e9a4dd03b757f53c4eb06cc26e0506d6c067040a9d525744ac851096' #  42 seguisb.ttf   en-US Version 5.36 Segoe UI Semibold
  '2fd82b20527680176d20daae808a3dd40954b36369d64bf1be553fbc3b286ef4' #  43 seguisbi.ttf  en-US Version 5.36 Segoe UI Semibold Italic
  '9f531b6922c51c8ab56434e8e4edcbba1749daf614f891c9346475b60eecc8a9' #  44 segoeuisl.ttf en-US Version 5.36 Segoe UI Semilight
  'f90bba27353cf9798bd9c32a823bb7bcf42efea054b43df5edd842cc3493c90f' #  45 seguisli.ttf  en-US Version 5.36 Segoe UI Semilight Italic
  '42af95efff24f0f1f5a1eb538bcb9002a7edf9bdf52faec0e9f1f4fe3f2122ab' #  46 seguisym.ttf  en-US Version 6.09 Segoe UI Symbol
  '299f52434e98c9e437eeae1c8f9348ce4118e30cf6c70aec5759c69460eaca67' #  47 sitka.ttc     en-US Version 1.10 Sitka Small; Sitka Text; Sitka Subheading; Sitka Heading; Sitka Display; Sitka Banner
  'bd87d32c318ed103dd7e442baf6f58ccff3c757dab06e016918d821362c7feb3' #  48 sitkab.ttc    en-US Version 1.10 Sitka Small Bold; Sitka Text Bold; Sitka Subheading Bold; Sitka Heading Bold; Sitka Display Bold; Sitka Banner Bold
  'bedd8106542fc2c92df882e872ce97292617a37b4dc8b6b53a35ce41b9eac0b8' #  49 sitkai.ttc    en-US Version 1.10 Sitka Small Italic; Sitka Text Italic; Sitka Subheading Italic; Sitka Heading Italic; Sitka Display Italic; Sitka Banner Italic
  '00e3e3d43f72337c8e81e49ded3ee6b1568f924bbe54a9cf6f14a38f6b9cdfde' #  50 sitkaz.ttc    en-US Version 1.10 Sitka Small Bold Italic; Sitka Text Bold Italic; Sitka Subheading Bold Italic; Sitka Heading Bold Italic; Sitka Display Bold Italic; Sitka Banner Bold Italic
  'fdba5038c6f0c340c6ec6660d260dba2779b57bd2889c70ab2cc210a56d581fc' #  51 sylfaen.ttf   en-US Version 5.04 Sylfaen
  'bffdc2fd675d9af414824ae84d8456504542480afb34fbc6bfd6903656c4f854' #  52 symbol.ttf    en-US Version 5.00 Symbol
  '0a864b4e0de1fe410433368a32049c65ef49559be54d6f27fa1815529e6a5d2e' #  53 tahoma.ttf    en-US Version 6.04 Tahoma
  '6e8643df40eaea8a12fdf2f06bc94f0f3cd961ac6a4c9fbbb5a679c60fbbf3a4' #  54 tahomabd.ttf  en-US Version 6.04 Tahoma Bold
  '2db6b20e28118aac2133eadec2cc28da9fcd044b91e9b32f1482003dedf4bf16' #  55 times.ttf     en-US Version 6.89 Times New Roman
  '341b64175520b48022204ba291ad1f5d851478dac4921c2965526f9ff1633a2f' #  56 timesbd.ttf   en-US Version 6.89 Times New Roman Bold
  '3ee61e4c404b0ab978c73bd50430b05579651a1c57c9ad779a3ae8f7c70bffeb' #  57 timesi.ttf    en-US Version 6.89 Times New Roman Italic
  'd9bc900f3ee4637a52319b1644ccbb4626b19da4751e298e2f30c0497be9d912' #  58 timesbi.ttf   en-US Version 6.89 Times New Roman Bold Italic
  '0d6bfbbd650cafcf0297c6caae7f943942000f23f17f2ac10160b79483349383' #  59 trebuc.ttf    en-US Version 5.12 Trebuchet MS
  '39ba1197fb67b5a956f2f7adf74a0d002d699193b29da6d7f4eca0fa48197629' #  60 trebucbd.ttf  en-US Version 5.12 Trebuchet MS Bold
  '380aaf0170d8a47330baf0089dbb2a003ccbf99e9544d9c7153660734a474a19' #  61 trebucit.ttf  en-US Version 5.12 Trebuchet MS Italic
  'b4660979562832e81b317992e8303f49a0c0548ca2ad52c1ae9a03f9d2fd77a2' #  62 trebucbi.ttf  en-US Version 5.12 Trebuchet MS Bold Italic
  'bbd6f974d877a53b320410529ff1e9295148b3bac5a14029910adac1607a77eb' #  63 verdana.ttf   en-US Version 5.31 Verdana
  '174568c4633a8a688d579d283f7508c16e437434fd5ac97d4ce30dfc42d0860b' #  64 verdanab.ttf  en-US Version 5.30 Verdana Bold
  '377be5cc51493f716c6aa89f539c532f78fc0b39c7ddd6c708a2dac345cda93b' #  65 verdanai.ttf  en-US Version 5.30 Verdana Italic
  '2c5aa27b62da26f432406852303acad6fdc9121b73f468c75fae33ade799ea81' #  66 verdanaz.ttf  en-US Version 5.30 Verdana Bold Italic
  '1161ce511c44eb5464a4f8144aaf3eb965a50ed66957ad7d38e497ab9d958e5a' #  67 webdings.ttf  en-US Version 5.00 Webdings
  'd7c38355bd52f52e043ed904f3463d476925300d1bdca9e842b28077ca3549b8' #  68 wingding.ttf  en-US Version 5.00 Wingdings
  '7c9fe627fac9da578a9305443e061c6f5d810ebdd8dc48b0ca10b77cc25c0878' #  69 calibri.ttf   en-US Version 5.89 Calibri
  '362e8cdd5ebebde02754c5cd3f694241f6ca594c9f9a114d5f2b3639a57b8758' #  70 calibrib.ttf  en-US Version 5.89 Calibri Bold
  '34b67e0896f29ba0464b4d9e70e07481e4a82f1853d8d28e93eba6b8428d3b27' #  71 calibrii.ttf  en-US Version 5.89 Calibri Italic
  'ec3fab54c5ab574137cddfb8a27911e36674b9a6ae3ba26f3fccef0a669c4be3' #  72 calibriz.ttf  en-US Version 5.89 Calibri Bold Italic
  '0b2bc54a8fa93b0ee26709135a3a8b945386978a9362d744e2df67c6639774f3' #  73 calibril.ttf  en-US Version 2.14 Calibri Light
  '1f4ae9bed79a2dd0c6264c790fcc82f7edd1dc0d7b794ed261c4a88fbd28bc2b' #  74 calibrili.ttf en-US Version 2.14 Calibri Light Italic
  '92bd446b2dd4a69aa290bfdec065d04804f68dd05a93d9fdc0a080cdb32b96bf' #  75 cambria.ttc   en-US Version 6.84 Cambria; Cambria Math
  '08c8c15674676bc540798f775b7043c4ec61493647273fb7242ec095c145c69d' #  76 cambriab.ttf  en-US Version 6.84 Cambria Bold
  '9b1e51ba3b1f78e7665e6bc28fa338c3e3ba3d52d1e6864b3d76c7ca159687ac' #  77 cambriai.ttf  en-US Version 6.84 Cambria Italic
  '0ef9c355b05734df9ceb7c08a47da928d19f512626b7686d90ca2df493b0e016' #  78 cambriaz.ttf  en-US Version 6.84 Cambria Bold Italic
  'f4cc0c11780a2d94cd6b74ed54fa657f26677013028c956ecb40da81c6b59b9e' #  79 candara.ttf   en-US Version 5.61 Candara
  'f959e0709a770094814199e49b0441b13e2bb075475b7ed2125ead7841ff2215' #  80 candarab.ttf  en-US Version 5.61 Candara Bold
  'da786a0df49cd2f45a9a8dc67120ec534e4624bf168829947bb08c4f937c21ad' #  81 candarai.ttf  en-US Version 5.61 Candara Italic
  'c2017a26bbd51775376baa93ba63095ba90a955c0eb93bbe44b9e73e0958fd73' #  82 candaraz.ttf  en-US Version 5.61 Candara Bold Italic
  '5e9b08f769a89330e98462e373ae8e5c4e67594a0ca4a517f8498d698b0ae821' #  83 consola.ttf   en-US Version 5.36 Consolas
  '4d043e41c898dbf6e49b5fca06bfbcc47a6add8ee2a45eae6bc4e4c0846dfaba' #  84 consolab.ttf  en-US Version 5.36 Consolas Bold
  'a059b9e0cb319da644f9055b24346798717cf27737e7f9bf0d5f2d102953b0e8' #  85 consolai.ttf  en-US Version 5.36 Consolas Italic
  '9abbbd8c0fb2c7edb79ce3b5b08802a6c92b9e8474320c620ff98749b044993f' #  86 consolaz.ttf  en-US Version 5.36 Consolas Bold Italic
  'cbe6c682f09b600d45f614be798a096c2a784c568020319e6168eec3f0619dc0' #  87 constan.ttf   en-US Version 5.91 Constantia
  '11a7a1c6b1b4028cd7e55f60a9773ecc7d39b66b8f82f5b7c6fbf8a4fdfcf94e' #  88 constanb.ttf  en-US Version 5.90 Constantia Bold
  'be0306e2040aeeed8bf228524071f4b941d28cbdd3ff413a9db07d1da9213ec9' #  89 constani.ttf  en-US Version 5.90 Constantia Italic
  '6bf361ae27d2f67e05d9ad0fa6e0bc4e16c2ada6926d6c24b557e2547f4f242e' #  90 constanz.ttf  en-US Version 5.90 Constantia Bold Italic
  '83f5b36107f7ea50fd5c52b1c3e8d64de3edc5d0f2c2e2e9f634fbbcfd7abd74' #  91 corbel.ttf    en-US Version 5.61 Corbel
  '2d3fb4d471e9669a5ab2bc8aa9b359639e17af321510f3b878bae03bc259b056' #  92 corbelb.ttf   en-US Version 5.61 Corbel Bold
  '7e9cd651666dce6dd3ad37b8199c7798b226b8995d35e6b672b53ce0bbec59cb' #  93 corbeli.ttf   en-US Version 5.61 Corbel Italic
  '9c68522951940ad49354f4fce56b528414a7e83c44474ceea0582a5434693066' #  94 corbelz.ttf   en-US Version 5.61 Corbel Bold Italic
  'c3582b918a37d1e790e20201538f83cf9abbfe1da1f365a6e185da95e5e65e4e' #  95 aldhabi.ttf   en-US Version 1.00 Aldhabi
  '344d04c650b6c7395052d885ed3f991f2c6a03334e2cc01fa035db755bbafb5b' #  96 andlso.ttf    en-US Version 6.00 Andalus
  'cb1d9b15973fdeacfa91790cba73513a96198bcfa49ad79dbdeaeea14ab4cf28' #  97 arabtype.ttf  en-US Version 6.00 Arabic Typesetting
  '545c6d4851aff59b69e4497571d839f9de10d4826051ab9e43ad1a76a2c07743' #  98 majalla.ttf   en-US Version 6.81 Sakkal Majalla
  '39a018898bd1909d3ef8236d0a4042f95a8e3028585e56297ba870e93152ecac' #  99 majallab.ttf  en-US Version 6.81 Sakkal Majalla Bold
  '2c33bc74c77b8b50607269d7ddb652b57c07d8251b600f458a29560014822db4' # 100 simpo.ttf     en-US Version 6.00 Simplified Arabic
  'c850629a1c374598dca85e316fb1db749a1de2e90064bf9c926fcace89d4c8ef' # 101 simpbdo.ttf   en-US Version 6.00 Simplified Arabic Bold
  'ab44ea1e8026f50336226d56ab6b9c8c970b30d24ec7bfcb9aef56b92a553fce' # 102 simpfxo.ttf   en-US Version 5.92 Simplified Arabic Fixed
  '5367b11550135c73c3c36112ba0d1a578cd016e7b465bf2a19faf0ddf82dfa20' # 103 trado.ttf     en-US Version 6.00 Traditional Arabic
  '577732b9e2b7421ae5c1acbe129a524b4dd91e761f911aa466e3c28aa5a56494' # 104 tradbdo.ttf   en-US Version 6.00 Traditional Arabic Bold
  '5f9212b7c496c4bf30371e414cc2f233b40427859bc7a6231daeb3ac0aa5b258' # 105 urdtype.ttf   en-US Version 6.00 Urdu Typesetting
  'f4c9e3ccea34ae0e80f64f596e2cb255e5285ce1372791a4fd1e1ec33d66c5b1' # 106 urdtypeb.ttf  en-US Version 6.00 Urdu Typesetting Bold
  '67b0eb541d6fa175f66462d6f67cdcf3aa33fa68518d9638cd01f0b30a1ace18' # 107 ahronbd.ttf   en-US Version 5.10 Aharoni Bold
  '36195afafaeaa7b69316673a81ab75df5c0768ab7e31a904b08b0bb8ccaf7c77' # 108 david.ttf     en-US Version 6.00 David
  'e83c2786178a634e759102c65f14c132108df5cdc9973f976906f1fdeafb753a' # 109 davidbd.ttf   en-US Version 6.00 David Bold
  '3d136d72da90110705ec941cef0f43b6130d5c19c1ac240dff57d307a2baa480' # 110 frank.ttf     en-US Version 5.10 FrankRuehl
  '475f8a2fbaadf3f1ff1af8be38863a73a55c46cf028d5d5aa1bb6ed550849623' # 111 gisha.ttf     en-US Version 5.01 Gisha
  '8964c68c2c8379de381cc04aaa54214fbb20d40b27cf6c674893b04facb03dac' # 112 gishabd.ttf   en-US Version 5.01 Gisha Bold
  '39198c907622033a06689814ec2b1b5baf7802c35c01352eb80d29339902be08' # 113 lvnm.ttf      en-US Version 6.00 Levenim MT
  'cf36592d517bee71662c66de2d4da49f097a1a57ad8cccae8dedcc21c65eac8e' # 114 lvnmbd.ttf    en-US Version 6.00 Levenim MT Bold
  'f33f9cbc89a2c762c2c4848d507ee1d9a2f45baa9fe092949d0c97d60d9d8131' # 115 mriam.ttf     en-US Version 5.10 Miriam
  'fc9c95e3dfc0997428940416fdb3979d2ca61909486c9992d59b5b81ae6cfacc' # 116 mriamc.ttf    en-US Version 5.10 Miriam Fixed
  'a334a89e21d97cd5d201ebfd731b7a754a69ea036de9f4e02d4df8b2af7b3cba' # 117 nrkis.ttf     en-US Version 5.10 Narkisim
  '44e8ff8682d518188aa1e3ac99b9c23a41adae8778f824aaca6f695b38314475' # 118 rod.ttf       en-US Version 5.10 Rod
  'a5fbba083a9a530629f9282abcd2d63d0e9ea3c4ad652548453cd9233af63470' # 119 shonar.ttf    en-US Version 6.81 Shonar Bangla
  '8d9c9df1b78741d1ec3efcd40494f8d13a5b2b9b9c441969ac50069e6a4ee2c6' # 120 shonarb.ttf   en-US Version 6.81 Shonar Bangla Bold
  '221352b83e1533cf0cc1af02ba1f95078e3bf9c6224065ccd24f372099af5617' # 121 aparaj.ttf    en-US Version 6.00 Aparajita
  '96891d989b2061078311b3a8335ff32304d35898ff758ef3a4efc140cca98dc2' # 122 aparajb.ttf   en-US Version 6.00 Aparajita Bold
  '7b54dffb36db3dfe37da396d6b0fa3be56ed9b204e639f5775eb4177fbbccfc1' # 123 aparajbi.ttf  en-US Version 6.00 Aparajita Bold Italic
  'fdfc09d111b80fbfdcaa99f71a8dd493acedeff6d114126f89dd19f62bf35b0a' # 124 aparaji.ttf   en-US Version 6.00 Aparajita Italic
  'c748aca1f98492f74bc7760624a8f6fd97ae095771e17ae07c2e4a2f8dae85e3' # 125 kokila.ttf    en-US Version 6.00 Kokila
  'd0ecd4c84f05d5b07b16fb55101fe8508b63980961cf7961ae25016395f6e4e0' # 126 kokilab.ttf   en-US Version 6.00 Kokila Bold
  '6899af2792457c071cea5b39e97dee54eb26af1297aa51ed59a8dbeac7af2cb1' # 127 kokilabi.ttf  en-US Version 6.00 Kokila Bold Italic
  'aee3cb1c75833ffae684f1bb3d99cb2950485171863d82649e58d14e42d5657d' # 128 kokilai.ttf   en-US Version 6.00 Kokila Italic
  '0dba2fc003d538720f9f0a2046769572fc7a050187a68ef21568b94562f74fe1' # 129 mangal.ttf    en-US Version 6.00 Mangal
  '67e4661b041dd5fffc1417d137d1138b3a145fe7b7e6711f62f1c9bd3bae1915' # 130 mangalb.ttf   en-US Version 6.00 Mangal Bold
  'a0bbd7043cd47231424e26c6e82501e39f75bfb29fd00ac6f3615c22aadce34c' # 131 utsaah.ttf    en-US Version 6.00 Utsaah
  '8eed0f36f36d5020fab2553a4dfd1d569ce75ba1b8f9b6cb1995c9ad856213c0' # 132 utsaahb.ttf   en-US Version 6.00 Utsaah Bold
  '1eb03ff3021da102fca0749e5d1e10b28c74bdcc6525632167fea6ac27e8649d' # 133 utsaahbi.ttf  en-US Version 6.00 Utsaah Bold Italic
  '1c10a13bb16920e7de95a2d5a85bb05be07087630e49f9ce1a23c20021ac330d' # 134 utsaahi.ttf   en-US Version 6.00 Utsaah Italic
  'f66aafad5733b8fba42f4335e781db0a0300b90b904fa39a21940f4596859fe5' # 135 shruti.ttf    en-US Version 6.00 Shruti
  'e7d9fe97adcba2a82930e0c7ee2259491ed7c798d3473e1754b023d499d78913' # 136 shrutib.ttf   en-US Version 6.00 Shruti Bold
  '1bf10658542e10288e84e046b54c9fb8c3a84e6a7866162505508d33237a4cac' # 137 raavi.ttf     en-US Version 6.00 Raavi
  'b238697bf107096e4adf3d227527c72258ce4c77e96981968e2e1f33abc2e211' # 138 raavib.ttf    en-US Version 6.00 Raavi Bold
  '9da7b75179a25f7b003dfe06418b79dcda911448b6c90c4f272360aaf61ef1cf' # 139 tunga.ttf     en-US Version 6.00 Tunga
  '08e7b31fec2a9fc18b163aa573e1309fee8fa6ed502185682c07218001c3906d' # 140 tungab.ttf    en-US Version 6.00 Tunga Bold
  '590fcec6d6efa2b2673e37ec67dfa425edc7862e872827cf550bdbb8714a1f3d' # 141 kalinga.ttf   en-US Version 6.00 Kalinga
  'bf0dad25b64870d790c278fbbecf06eb9533bf25a73b7e06eec034f916cda53d' # 142 kalingab.ttf  en-US Version 6.00 Kalinga Bold
  '108226242076e84de48cf1e4e53ee2e8b2d05d0dd98de00dc31908e13dca2989' # 143 kartika.ttf   en-US Version 6.00 Kartika
  'edb9c1dfa6e54001a86399aded9da37dabe57486266a361b41ef25bc68ee245c' # 144 kartikab.ttf  en-US Version 6.00 Kartika Bold
  'ff36c5a4cea53a6344ea411c95ff19087af773546d93c8fe11c41b05e76f3204' # 145 iskpota.ttf   en-US Version 6.00 Iskoola Pota
  '26f215dfc37776e366f3a8ca4cd18ba4b9a63863fff0c685a625afa7bda44de8' # 146 iskpotab.ttf  en-US Version 6.00 Iskoola Pota Bold
  '17d2b1f7afd83c32b0cfac106e9ebd85dda21d09fdf4e7e1644e9d0c5ecb1707' # 147 latha.ttf     en-US Version 6.00 Latha
  'e24b4e84571283b0221c77e77b06932bc457c5346cf14301db201dc835cc3b15' # 148 lathab.ttf    en-US Version 6.00 Latha Bold
  '73e47a7da2e80adc91299fe22e7ae93c88219f7a7c162b92a79a3414f80403a1' # 149 vijaya.ttf    en-US Version 6.81 Vijaya
  '15775010161c9f0de0ff2057c25644b1be821f66612366e71d1c56cfd8a9684f' # 150 vijayab.ttf   en-US Version 6.81 Vijaya Bold
  'a14e6503297b169d63e59591f15c69183a8e061c0b0d539cf1f2a8597ad880d9' # 151 vrinda.ttf    en-US Version 6.81 Vrinda
  '068dabccca71f81925e0eb432e3caec7f0d3f5cc59d56bf0dc5530566d564956' # 152 vrindab.ttf   en-US Version 6.81 Vrinda Bold
  '82133c6547b059b8aa28ff9fc2299d5f9002263c1e1ee4023c509556474c9e8d' # 153 gautami.ttf   en-US Version 6.00 Gautami
  '372dd0e86075711c25619ea1264cdad5ef1cce408b1fe258d4796a967b51de7b' # 154 gautamib.ttf  en-US Version 6.00 Gautami Bold
  '0e84f5bdae34cea321235a58ae2001b84948bf33e50252481a8a4b75474c07e7' # 155 vani.ttf      en-US Version 6.81 Vani
  'bf0acda08465b77fe7a314d698535fe59db4c179c3b9f8d172bfe9c2a493d66b' # 156 vanib.ttf     en-US Version 6.81 Vani Bold
  'df73c7658f367a2f446e6035024545f6f68c1d95fe71fbde4fd644ecf1ad0c74' # 157 meiryob.ttc   ja-JP Version 6.20 Meiryo Bold; Meiryo Bold Italic; Meiryo UI Bold; Meiryo UI Bold Italic
  '4388cc84338b3057b4b093cfe733614856b8de5bf57ef30bb79dc2c65682a107' # 158 meiryo.ttc    ja-JP Version 6.20 Meiryo; Meiryo Italic; Meiryo UI; Meiryo UI Italic
  '762bf8b66dddc38a05a379d16b9b86c3253a2c78cbe1e81a1cc49b18838d55bb' # 159 msgothic.ttc  ja-JP Version 5.10 MS Gothic; MS UI Gothic; MS PGothic
  'a9603003aa8b13f1c360919d528b3e2a0ca59c1bc74a0506691e0d64a88fa92b' # 160 msmincho.ttc  ja-JP Version 5.10 MS Mincho; MS PMincho
  'fda72f7e66bdd83644bdaea2696b3291a8f0416f9e1369221f31d4e75e93e6c6' # 161 yugothib.ttf  en-US Version 1.55 Yu Gothic Bold
  'fc9e3cf9e29f473d208f105a55de4105a798b5a74fecff76e055123b1e0008f1' # 162 yugothil.ttf  en-US Version 1.55 Yu Gothic Light
  'c4161dbe6d6ac38451cefbd22685acfe3ffd44ea1918846ea031072b66187fc2' # 163 yugothic.ttf  en-US Version 1.55 Yu Gothic Regular
  'fcb58baf4145cbc2010dbe83988a991a5572944a82da4e0713e89eef2bff706b' # 164 yumindb.ttf   en-US Version 1.55 Yu Mincho Demibold
  '6bf90baf218054c6914bc3828df0120fada11152dddb15574e8209fb6d271f35' # 165 yuminl.ttf    en-US Version 1.55 Yu Mincho Light
  '5effadfaeb9efec0519485e8c000dfce138b05e4346eae3627e6c761e5d0e00f' # 166 yumin.ttf     en-US Version 1.55 Yu Mincho Regular
  'aea7b99f51f6b3faae07adcee86b8563f76a206483db9590581f35e8b67d58b9' # 167 malgun.ttf    ko-KR Version 6.50 Malgun Gothic
  'f4f57a19450e3bc60fd5f93a0164351742988b329caf9b5ade2914491a021d43' # 168 malgunbd.ttf  ko-KR Version 6.50 Malgun Gothic Bold
  '091bab43d565fca1e500ceac91c57569bfae31d393d8a7987611dcd259eafe19' # 169 batang.ttc    ko-KR Version 5.00 Batang; BatangChe; Gungsuh; GungsuhChe
  'a167be36290c0696737da35eaf48b7ce7704d930985406a1e661f94e54fd191a' # 170 gulim.ttc     ko-KR Version 5.01 Gulim; GulimChe(5.00); Dotum(5.00); DotumChe(5.00)
  '49f9d5beb6b969d7b8a324fd2a5455bdbff8a4550a16f17372d36394dcb6810f' # 171 gadugi.ttf    en-US Version 1.06 Gadugi
  '7903c2f32a03f15fb530ac6af91de8f24644c63e86010b405d6ec7067d60dc06' # 172 gadugib.ttf   en-US Version 1.06 Gadugi Bold
  '111e9a7c41923626e6292b1c10c737eba893883c8d581f45bbbe7554486b51ca' # 173 nyala.ttf     en-US Version 5.01 Nyala
  'ec6fbf1ada52c339fcc8f22b012a7d0daddc442e4580510df739e0b5362b042c' # 174 ebrima.ttf    en-US Version 5.08 Ebrima
  'aba69d8121f37dd6d91d510a418750f0181b98a317b0884950c256806baa9c9d' # 175 ebrimabd.ttf  en-US Version 5.08 Ebrima Bold
  '7a74709fed27bfe3fb45c71ff3890bb9e3dacd43fc30e05c687017eb7f90822a' # 176 plantc.ttf    en-US Version 5.07 Plantagenet Cherokee
  'a3fb1c2c9d4d997f6d8c8805365b11865dcb582b4d6c27f13974c53b4f4efae0' # 177 estre.ttf     en-US Version 6.00 Estrangelo Edessa
  'f868204f2e0e21e6505cce1239501daa1c94ebcf7c956cfdb8cf7392666f5194' # 178 mvboli.ttf    en-US Version 6.00 MV Boli
  'bca2070adfbcad34b98dc9c2da03a34785f59093846d38bdc20e1bfd7aa1c9d5' # 179 euphemia.ttf  en-US Version 5.05 Euphemia
  '0bfea90a3fbc054af58cf685480c8945a395e53f4ecbbdacfba8f46e7ed88ddc' # 180 phagspa.ttf   en-US Version 5.97 Microsoft PhagsPa
  'fb1ce8e63d60deb36b29c9650c15085fee1c7491e8cd9a22ae08a15e27f6c48b' # 181 phagspab.ttf  en-US Version 5.97 Microsoft PhagsPa Bold
  'a38ee65ac36102201e61214f1b8c3d9f4bac502adcd24a60aa246bb66c15d347' # 182 nirmala.ttf   en-US Version 1.10 Nirmala UI
  'a01f9a035789e487eea4ea64c35a9f32c39755a45e6e6a36a38cfbfce17069dd' # 183 nirmalab.ttf  en-US Version 1.10 Nirmala UI Bold
  '81b212d54ced7280a2156a2bb6d9ff0eb98b982951c5a5978d053c72b3582a28' # 184 nirmalas.ttf  en-US Version 1.00 Nirmala UI Semilight
  'c2c03934436fc133679b5f20b4b1b9a118b80e8e0bdf18c632aae5ce28ff903f' # 185 javatext.ttf  en-US Version 1.00 Javanese Text
  '5ea3a22e03026f0ad4a9b7b8fdaf434e0af4dede482a11ac693e374f576c7e96' # 186 daunpenh.ttf  en-US Version 5.00 DaunPenh
  '98e460a046161f1cb484273bf5864269a835993303c623307d299baffd11b71e' # 187 khmerui.ttf   en-US Version 5.02 Khmer UI
  '414d1ba93212bf9afde96e95a416d50f83de609149e9eb04ba2949aae003501b' # 188 khmeruib.ttf  en-US Version 5.02 Khmer UI Bold
  'bb5d870471fda6310ed4ad1ea5419511e1e63ff4b19124035204aea05d12b99d' # 189 moolbor.ttf   en-US Version 5.00 MoolBoran
  'b9682c73a954f5a8a1b2a0ff88b4ff54cb20143a0330c3b1ccc2f9aede2838c7' # 190 dokchamp.ttf  en-US Version 5.00 DokChampa
  '0872ac0c1659c57e61d2f84be7a736546ba78d3b8aeb08d08f1b839b1528762f' # 191 laoui.ttf     en-US Version 5.01 Lao UI
  '2ffcb832b15dd7ca3968c9809a0dbc367e195deb64eeeac7b846452578449f3e' # 192 laouib.ttf    en-US Version 5.01 Lao UI Bold
  '982b460d6165766c1507f47b43913f89b5efdc9c5a99f18fdac9ba59ca4123ac' # 193 monbaiti.ttf  zh-CN Version 5.41 Mongolian Baiti
  '5fe58eb92beaf349f29c7f989e307701a62f60326c83379f0fd32d0930cd28d1' # 194 mmrtext.ttf   en-US Version 1.10 Myanmar Text
  'a90ddbb5a9459dac6f2cb816df3ceffb849a5e141ac8f7bf3fd2d8122ffed333' # 195 mmrtextb.ttf  en-US Version 1.10 Myanmar Text Bold
  '86e3908bf4dbeb1961649ff3f3c46d0f0d26f1ed98a172ad799b5528cf2cdd18' # 196 ntailu.ttf    en-US Version 5.96 Microsoft New Tai Lue
  '6ed996f44b0210bf00fb85ac1a39a83e0d92636a035643f54719055b9ea8c803' # 197 ntailub.ttf   en-US Version 5.96 Microsoft New Tai Lue Bold
  'ee70ba05a098a2b2c4b81e85a7bdd532bac5266c31c46a0ac649b06ba42c73ed' # 198 taile.ttf     en-US Version 5.96 Microsoft Tai Le
  '2c0b89ea18f2c9c7793f6adc65637e87c0c0a1f6781a49ad5f06e108d8b95a28' # 199 taileb.ttf    en-US Version 5.96 Microsoft Tai Le Bold
  'a13144b43eb90bb0c56a6d48fab9eae7c525e91eb332bfa561e5f2c26c7f83d7' # 200 himalaya.ttf  zh-CN Version 5.10 Microsoft Himalaya
  '6c32a5f5e4eb7d6f14ddc73073d78bb98f47a6ca5deaace9694289db18521244' # 201 msuighur.ttf  en-US Version 6.00 Microsoft Uighur
  '8ab5de475b91361575858e67ce5a55f22a60fc9dc54d4025dfe3504d805cbd22' # 202 msuighub.ttf  en-US Version 6.00 Microsoft Uighur Bold
  'd4e309672355628256f48fa783b8be1ac5b9a4f0feb8c4e6ae644cf301350f82' # 203 msyi.ttf      en-US Version 5.97 Microsoft Yi Baiti
  '98698d47ccc410ba01ae1a01f4f2511e031a589371966f91fcea62467aadab5e' # 204 leelawui.ttf  en-US Version 1.00 Leelawadee UI
  'deadd11ac366980b35ae2af8b3b65c7b83c0fae889d49e5fd16155df1064adb9' # 205 leelauib.ttf  en-US Version 1.00 Leelawadee UI Bold
  '2749ccda2b40a0f514b477b39bb1323f81e4001c3a795868e259d00556737331' # 206 leeluisl.ttf  en-US Version 1.00 Leelawadee UI Semilight
  '68ff605509f90727db6ed89eca7238e4174c597577530d98a02aa404b1406397' # 207 angsa.ttf     en-US Version 5.01 Angsana New
  'e4a2b23191e8b834be4b529653620242a465103fc74f12aceac99d0d1729063e' # 208 angsab.ttf    en-US Version 5.01 Angsana New Bold
  'f0f8cdac4ff4b9e36d1564ec121cf3df00cd6bb8ad17190a762db180670e6ab6' # 209 angsaz.ttf    en-US Version 5.01 Angsana New Bold Italic
  '838f22b4027d1df187c4b288d973504d6fe47d12c782cd7b5bf526a6dd2e875b' # 210 angsai.ttf    en-US Version 5.01 Angsana New Italic
  'd25d38720ff16e86fcbaac322e27b2b28d4ee66227f0334eea39ab0d680d7848' # 211 angsau.ttf    en-US Version 5.01 AngsanaUPC
  'afea7a5d88fbb34801c6e67466392fed30b20eb34680f43a866fc9b34ce23766' # 212 angsaub.ttf   en-US Version 5.01 AngsanaUPC Bold
  'eca9f9ec0977f352466d1dc214afa1a505a4f75ba60808d9d8ba85d9ac387e1a' # 213 angsauz.ttf   en-US Version 5.01 AngsanaUPC Bold Italic
  'db223237fdb4a5c6d7c9b33dbd81d2fb2dc9dd4a9ea88940a073fb3fa6c6dfe9' # 214 angsaui.ttf   en-US Version 5.01 AngsanaUPC Italic
  '6735574698be215db065758d2fc734b05df1f9184a7b9d6067a61d397ac4bbed' # 215 browa.ttf     en-US Version 5.01 Browallia New
  '686113728bfa9233edb871244b424c64a7d3d6400754bd7a2304932cdeac6ae3' # 216 browab.ttf    en-US Version 5.01 Browallia New Bold
  'ebf264d6257031e7c5abdf748efcf80417dd85253125c2fb6545f5f2f943097b' # 217 browaz.ttf    en-US Version 5.01 Browallia New Bold Italic
  'ded6a72d315743792aa78abe02e8444c6d8c4d7ac67539c432584b94c5c119ce' # 218 browai.ttf    en-US Version 5.01 Browallia New Italic
  '8babfdcdd802972896cd65b2dfbc3999901eb21d4ea5cc34adee3fa89ec2f607' # 219 browau.ttf    en-US Version 5.01 BrowalliaUPC
  '34799fdb6edc83aae7191f9af458893315c47a5ab241ef4794ac6321fe7bfe52' # 220 browaub.ttf   en-US Version 5.01 BrowalliaUPC Bold
  'a834f273bfc253c3c1777155195d182ad529c4d6b9b7670ed58b799eb6e73c07' # 221 browauz.ttf   en-US Version 5.01 BrowalliaUPC Bold Italic
  'c28fe503bfbeb3dca02842c90090f03a36f71a937f3424173be294fdef861e1d' # 222 browaui.ttf   en-US Version 5.01 BrowalliaUPC Italic
  'deb89852d064389a12d1b11beff9e3af8122bb4bed1372ff3e7c09c649ba5180' # 223 cordia.ttf    en-US Version 5.01 Cordia New
  '624975a9629087d72487e6af31d28d3066ad1c28919e4a9affd8bff456730ab5' # 224 cordiab.ttf   en-US Version 5.01 Cordia New Bold
  'a0d0fab62673417f327015373b11157b5aaa2f552778024b6177bb85fc026632' # 225 cordiaz.ttf   en-US Version 5.01 Cordia New Bold Italic
  'ec8648b0b545e55a936bdb7deb346d1bfbd51010ab29feb80112572c71333e3b' # 226 cordiai.ttf   en-US Version 5.01 Cordia New Italic
  'e3ee7b32f9b36f6d1c8ff2fb139c06ac8036c87d4facd58c4d66baf79e3d7f55' # 227 cordiau.ttf   en-US Version 5.01 CordiaUPC
  '9f0b7f87d2138e8397894b22d53d43ea1b55a92f12b3fc7b8b2c6cb8b197ba87' # 228 cordiaub.ttf  en-US Version 5.01 CordiaUPC Bold
  'ece13160479c08415dbd46ebba936fba1c48c9330a3f6dc8a74a39e6a2ced7f0' # 229 cordiauz.ttf  en-US Version 5.01 CordiaUPC Bold Italic
  '3622e287dd91461c1f0604db441f25e6dd98edc2225fbe369ed6402148a21b40' # 230 cordiaui.ttf  en-US Version 5.01 CordiaUPC Italic
  'c7c431b06dfdc2be21f70633fb5de46029fed15c8983c2f32174dcac4b1a11cf' # 231 upcdl.ttf     en-US Version 5.01 DilleniaUPC
  '5745b49e151e38a2e0b7e942e8d6e672349b6cbf45573e13cddfcba4767ecf19' # 232 upcdb.ttf     en-US Version 5.01 DilleniaUPC Bold
  'c6a8baecf4af7b99022d07b6a8c4bad3c790e2024d3a1d5d1b214019d4820058' # 233 upcdbi.ttf    en-US Version 5.01 DilleniaUPC Bold Italic
  '015087b08a05602092bab12d8d5541dc39db34985721fb8d1fe7027067a16ba4' # 234 upcdi.ttf     en-US Version 5.01 DilleniaUPC Italic
  '2c505e19d768a4db2b42c2b933f4f7a4520077b46dc15f35c5be409630ac5066' # 235 upcel.ttf     en-US Version 5.01 EucrosiaUPC
  'fde4fc8b12f3580107323e98a31530fb86a574b315442c1249b3032126f5f539' # 236 upceb.ttf     en-US Version 5.01 EucrosiaUPC Bold
  'f59264ef03a0923aa0926379b2e3e47e64dcdbb9ba291bddef6d8ad08b28953f' # 237 upcebi.ttf    en-US Version 5.01 EucrosiaUPC Bold Italic
  '6eaa69821682ef4718445353c3f48a52377b629d73a15bcb019e46a4297de20d' # 238 upcei.ttf     en-US Version 5.01 EucrosiaUPC Italic
  '10ed81a28f467f393b8de0fff4c4a9645f4a75df52da5294f3955370f4dcb5ca' # 239 upcfl.ttf     en-US Version 5.02 FreesiaUPC
  'cc85a5eca80d263f7cc9caa090ec570b6728a0d3ac57968deff5905aac15fea8' # 240 upcfb.ttf     en-US Version 5.02 FreesiaUPC Bold
  '2724edfb5c21469867cc093fcc7afbb2b3362257359337193b89b915237a256c' # 241 upcfbi.ttf    en-US Version 5.02 FreesiaUPC Bold Italic
  '0c2e761606cd53ac0f079bb91d237cde30a06608aaa1949af61bd2d999374d45' # 242 upcfi.ttf     en-US Version 5.02 FreesiaUPC Italic
  'a9f8478c4a51a2116182e3387edaf77141772730f696631fecf6cd8b5a124a35' # 243 upcil.ttf     en-US Version 5.02 IrisUPC
  '9d26975bad8d5e4cb78f11515e79c40047e1e34bdec6d233a6a84a3cd21b339b' # 244 upcib.ttf     en-US Version 5.02 IrisUPC Bold
  'a3222b7b29231905df91320ceba9285f6d3a191f2dc275f55b872aadff7c6b26' # 245 upcibi.ttf    en-US Version 5.02 IrisUPC Bold Italic
  '1e0baf66029f802e05435588e180967621b645a577bfff9d4558c731d82a29fc' # 246 upcii.ttf     en-US Version 5.02 IrisUPC Italic
  'f9e7d8e4a5e6783d0cf4a22caf642471ed18048a21967d1b749239cefd3f4b92' # 247 upcjl.ttf     en-US Version 5.01 JasmineUPC
  '716b9f05caaff0dfec2aa3aae33f08ddd8515d13983240532a12e994da9d9263' # 248 upcjb.ttf     en-US Version 5.01 JasmineUPC Bold
  '8dde222f65d5a97bc8148e58b40b3549a508a50de17e5b166dce8aa3129be8bb' # 249 upcjbi.ttf    en-US Version 5.01 JasmineUPC Bold Italic
  'e7677bd3087b74bf89481c1ca7a9352a51248cd906014ada703df9a178db0427' # 250 upcji.ttf     en-US Version 5.01 JasmineUPC Italic
  'f9e18b8fa70da172741e2db315167659448dee7382caa9e08b99544131506e5e' # 251 upckl.ttf     en-US Version 5.01 KodchiangUPC
  '54d977ef73a2eac035c6cef171f6441eafab1363c61ffc09525dfb941a773198' # 252 upckb.ttf     en-US Version 5.01 KodchiangUPC Bold
  'f555c56fd9ab7b674a8675bbee9ba803a27443bb5d27c9416dedf996a01d22c7' # 253 upckbi.ttf    en-US Version 5.01 KodchiangUPC Bold Italic
  'a52ae246dd669b7c8f0e0519ff63dcdef72cc61ba0410d92146e64c5983b78ea' # 254 upcki.ttf     en-US Version 5.01 KodchiangUPC Italic
  '11e1960d6aca5d6de0fcbeda530dbb3dea8837d810596c54235b07a9fbe43f9e' # 255 leelawad.ttf  en-US Version 5.05 Leelawadee
  '436bb96f8bbb151e7634fcea07794044a8565b013e505245322dafa13e6c3efd' # 256 leelawdb.ttf  en-US Version 5.05 Leelawadee Bold
  '2221765602bd9a4cc91da99652a3203d6fb80c655ff15cda003a28252afb6477' # 257 upcll.ttf     en-US Version 5.01 LilyUPC
  '0419cdf9c85467c5b02d194ad8f9902970fe6398aefc8e25fb46c1b9e72e0d07' # 258 upclb.ttf     en-US Version 5.01 LilyUPC Bold
  '32f823c300bb060774d0a81d9b870a1eb0eaab1f97324d47d5e7515f0473d89c' # 259 upclbi.ttf    en-US Version 5.01 LilyUPC Bold Italic
  '000445fb49f67d8211984de0b628666d03bf6b8d4f1490483f33c4503cd14510' # 260 upcli.ttf     en-US Version 5.01 LilyUPC Italic
  '521c6f7546b4eb64fa4b0cd604bbd36333a20a57e388c8e2ad2ad07b9e593864' # 261 simfang.ttf   zh-CN Version 5.01 FangSong
  'f49873fbe1689f1a37ed0f5765eb7d989d8a3b75210d1f1b66b74b043a1871be' # 262 simkai.ttf    zh-CN Version 5.01 KaiTi
  '57cbdb2a26edf53270e00a6486a2fc3e4ca80347522fe7e9ea0181a9621c0e4f' # 263 msyh.ttc      zh-CN Version 6.14 Microsoft YaHei; Microsoft YaHei UI
  '3f43d8932c4d8fa9f1a7a8da72b777249780ae267d7134ad3797461b9a97f99c' # 264 msyhbd.ttc    zh-CN Version 6.12 Microsoft YaHei Bold; Microsoft YaHei UI Bold
  '69b67c82ec337f4e8451cc08c2ebbf572f12a3a490dcdfc58aaf63e3f1ae8b10' # 265 msyhl.ttc     zh-CN Version 1.01 Microsoft YaHei Light; Microsoft YaHei UI Light
  '527fd44cafcd362fd0b2fc1849fd667581031bf89fdece2a6f34f6cebee74be3' # 266 simhei.ttf    zh-CN Version 5.03 SimHei
  'e414ce2cb5a62cef00cf184f7dbad32975a1db384f05e92dc5a9cad6a36d561a' # 267 simsunb.ttf   en-US Version 5.01 SimSun-ExtB
  '6b6b3cbe54d81d29106aedc45fbaf343ba9dee11dfc856656aefa2971307a2a9' # 268 simsun.ttc    zh-SG,zh-CN Version 5.13 SimSun; NSimSun
  '9e597a391d869a0526a2c1ad14714193abb1bd9e7d85738f9cece411018229b7' # 269 kaiu.ttf      zh-TW Version 5.00 DFKai-SB
  '4c089370d98a6c5f1ee19975ffc3a0ce932d67f7cb1e3db8493ac8b8c5eac3fa' # 270 msjh.ttc      zh-HK,zh-TW Version 6.11 Microsoft JhengHei; Microsoft JhengHei UI
  'f2f591aa21673bab8fb385ab529021c69e9bfa6c9f39b6fdb0909d6e4c4771dc' # 271 msjhbd.ttc    zh-HK,zh-TW Version 6.11 Microsoft JhengHei Bold; Microsoft JhengHei UI Bold
  '11648d0fbbf88f4726b54c5b6b93ddec25fe6c99b2c8aed68c778f60c4b4fc39' # 272 msjhl.ttc     zh-HK,zh-TW Version 1.00 Microsoft JhengHei Light; Microsoft JhengHei UI Light
  'bcd2ece54c61f5e20db1b2f60b4215274b3f9a92deba89e7b3f41085e1a31abb' # 273 mingliub.ttc  zh-HK,zh-TW Version 7.01 MingLiU-ExtB; PMingLiU-ExtB; MingLiU_HKSCS-ExtB
  '7040631880be2e6206ac6ddb40d72ab10fc34542a07a2ed0a2005b71ff8d9cce' # 274 mingliu.ttc   zh-HK,zh-TW Version 7.01 MingLiU; PMingLiU; MingLiU_HKSCS
)

# Any mismatch in the above table will be searched against all of the following.
_fnt256sumsx=(
# Older fonts from the Windows 8.1 DVD.
  '2549919b208203a2dced66cb901e6ec433c5fa34f15f160932f7bcf695c2a4e9' #  33 segoeui.ttf   en-US Version 5.32 Segoe UI
  '2b019e9868a2e2344c86f7e5e3ac58b5b70ea30d0c3f603cd74f3076318ebd10' #  34 segoeuib.ttf  en-US Version 5.32 Segoe UI Bold
  '7ab7d07b58d25ca037fff4df64ee7043e91c12cfff0716a9298c507a2648c422' #  35 segoeuii.ttf  en-US Version 5.26 Segoe UI Italic
  'd756572d10ab716a53cb30e9a14631a64340e556d7a1c62f7f89ed526c37f899' #  36 segoeuiz.ttf  en-US Version 5.26 Segoe UI Bold Italic
  '6a543d56e7b27abab2b96911841077e92f93fb064f017c5afb65517602c4976d' #  69 calibri.ttf   en-US Version 5.86 Calibri
  '55df7a17a256d5f9c258fbe0cfa326cefe0ceeb61c8d093fd0a9a84cd0b9db8e' #  70 calibrib.ttf  en-US Version 5.86 Calibri Bold
  '4e090cdb6081a825b6afc93448b570ed706c6930038ac33875b4c1d939e9e0b1' #  71 calibrii.ttf  en-US Version 5.86 Calibri Italic
  'a2e82be24951a54ec1c130dbb884aba5c572f982574c10e5ac712b0a55564c2d' #  72 calibriz.ttf  en-US Version 5.86 Calibri Bold Italic
  'b422f9705b3e221137b5874a90fc00e5e2fb84a98d4090540f6fc7318c6b6e82' #  75 cambria.ttc   en-US Version 6.81 Cambria; Cambria Math
  '5796a6cb3ff57f8f8a5cbef94ed9b780c16aa50d3c1cd20b8a31725ced12564f' #  76 cambriab.ttf  en-US Version 6.81 Cambria Bold
  '24b1c53c1604d066326638327a47141508cdac05fd5f6e9d3b908082e14b318e' #  77 cambriai.ttf  en-US Version 6.81 Cambria Italic
  '928cd5d1d35f61de0ee46e5adeddb09fe4c2647b62d9fbbc5fe40486503cc672' #  78 cambriaz.ttf  en-US Version 6.81 Cambria Bold Italic
  '423504695a3de1f80c618e3e6ead215a6b891be06c179bf048bb5a80d5d0eda3' #  83 consola.ttf   en-US Version 5.33 Consolas
  '73acf8f7f9d16c76829ee5ee801852cd54184a68ac513c1e339487685aa9b732' #  84 consolab.ttf  en-US Version 5.33 Consolas Bold
  '219acde6b177d876ac1debfe03c7b951d6333b350044e1ec16bdd3312c63aee0' #  85 consolai.ttf  en-US Version 5.33 Consolas Italic
  '0000adf3cc6f3f382b061f31277cdcb3787fb816d7251d8fdb57b33085eaab70' #  86 consolaz.ttf  en-US Version 5.33 Consolas Bold Italic

# Older fonts from Windows 8.0 DVD.
  '7f66a789d452cdb610107cec823a46930c5713156e3b1bafeb4e96c3ab67f353' #   1 arial.ttf     en-US Version 6.80 Arial
  '69fa9c7703cba4cb25f5ba185b98649188ac5e41e6505fa6465d0f4697fa72a8' #   2 arialbd.ttf   en-US Version 6.80 Arial Bold
  '6f9f4ccf36e4fb46f01403a575cfefdb434e54e6e26aa16f62c11195152e173b' #   3 ariali.ttf    en-US Version 6.80 Arial Italic
  '59df1bd4698923653770510200fce88e1e7dc44863b12e2445fa009d0c2140fc' #   4 arialbi.ttf   en-US Version 6.80 Arial Bold Italic
  '37d7dc86d19616f68caac3971ea29154eff540798fdfe0a9e37f2cad42a1eaf9' #  10 cour.ttf      en-US Version 6.80 Courier New
  '4ca606dde2765bc2ed6ce4f4ce5879084e6416b5a6959940c7264f8570a431b9' #  11 courbd.ttf    en-US Version 6.80 Courier New Bold
  '2749136acd27375e40fb2a28db17722e31acaf74443e342730fa14fbecf6a8b0' #  12 couri.ttf     en-US Version 6.80 Courier New Italic
  '485e92157bd2f179906721f38a541f6fc85e1e24588824ee4b5cee98da867429' #  13 courbi.ttf    en-US Version 6.80 Courier New Bold Italic
  'b201eb19eddd318915c88c9ab20a4179c2ffaa4bcd25f4dd846d935be85df332' #  24 micross.ttf   en-US Version 5.10 Microsoft Sans Serif
  '1dc85fbce25b49cfef669a3c826d59ebba81297a18727554c715fe5cf0eeb6d2' #  25 pala.ttf      en-US Version 5.01 Palatino Linotype
  '42937e4c54c028a06a796fde3aca571c4450171a43a9d77103bd93e19ed174e6' #  26 palab.ttf     en-US Version 5.01 Palatino Linotype Bold
  'fb79db5095bec1eeba5093777ff1199e96d5b9e3c6be8be51cdd8540d80ac20e' #  27 palai.ttf     en-US Version 5.01 Palatino Linotype Italic
  'a4d8de5753506c2005c1aa97168de18f7252b60b60b6350291c6abe5e926a098' #  28 palabi.ttf    en-US Version 5.01 Palatino Linotype Bold Italic
  '13623a0ac051b0e08fa142a13cb6e5ef43d9d34c220efac7c210ff670a242925' #  33 segoeui.ttf   en-US Version 5.28 Segoe UI
  'dac3156acb4136c47484e8e16b65b275b4109346c09e076fa72aad212cff337d' #  34 segoeuib.ttf  en-US Version 5.27 Segoe UI Bold
  '0324c9a66df0dcac782c1022dd2a88134550ff9c8832f14216faffe3df180151' #  40 segoeuil.ttf  en-US Version 5.27 Segoe UI Light
  'd1f97c7320e56280cf7bcb25db04102883cd4349f762c5009c3004f6d3fd47b4' #  42 seguisb.ttf   en-US Version 5.27 Segoe UI Semibold
  'b1fda74a72733dde77a9b1837f1a96dae29079366a069cc0785dcdaa5aacc3c4' #  44 segoeuisl.ttf en-US Version 5.27 Segoe UI Semilight
  '7d450facc914aca8f27cd802bfc69e59e1ccd4feaf719e0b6beda00f973399dd' #  46 seguisym.ttf  en-US Version 5.90 Segoe UI Symbol
  '814e69197d9d71fcc994e43a9457cda62f2f24f4a0cb8fc8528a9f44bf107997' #  53 tahoma.ttf    en-US Version 5.25 Tahoma
  '3868b44b2814151cb531ba4644e9cac9534342ba16e8a588dcb7f634b222a5e5' #  54 tahomabd.ttf  en-US Version 5.25 Tahoma Bold
  '9437d704d2b14cd3c0a0f33bfa6edfcc94fdb4de796a3ae587595e0f03deaa73' #  55 times.ttf     en-US Version 6.80 Times New Roman
  'eb47c076e54c1415750dc7f58026c08bd0e55a6c43979930f0afa1104b4fee94' #  56 timesbd.ttf   en-US Version 6.80 Times New Roman Bold
  '0991b9618f5934ce630fe427fcfac5ff118779f2ac4721d9870c1d15ce1fd83c' #  57 timesi.ttf    en-US Version 6.80 Times New Roman Italic
  'a7b21ea31a9cf0256f64eba44b3800283b2d9a887d76ea87a8d1cc30d1a9ce94' #  58 timesbi.ttf   en-US Version 6.80 Times New Roman Bold Italic
  '4551d2c98992db601e07b1267ec7610919397b84997b62630386054aedf73d1a' #  59 trebuc.ttf    en-US Version 5.10 Trebuchet MS
  'bf7781d2ca7b0eaa3c47edd953df99ef1f1d7a17db562272edae30afcdefea44' #  60 trebucbd.ttf  en-US Version 5.10 Trebuchet MS Bold
  'b1484bb4b08c24bc022b85c009407af537a4fd83bfbdea41ee428f5058e346cd' #  61 trebucit.ttf  en-US Version 5.10 Trebuchet MS Italic
  '70e73ab2e603bd56080f9086b62f68bd36fb88d5546e433d4432891bb7802eb8' #  62 trebucbi.ttf  en-US Version 5.10 Trebuchet MS Bold Italic
  '6cc4055abce8101cfa3850031df0cc226341618d4361e23a7bc4d5f2ebb2807f' #  69 calibri.ttf   en-US Version 5.72 Calibri
  '009a5e879d37d75e8922a2786e64e7ee197762111f45ac0564262aa1d8f6f81e' #  70 calibrib.ttf  en-US Version 5.72 Calibri Bold
  'f09ea6e6c951fa17dd8b0ed4d68686c977eddfa616f5efc617efd0ad123c4cc9' #  71 calibrii.ttf  en-US Version 5.72 Calibri Italic
  '9378bb36eb676530f5fdc94dc4fcc73d63a6ec6ebb7d5eebe131254d7c51d2d2' #  72 calibriz.ttf  en-US Version 5.72 Calibri Bold Italic
  '86d7239b49cfc4f16b17d0b0eb5240fe1ca1400e5feb86699fe282a322602c67' #  73 calibril.ttf  en-US Version 2.00 Calibri Light
  '7e11508b1fd82bc2c77bb2ce234cfa724d54d036910b255eaab722e7160a3105' #  74 calibrili.ttf en-US Version 2.00 Calibri Light Italic
  '9caea325613e6aa20f4142c134b3e61899fa2d92183bee0b09abf0f7be843ce4' #  75 cambria.ttc   en-US Version 6.80 Cambria; Cambria Math
  '60fae0c802ca69688590a4c96e57abfd99042a8d576df1437b965d83b78ff049' #  76 cambriab.ttf  en-US Version 6.80 Cambria Bold
  '4b93dd04e1748a3cbb125f885756c45adfb34daf45285043dadc9e901e46c4fd' #  77 cambriai.ttf  en-US Version 6.80 Cambria Italic
  '951649d2bc24576f31c37eebf6abac5a24c2b50017595fbfb5b4eab4e473328c' #  78 cambriaz.ttf  en-US Version 6.80 Cambria Bold Italic
  '2fb90b43b7583971b38df935e28c3250fc281cc84d2e807b216e2ef07b05f975' #  83 consola.ttf   en-US Version 5.32 Consolas
  'd38458ec34f1568e66565cc260e35da1383023f6052f8cc0ca2a50a1cb9cdf63' #  84 consolab.ttf  en-US Version 5.32 Consolas Bold
  'd0e2af3c6a783d2ea396a5486e5d16d74e2adfcd14a29c337c950b7b2b51c98c' #  85 consolai.ttf  en-US Version 5.32 Consolas Italic
  'e790812a7ea5dd6255973a0a2456054a7ce1f549c28ff89da4727971decfa494' #  86 consolaz.ttf  en-US Version 5.32 Consolas Bold Italic
  '28401ef53647e4e68f2c2bda54856fe90d9afb1cf4072bf4ea9cf6b380c09d4c' #  87 constan.ttf   en-US Version 5.90 Constantia

# Fonts as of June 2015
  '7025b83c87a02c5a6182c5fd265c2a68e2f89319f0e632027561e84fd07fa8bf' #   1 arial.ttf     en-US Version 6.85 Arial
  'd88060d460aac4dee0dd0e1ab194f0625d8e7fdee6cd5ff6725152ad94ae61f2' #   2 arialbd.ttf   en-US Version 6.85 Arial Bold
  '61a57f249836cccd9ce0ba1f2c54abeb50a52ef5b47454f1b03756ebfeeb9c68' #   3 ariali.ttf    en-US Version 6.85 Arial Italic
  '3e7cd6112960ca5b8f3ee978b5691d46701e41d37e3c0ce644445f7e9d211eab' #   4 arialbi.ttf   en-US Version 6.85 Arial Bold Italic
  '10c9323fd4e0231b163878f60daf5556f6af264300402194070460b1704b4ac7' #  10 cour.ttf      en-US Version 6.85 Courier New
  '5bbd5a21e1da6bcde5fe93121d85c849164d02f98f56e8739b68bcb2f569f246' #  11 courbd.ttf    en-US Version 6.85 Courier New Bold
  '4741ef4a07322da6e503870d1191c6bc0b596a5eb35917a2890918114c076007' #  12 couri.ttf     en-US Version 6.85 Courier New Italic
  'ee77470a026b0a3c96da6bccd79e1de04cb9a56a57ede346075dfcfd7e31055c' #  13 courbi.ttf    en-US Version 6.85 Courier New Bold Italic
  '1e8edef6c0755698306848f6c83109154cc469ec83d237c033cc64d3b38aeb95' #  24 micross.ttf   en-US Version 6.00 Microsoft Sans Serif
  '5ba110b3e209f6d48cee35397bab77e12e52596a76136f1479324f444a15a360' #  33 segoeui.ttf   en-US Version 5.35 Segoe UI
  'f0dc4efc48256e9e108a4a280e3257ab55f88e48288fa4914e5392bd5167db07' #  34 segoeuib.ttf  en-US Version 5.35 Segoe UI Bold
  '97f9a129b2620069ba5b40a099b6736e23dc2edfe53e7d2feb37cb6e1599bcf1' #  35 segoeuii.ttf  en-US Version 5.35 Segoe UI Italic
  'e380695146f43519c9c0e33c3527523c8c38f6b64ae5c5076d8ad9fab3e530a1' #  36 segoeuiz.ttf  en-US Version 5.35 Segoe UI Bold Italic
  'aadc9f00a88979f35354ae936644efff47581b666a8c12352f4f48b65ab14d7c' #  40 segoeuil.ttf  en-US Version 5.33 Segoe UI Light
  '67e2c30f90d96ed45998917eb8c3c7577fa70dd468fae54c13d1771961fa0b8e' #  41 seguili.ttf   en-US Version 5.26 Segoe UI Light Italic
  '8b2d0233b1827c47ce945a858582be4cbc8fa4c166ddac2ca56686acaae4c4a4' #  42 seguisb.ttf   en-US Version 5.32 Segoe UI Semibold
  'b637e1d88370f6c166384e84b83decd875189db296aa5b5f9454a0af289ff9ea' #  43 seguisbi.ttf  en-US Version 5.26 Segoe UI Semibold Italic
  '356b7d0d9bbf63639bc92cc602fd16d339e46d1f2b3e71bdc5144344fa3f4888' #  44 segoeuisl.ttf en-US Version 5.33 Segoe UI Semilight
  '086e2726b9c4a8c1189d67c429459ba57fcbb2a0240cdacc7bdd0e80affc6de9' #  45 seguisli.ttf  en-US Version 5.26 Segoe UI Semilight Italic
  '600d02e8251c01bc80207e37c05a5cc0a760d3557144444147b99081f81a84ee' #  46 seguisym.ttf  en-US Version 6.06 Segoe UI Symbol
  'cc0f9d2f27e6099d22655ce20d3de41c41a780eab4f538656a9cd40823004669' #  51 sylfaen.ttf   en-US Version 5.03 Sylfaen
  'b577582a23b8cf8ace702ea9dd32a999c34e4ef4f7cd240a9969f171f4eddcbb' #  53 tahoma.ttf    en-US Version 6.00 Tahoma
  '654bfbce006566a5ef007d1fb16fced89f3c813ec79afdb7882d3a85a0a87470' #  54 tahomabd.ttf  en-US Version 6.00 Tahoma Bold
  'ea3d9922cd756aa247343fe9ce593da2a9323774b07a0b5f71abed69563f1e63' #  55 times.ttf     en-US Version 6.85 Times New Roman
  '41fc19c049a3f0120542e42632fe217bc931a30c59ea2316cbb1bafc43c7f635' #  56 timesbd.ttf   en-US Version 6.85 Times New Roman Bold
  'cb39349c1e55f926a9bcd9b5a93ed9857bb18f8efd93484993df01100af62673' #  57 timesi.ttf    en-US Version 6.85 Times New Roman Italic
  'fd00869fd969836a01ee5499ed4c6425ee833c8b535cf8f57ca38bc92614b601' #  58 timesbi.ttf   en-US Version 6.85 Times New Roman Bold Italic
  '8e68434fe031156f12ebb23b7b7baf921f7cd5505a7888d5541e28752fc46b63' #  69 calibri.ttf   en-US Version 5.87 Calibri
  'ea73c9cf0271d364ad19753b4c806813f0079dbeb7f44625bff3ed6adaf21432' #  70 calibrib.ttf  en-US Version 5.87 Calibri Bold
  'b8068d620e0df685eae8443ec5566331ce0cc0f50dc492491d1ebb387cb42ce5' #  71 calibrii.ttf  en-US Version 5.87 Calibri Italic
  '0daec23661a84e019648797ae2ce26fdfc6ab7c88681d0e55e86763aa57eb5b9' #  72 calibriz.ttf  en-US Version 5.87 Calibri Bold Italic
  'cd8f6ebc4ff8655cab52c8436260a3adb8324424efded68e95baa9a2a54d45d6' #  73 calibril.ttf  en-US Version 2.11 Calibri Light
  '75786eca7de57e4c968a3b6be69bfcd6d7450e3217a747892bd8a3859ae11409' #  74 calibrili.ttf en-US Version 2.11 Calibri Light Italic
  '8a54e4c7cc8c4756cd97381fd431debc13b8356374d208d9a828b9de9ed59bf1' #  75 cambria.ttc   en-US Version 6.83 Cambria; Cambria Math
  '6e17672ab5a4da801909cd4bf297a4708a82959384906d635070450dbaaaf1bb' #  76 cambriab.ttf  en-US Version 6.83 Cambria Bold
  'cbe26a60c717f0334b9bdfc7c929232dd666ccfe107589140e40ce6d7a8db9f8' #  77 cambriai.ttf  en-US Version 6.83 Cambria Italic
  'a62e765f7516ab9fba44e4a85d15ae7018b70dbc7feba5bed0c18c9061d375e4' #  78 cambriaz.ttf  en-US Version 6.83 Cambria Bold Italic
  '167793b658a131bde7a856f998e7a6ab13c7364eb2d050f5285ceef9ef70d44a' #  83 consola.ttf   en-US Version 5.34 Consolas
  '511d71a455c698ee74d78f03ca4747da53025f862faee1d5bede407285517a81' #  84 consolab.ttf  en-US Version 5.34 Consolas Bold
  '09a343ad31be772eb1aee5cfd315828ac5dea9e7275b2456a75933c2d1461268' #  85 consolai.ttf  en-US Version 5.34 Consolas Italic
  '62a8cb4c643b2e47bc877a70f274f4daac271a3f82f8c6aaa0894e4b26fb3f75' #  86 consolaz.ttf  en-US Version 5.34 Consolas Bold Italic
)

_tt_deli=':'
# Generate international font arrays. This code is designed to make creating these big arrays fast and easy.

# Format: font.ttf:Language Name:pkgname
# Fill in Language Name by hand from any font list like Wikipedia.
# Fill in pkgname to assign each font to a package. I duplicated the original ttf-ms-win8.
# pkgname can be left out if its the lower case of Language Name.
# Entries that still need language info added by hand sort to top by font name.
# Entries with complete language info sort by pkgname and Language Name to the bottom so each package is shown together.
_tt_lang=(
  "aldhabi.ttf:Arabic"                     # en-US Aldhabi
  "andlso.ttf:Arabic"                      # en-US Andalus
  "arabtype.ttf:Arabic"                    # en-US Arabic Typesetting
  "majalla.ttf:Arabic"                     # en-US Sakkal Majalla
  "majallab.ttf:Arabic"                    # en-US Sakkal Majalla Bold
  "simpo.ttf:Arabic"                       # en-US Simplified Arabic
  "simpbdo.ttf:Arabic"                     # en-US Simplified Arabic Bold
  "simpfxo.ttf:Arabic"                     # en-US Simplified Arabic Fixed
  "trado.ttf:Arabic"                       # en-US Traditional Arabic
  "tradbdo.ttf:Arabic"                     # en-US Traditional Arabic Bold
  "urdtype.ttf:Arabic"                     # en-US Urdu Typesetting
  "urdtypeb.ttf:Arabic"                    # en-US Urdu Typesetting Bold
  "ahronbd.ttf:Hebrew"                     # en-US Aharoni Bold
  "david.ttf:Hebrew"                       # en-US David
  "davidbd.ttf:Hebrew"                     # en-US David Bold
  "frank.ttf:Hebrew"                       # en-US FrankRuehl
  "gisha.ttf:Hebrew"                       # en-US Gisha
  "gishabd.ttf:Hebrew"                     # en-US Gisha Bold
  "lvnm.ttf:Hebrew"                        # en-US Levenim MT
  "lvnmbd.ttf:Hebrew"                      # en-US Levenim MT Bold
  "mriam.ttf:Hebrew"                       # en-US Miriam
  "mriamc.ttf:Hebrew"                      # en-US Miriam Fixed
  "nrkis.ttf:Hebrew"                       # en-US Narkisim
  "rod.ttf:Hebrew"                         # en-US Rod
  "shonar.ttf:Bengali:indic"               # en-US Shonar Bangla
  "shonarb.ttf:Bengali:indic"              # en-US Shonar Bangla Bold
  "aparaj.ttf:Devanagari:indic"            # en-US Aparajita
  "aparajb.ttf:Devanagari:indic"           # en-US Aparajita Bold
  "aparajbi.ttf:Devanagari:indic"          # en-US Aparajita Bold Italic
  "aparaji.ttf:Devanagari:indic"           # en-US Aparajita Italic
  "kokila.ttf:Devanagari:indic"            # en-US Kokila
  "kokilab.ttf:Devanagari:indic"           # en-US Kokila Bold
  "kokilabi.ttf:Devanagari:indic"          # en-US Kokila Bold Italic
  "kokilai.ttf:Devanagari:indic"           # en-US Kokila Italic
  "mangal.ttf:Devanagari:indic"            # en-US Mangal
  "mangalb.ttf:Devanagari:indic"           # en-US Mangal Bold
  "utsaah.ttf:Devanagari:indic"            # en-US Utsaah
  "utsaahb.ttf:Devanagari:indic"           # en-US Utsaah Bold
  "utsaahbi.ttf:Devanagari:indic"          # en-US Utsaah Bold Italic
  "utsaahi.ttf:Devanagari:indic"           # en-US Utsaah Italic
  "shruti.ttf:Gujarati:indic"              # en-US Shruti
  "shrutib.ttf:Gujarati:indic"             # en-US Shruti Bold
  "raavi.ttf:Gurmukhi:indic"               # en-US Raavi
  "raavib.ttf:Gurmukhi:indic"              # en-US Raavi Bold
  "tunga.ttf:Kannada:indic"                # en-US Tunga
  "tungab.ttf:Kannada:indic"               # en-US Tunga Bold
  "kalinga.ttf:Oriya:indic"                # en-US Kalinga
  "kalingab.ttf:Oriya:indic"               # en-US Kalinga Bold
  "kartika.ttf:Oriya:indic"                # en-US Kartika
  "kartikab.ttf:Oriya:indic"               # en-US Kartika Bold
  "iskpota.ttf:Sinhala:indic"              # en-US Iskoola Pota
  "iskpotab.ttf:Sinhala:indic"             # en-US Iskoola Pota Bold
  "latha.ttf:Tamil:indic"                  # en-US Latha
  "lathab.ttf:Tamil:indic"                 # en-US Latha Bold
  "vijaya.ttf:Tamil:indic"                 # en-US Vijaya
  "vijayab.ttf:Tamil:indic"                # en-US Vijaya Bold
  "vrinda.ttf:Tamil:indic"                 # en-US Vrinda
  "vrindab.ttf:Tamil:indic"                # en-US Vrinda Bold
  "gautami.ttf:Telugu:indic"               # en-US Gautami
  "gautamib.ttf:Telugu:indic"              # en-US Gautami Bold
  "vani.ttf:Telugu:indic"                  # en-US Vani
  "vanib.ttf:Telugu:indic"                 # en-US Vani Bold
  "meiryob.ttc:Japanese"                   # ja-JP Meiryo Bold; Meiryo Bold Italic; Meiryo UI Bold; Meiryo UI Bold Italic
  "meiryo.ttc:Japanese"                    # ja-JP Meiryo; Meiryo Italic; Meiryo UI; Meiryo UI Italic
  "msgothic.ttc:Japanese"                  # ja-JP MS Gothic; MS UI Gothic; MS PGothic
  "msmincho.ttc:Japanese"                  # ja-JP MS Mincho; MS PMincho
  "yugothib.ttf:Japanese"                  # en-US Yu Gothic Bold
  "yugothil.ttf:Japanese"                  # en-US Yu Gothic Light
  "yugothic.ttf:Japanese"                  # en-US Yu Gothic Regular
  "yumindb.ttf:Japanese"                   # en-US Yu Mincho Demibold
  "yuminl.ttf:Japanese"                    # en-US Yu Mincho Light
  "yumin.ttf:Japanese"                     # en-US Yu Mincho Regular
  "malgun.ttf:Korean (no Hanja):korean"    # ko-KR Malgun Gothic
  "malgunbd.ttf:Korean (no Hanja):korean"  # ko-KR Malgun Gothic Bold
  "batang.ttc:Korean"                      # ko-KR Batang; BatangChe; Gungsuh; GungsuhChe
  "gulim.ttc:Korean"                       # ko-KR Gulim; GulimChe(5.00); Dotum(5.00); DotumChe(5.00)
  "gadugi.ttf:Cherokee, Unified Canadian Aboriginal Syllabics:other" # en-US Gadugi
  "gadugib.ttf:Cherokee, Unified Canadian Aboriginal Syllabics:other" # en-US Gadugi Bold
  "nyala.ttf:Ethiopic:other"               # en-US Nyala
  "ebrima.ttf:N'Ko, Tifinagh, Vai:other"   # en-US Ebrima
  "ebrimabd.ttf:N'Ko, Tifinagh, Vai:other" # en-US Ebrima Bold
  "plantc.ttf:Plantagenet Cherokee:other"  # en-US Plantagenet Cherokee
  "estre.ttf:Syriac:other"                 # en-US Estrangelo Edessa
  "mvboli.ttf:Thaana:other"                # en-US MV Boli
  "euphemia.ttf:Unified Canadian Syllabics:other" # en-US Euphemia
  "phagspa.ttf:'Phags-pa:sea"              # en-US Microsoft PhagsPa
  "phagspab.ttf:'Phags-pa:sea"             # en-US Microsoft PhagsPa Bold
  "nirmala.ttf:Devanagari:sea"             # en-US Nirmala UI
  "nirmalab.ttf:Devanagari:sea"            # en-US Nirmala UI Bold
  "nirmalas.ttf:Devanagari:sea"            # en-US Nirmala UI Semilight
  "javatext.ttf:Javanese:sea"              # en-US Javanese Text
  "daunpenh.ttf:Khmer:sea"                 # en-US DaunPenh
  "khmerui.ttf:Khmer:sea"                  # en-US Khmer UI
  "khmeruib.ttf:Khmer:sea"                 # en-US Khmer UI Bold
  "moolbor.ttf:Khmer:sea"                  # en-US MoolBoran
  "dokchamp.ttf:Lao:sea"                   # en-US DokChampa
  "laoui.ttf:Lao:sea"                      # en-US Lao UI
  "laouib.ttf:Lao:sea"                     # en-US Lao UI Bold
  "monbaiti.ttf:Mongolian:sea"             # zh-CN Mongolian Baiti
  "mmrtext.ttf:Myanmar:sea"                # en-US Myanmar Text
  "mmrtextb.ttf:Myanmar:sea"               # en-US Myanmar Text Bold
  "ntailu.ttf:New Tai Lue:sea"             # en-US Microsoft New Tai Lue
  "ntailub.ttf:New Tai Lue:sea"            # en-US Microsoft New Tai Lue Bold
  "taile.ttf:Tai Nua:sea"                  # en-US Microsoft Tai Le
  "taileb.ttf:Tai Nua:sea"                 # en-US Microsoft Tai Le Bold
  "himalaya.ttf:Tibetan:sea"               # zh-CN Microsoft Himalaya
  "msuighur.ttf:Uighur:sea"                # en-US Microsoft Uighur
  "msuighub.ttf:Uighur:sea"                # en-US Microsoft Uighur Bold
  "msyi.ttf:Yi:sea"                        # en-US Microsoft Yi Baiti
  "leelawui.ttf:Leelawadee:thai"           # en-US Leelawadee UI
  "leelauib.ttf:Leelawadee:thai"           # en-US Leelawadee UI Bold
  "leeluisl.ttf:Leelawadee:thai"           # en-US Leelawadee UI Semilight
  "angsa.ttf:Thai"                         # en-US Angsana New
  "angsab.ttf:Thai"                        # en-US Angsana New Bold
  "angsaz.ttf:Thai"                        # en-US Angsana New Bold Italic
  "angsai.ttf:Thai"                        # en-US Angsana New Italic
  "angsau.ttf:Thai"                        # en-US AngsanaUPC
  "angsaub.ttf:Thai"                       # en-US AngsanaUPC Bold
  "angsauz.ttf:Thai"                       # en-US AngsanaUPC Bold Italic
  "angsaui.ttf:Thai"                       # en-US AngsanaUPC Italic
  "browa.ttf:Thai"                         # en-US Browallia New
  "browab.ttf:Thai"                        # en-US Browallia New Bold
  "browaz.ttf:Thai"                        # en-US Browallia New Bold Italic
  "browai.ttf:Thai"                        # en-US Browallia New Italic
  "browau.ttf:Thai"                        # en-US BrowalliaUPC
  "browaub.ttf:Thai"                       # en-US BrowalliaUPC Bold
  "browauz.ttf:Thai"                       # en-US BrowalliaUPC Bold Italic
  "browaui.ttf:Thai"                       # en-US BrowalliaUPC Italic
  "cordia.ttf:Thai"                        # en-US Cordia New
  "cordiab.ttf:Thai"                       # en-US Cordia New Bold
  "cordiaz.ttf:Thai"                       # en-US Cordia New Bold Italic
  "cordiai.ttf:Thai"                       # en-US Cordia New Italic
  "cordiau.ttf:Thai"                       # en-US CordiaUPC
  "cordiaub.ttf:Thai"                      # en-US CordiaUPC Bold
  "cordiauz.ttf:Thai"                      # en-US CordiaUPC Bold Italic
  "cordiaui.ttf:Thai"                      # en-US CordiaUPC Italic
  "upcdl.ttf:Thai"                         # en-US DilleniaUPC
  "upcdb.ttf:Thai"                         # en-US DilleniaUPC Bold
  "upcdbi.ttf:Thai"                        # en-US DilleniaUPC Bold Italic
  "upcdi.ttf:Thai"                         # en-US DilleniaUPC Italic
  "upcel.ttf:Thai"                         # en-US EucrosiaUPC
  "upceb.ttf:Thai"                         # en-US EucrosiaUPC Bold
  "upcebi.ttf:Thai"                        # en-US EucrosiaUPC Bold Italic
  "upcei.ttf:Thai"                         # en-US EucrosiaUPC Italic
  "upcfl.ttf:Thai"                         # en-US FreesiaUPC
  "upcfb.ttf:Thai"                         # en-US FreesiaUPC Bold
  "upcfbi.ttf:Thai"                        # en-US FreesiaUPC Bold Italic
  "upcfi.ttf:Thai"                         # en-US FreesiaUPC Italic
  "upcil.ttf:Thai"                         # en-US IrisUPC
  "upcib.ttf:Thai"                         # en-US IrisUPC Bold
  "upcibi.ttf:Thai"                        # en-US IrisUPC Bold Italic
  "upcii.ttf:Thai"                         # en-US IrisUPC Italic
  "upcjl.ttf:Thai"                         # en-US JasmineUPC
  "upcjb.ttf:Thai"                         # en-US JasmineUPC Bold
  "upcjbi.ttf:Thai"                        # en-US JasmineUPC Bold Italic
  "upcji.ttf:Thai"                         # en-US JasmineUPC Italic
  "upckl.ttf:Thai"                         # en-US KodchiangUPC
  "upckb.ttf:Thai"                         # en-US KodchiangUPC Bold
  "upckbi.ttf:Thai"                        # en-US KodchiangUPC Bold Italic
  "upcki.ttf:Thai"                         # en-US KodchiangUPC Italic
  "leelawad.ttf:Thai"                      # en-US Leelawadee
  "leelawdb.ttf:Thai"                      # en-US Leelawadee Bold
  "upcll.ttf:Thai"                         # en-US LilyUPC
  "upclb.ttf:Thai"                         # en-US LilyUPC Bold
  "upclbi.ttf:Thai"                        # en-US LilyUPC Bold Italic
  "upcli.ttf:Thai"                         # en-US LilyUPC Italic
  "simfang.ttf:Simplified Chinese:zh_cn"   # zh-CN FangSong
  "simkai.ttf:Simplified Chinese:zh_cn"    # zh-CN KaiTi
  "msyh.ttc:Simplified Chinese:zh_cn"      # zh-CN Microsoft YaHei; Microsoft YaHei UI
  "msyhbd.ttc:Simplified Chinese:zh_cn"    # zh-CN Microsoft YaHei Bold; Microsoft YaHei UI Bold
  "msyhl.ttc:Simplified Chinese:zh_cn"     # zh-CN Microsoft YaHei Light; Microsoft YaHei UI Light
  "simhei.ttf:Simplified Chinese:zh_cn"    # zh-CN SimHei
  "simsunb.ttf:Simplified Chinese:zh_cn"   # en-US SimSun-ExtB
  "simsun.ttc:Simplified Chinese:zh_cn"    # zh-CN,zh-SG SimSun; NSimSun
  "kaiu.ttf:Traditional Chinese:zh_tw"     # zh-TW DFKai-SB
  "msjh.ttc:Traditional Chinese:zh_tw"     # zh-HK,zh-TW Microsoft JhengHei; Microsoft JhengHei UI
  "msjhbd.ttc:Traditional Chinese:zh_tw"   # zh-HK,zh-TW Microsoft JhengHei Bold; Microsoft JhengHei UI Bold
  "msjhl.ttc:Traditional Chinese:zh_tw"    # zh-TW,zh-HK Microsoft JhengHei Light; Microsoft JhengHei UI Light
  "mingliub.ttc:Traditional Chinese:zh_tw" # zh-HK,zh-TW MingLiU-ExtB; PMingLiU-ExtB; MingLiU_HKSCS-ExtB
  "mingliu.ttc:Traditional Chinese:zh_tw"  # zh-HK,zh-TW MingLiU; PMingLiU; MingLiU_HKSCS
)
#unset _tt_lang

_fn_fontlower() {
  # Lowercase the user supplied fonts (permanently)
  local _fnt
  for _fnt in *; do
    local _fntl="${_fnt,,}"
    if [ -f "${_fnt}" ] && [ "${_fntl: -4}" = '.ttf' -o "${_fntl: -4}" = '.ttc' ]; then
      chmod 644 "${_fnt}"
      if [ "${_fntl}" != "${_fnt}" ]; then
        mv "${_fnt}" "${_fntl}"
      fi
    fi
  done
}

# Generate a sorted table of non Latin international fonts so we can fill the
# language in by hand from Wikipedia. We preserve as much of the previous table
# as possible. This allows the _tt_lang table to be adapted to newer or older font
# sets where many of the fonts are the same.
# https://en.wikipedia.org/wiki/List_of_typefaces_included_with_Microsoft_Windows
_fn_gen_tt_lang() {
  _fn_fontlower
  declare -A _ck_latin   # _ck_latin['arial.ttf']='x' so we can avoid Latin fonts.
  declare -A _ck_tt_lang # Preserve _tt_lang entries we already have.
  local _sortbyname=0    # 0 to auto sort between package and names, 1 to only sort by name to check the finished list against Wikipedia.
  local _ttf
  # Generate associative arrays to turn intensive for loop lookups into fast conditionals
  for _ttf in "${_fnts_latin[@]}"; do
    _ck_latin["${_ttf}"]='x'
  done
  _ck_latin['marlett.ttf']='x'
  if [ ! -z "${_tt_lang:-}" ]; then
    for _ttf in "${_tt_lang[@]}"; do
      _ck_tt_lang["${_ttf%%${_tt_deli}*}"]="${_ttf}"
    done
  fi
  local _ttverinfo
  local _namej
  local _ttl
  rm -f 'PKGBUILD.tmp2' 'PKGBUILD.tmp'
  for _ttf in *.tt[fc]; do
    if [ -z "${_ck_latin[${_ttf}]:-}" ]; then
      _ttverinfo="$(./FONTVER.pl "${_ttf}")"
      echo "${_ttverinfo}"
      # zsh printf "-%s" justifies to the wrong side
      _namej="A$(echo "${_ttverinfo}" | cut -d' ' -f4-)"
      local _ttlfound="${_ck_tt_lang[${_ttf}]:=}"
      if [ -z "${_ttlfound}" ]; then
        _ttf="${_ttf}${_tt_deli}"
      else
        _ttf="${_ttlfound}"
        if [ "${_sortbyname}" -ne 0 ]; then
          _namej="B$(echo "${_ttverinfo}" | cut -d' ' -f4-)"
        else
          local _newnamej="$(echo "${_ttlfound}" | cut -d"${_tt_deli}" -f2)"
          local _newnamep="$(echo "${_ttlfound}" | cut -d"${_tt_deli}" -f3)"
          if [ -z "${_newnamep}" ]; then
            _newnamep="${_newnamej,,}"
          fi
          if [ ! -z "${_newnamej}" ]; then
            _namej="B${_newnamep}${_newnamej}{${_namej}"
          fi
        fi
      fi
      _namej="$(printf "%-40.40s" "${_namej}")" # This number can be arbitrairly large for good sorting
      _ttverinfo="$(echo "${_ttverinfo}" | cut -d' ' -f1,4-)"
      printf '%s   %-40s %s\n' "${_namej// /!}" "\"${_ttf}\"" "# ${_ttverinfo}" >> 'PKGBUILD.tmp2'
    fi
  done
  cat > 'PKGBUILD.tmp' << EOF
# Format: font.ttf${_tt_deli}Language Name${_tt_deli}pkgname
# Fill in Language Name by hand from any font list like Wikipedia.
# Fill in pkgname to assign each font to a package. I duplicated ttf-ms-win8.
# pkgname can be left out if its the lower case of Language Name.
# Entries that still need language info added by hand sort to top by font name.
# Entries with complete language info sort by pkgname and Language Name to the bottom so each package is shown together.
_tt_lang=(
EOF
  sort -f < 'PKGBUILD.tmp2' | cut -d' ' -f2- >> 'PKGBUILD.tmp'
  echo ')' >> 'PKGBUILD.tmp'
  rm -f 'PKGBUILD.tmp2'
  echo '_tt_lang array to PKGBUILD.tmp'
}
#_fn_gen_tt_lang; exit 1
unset -f _fn_gen_tt_lang

declare -gA _lang_xlat
declare -ga _lang_fonts
_fn_intlfontarrays() {
  # I'll generate all the other tables from tt_lang.
  declare -A _pkgnames
  for _pkgname in "${pkgname[@]}"; do
    _pkgnames["${_pkgname#${_pkgbase}-}"]='x'
  done
  unset _pkgnames["${_pkgbase}"]
  local _fnt
  for _fnt in "${_tt_lang[@]}"; do                 # kaiu.ttf,Traditional Chinese,zh_tw
    local _lang="$(echo "${_fnt}" | cut -d"${_tt_deli}" -f2)" # Traditional Chinese
    local _pkg="$(echo "${_fnt}" | cut -d"${_tt_deli}" -f3)"  # zh_tw or blank
    [ -z "${_pkg}" ] && _pkg="${_lang,,}"                     # zh_tw
    _fnt="$(echo "${_fnt}" | cut -d"${_tt_deli}" -f1)"        # kaiu.ttf
    if [ -z "${_pkgnames[${_pkg}]:-}" ]; then
      echo "Package name ${pkgbase}-${_pkg} does not exist!"
      exit 1
    fi
    #local _oldlang="${_lang_xlat[${_pkg}]:-}"
    #if [ ! -z "${_oldlang}" -a "${_lang}" != "${_oldlang}" ]; then
    #  echo "Inconsistent language translation for ${_pkg}: ${_lang} ${_oldlang}"
    #fi
    _lang_xlat["${_pkg}"]="${_lang}"
    eval "_fnts_${_pkg}+=('${_fnt}')"
    _lang_fonts+=("${_fnt}")
  done
  _lang_xlat['indic']='Indic'
  _lang_xlat['sea']='Southeast Asian'
  _lang_xlat['other']='Other'
}
_fn_intlfontarrays
unset -f _fn_intlfontarrays
unset _tt_lang _tt_deli

if [ "${_opt_Build}" -ne 0 ]; then
  _fonts+=("${_lang_fonts[@]}")
_fnt256sums+=(
  'c3582b918a37d1e790e20201538f83cf9abbfe1da1f365a6e185da95e5e65e4e' #  95 aldhabi.ttf   en-US Version 1.00 Aldhabi
  '344d04c650b6c7395052d885ed3f991f2c6a03334e2cc01fa035db755bbafb5b' #  96 andlso.ttf    en-US Version 6.00 Andalus
  'cb1d9b15973fdeacfa91790cba73513a96198bcfa49ad79dbdeaeea14ab4cf28' #  97 arabtype.ttf  en-US Version 6.00 Arabic Typesetting
  '545c6d4851aff59b69e4497571d839f9de10d4826051ab9e43ad1a76a2c07743' #  98 majalla.ttf   en-US Version 6.81 Sakkal Majalla
  '39a018898bd1909d3ef8236d0a4042f95a8e3028585e56297ba870e93152ecac' #  99 majallab.ttf  en-US Version 6.81 Sakkal Majalla Bold
  '2c33bc74c77b8b50607269d7ddb652b57c07d8251b600f458a29560014822db4' # 100 simpo.ttf     en-US Version 6.00 Simplified Arabic
  'c850629a1c374598dca85e316fb1db749a1de2e90064bf9c926fcace89d4c8ef' # 101 simpbdo.ttf   en-US Version 6.00 Simplified Arabic Bold
  'ab44ea1e8026f50336226d56ab6b9c8c970b30d24ec7bfcb9aef56b92a553fce' # 102 simpfxo.ttf   en-US Version 5.92 Simplified Arabic Fixed
  '5367b11550135c73c3c36112ba0d1a578cd016e7b465bf2a19faf0ddf82dfa20' # 103 trado.ttf     en-US Version 6.00 Traditional Arabic
  '577732b9e2b7421ae5c1acbe129a524b4dd91e761f911aa466e3c28aa5a56494' # 104 tradbdo.ttf   en-US Version 6.00 Traditional Arabic Bold
  '5f9212b7c496c4bf30371e414cc2f233b40427859bc7a6231daeb3ac0aa5b258' # 105 urdtype.ttf   en-US Version 6.00 Urdu Typesetting
  'f4c9e3ccea34ae0e80f64f596e2cb255e5285ce1372791a4fd1e1ec33d66c5b1' # 106 urdtypeb.ttf  en-US Version 6.00 Urdu Typesetting Bold
  '67b0eb541d6fa175f66462d6f67cdcf3aa33fa68518d9638cd01f0b30a1ace18' # 107 ahronbd.ttf   en-US Version 5.10 Aharoni Bold
  '36195afafaeaa7b69316673a81ab75df5c0768ab7e31a904b08b0bb8ccaf7c77' # 108 david.ttf     en-US Version 6.00 David
  'e83c2786178a634e759102c65f14c132108df5cdc9973f976906f1fdeafb753a' # 109 davidbd.ttf   en-US Version 6.00 David Bold
  '3d136d72da90110705ec941cef0f43b6130d5c19c1ac240dff57d307a2baa480' # 110 frank.ttf     en-US Version 5.10 FrankRuehl
  '475f8a2fbaadf3f1ff1af8be38863a73a55c46cf028d5d5aa1bb6ed550849623' # 111 gisha.ttf     en-US Version 5.01 Gisha
  '8964c68c2c8379de381cc04aaa54214fbb20d40b27cf6c674893b04facb03dac' # 112 gishabd.ttf   en-US Version 5.01 Gisha Bold
  '39198c907622033a06689814ec2b1b5baf7802c35c01352eb80d29339902be08' # 113 lvnm.ttf      en-US Version 6.00 Levenim MT
  'cf36592d517bee71662c66de2d4da49f097a1a57ad8cccae8dedcc21c65eac8e' # 114 lvnmbd.ttf    en-US Version 6.00 Levenim MT Bold
  'f33f9cbc89a2c762c2c4848d507ee1d9a2f45baa9fe092949d0c97d60d9d8131' # 115 mriam.ttf     en-US Version 5.10 Miriam
  'fc9c95e3dfc0997428940416fdb3979d2ca61909486c9992d59b5b81ae6cfacc' # 116 mriamc.ttf    en-US Version 5.10 Miriam Fixed
  'a334a89e21d97cd5d201ebfd731b7a754a69ea036de9f4e02d4df8b2af7b3cba' # 117 nrkis.ttf     en-US Version 5.10 Narkisim
  '44e8ff8682d518188aa1e3ac99b9c23a41adae8778f824aaca6f695b38314475' # 118 rod.ttf       en-US Version 5.10 Rod
  'a5fbba083a9a530629f9282abcd2d63d0e9ea3c4ad652548453cd9233af63470' # 119 shonar.ttf    en-US Version 6.81 Shonar Bangla
  '8d9c9df1b78741d1ec3efcd40494f8d13a5b2b9b9c441969ac50069e6a4ee2c6' # 120 shonarb.ttf   en-US Version 6.81 Shonar Bangla Bold
  '221352b83e1533cf0cc1af02ba1f95078e3bf9c6224065ccd24f372099af5617' # 121 aparaj.ttf    en-US Version 6.00 Aparajita
  '96891d989b2061078311b3a8335ff32304d35898ff758ef3a4efc140cca98dc2' # 122 aparajb.ttf   en-US Version 6.00 Aparajita Bold
  '7b54dffb36db3dfe37da396d6b0fa3be56ed9b204e639f5775eb4177fbbccfc1' # 123 aparajbi.ttf  en-US Version 6.00 Aparajita Bold Italic
  'fdfc09d111b80fbfdcaa99f71a8dd493acedeff6d114126f89dd19f62bf35b0a' # 124 aparaji.ttf   en-US Version 6.00 Aparajita Italic
  'c748aca1f98492f74bc7760624a8f6fd97ae095771e17ae07c2e4a2f8dae85e3' # 125 kokila.ttf    en-US Version 6.00 Kokila
  'd0ecd4c84f05d5b07b16fb55101fe8508b63980961cf7961ae25016395f6e4e0' # 126 kokilab.ttf   en-US Version 6.00 Kokila Bold
  '6899af2792457c071cea5b39e97dee54eb26af1297aa51ed59a8dbeac7af2cb1' # 127 kokilabi.ttf  en-US Version 6.00 Kokila Bold Italic
  'aee3cb1c75833ffae684f1bb3d99cb2950485171863d82649e58d14e42d5657d' # 128 kokilai.ttf   en-US Version 6.00 Kokila Italic
  '0dba2fc003d538720f9f0a2046769572fc7a050187a68ef21568b94562f74fe1' # 129 mangal.ttf    en-US Version 6.00 Mangal
  '67e4661b041dd5fffc1417d137d1138b3a145fe7b7e6711f62f1c9bd3bae1915' # 130 mangalb.ttf   en-US Version 6.00 Mangal Bold
  'a0bbd7043cd47231424e26c6e82501e39f75bfb29fd00ac6f3615c22aadce34c' # 131 utsaah.ttf    en-US Version 6.00 Utsaah
  '8eed0f36f36d5020fab2553a4dfd1d569ce75ba1b8f9b6cb1995c9ad856213c0' # 132 utsaahb.ttf   en-US Version 6.00 Utsaah Bold
  '1eb03ff3021da102fca0749e5d1e10b28c74bdcc6525632167fea6ac27e8649d' # 133 utsaahbi.ttf  en-US Version 6.00 Utsaah Bold Italic
  '1c10a13bb16920e7de95a2d5a85bb05be07087630e49f9ce1a23c20021ac330d' # 134 utsaahi.ttf   en-US Version 6.00 Utsaah Italic
  'f66aafad5733b8fba42f4335e781db0a0300b90b904fa39a21940f4596859fe5' # 135 shruti.ttf    en-US Version 6.00 Shruti
  'e7d9fe97adcba2a82930e0c7ee2259491ed7c798d3473e1754b023d499d78913' # 136 shrutib.ttf   en-US Version 6.00 Shruti Bold
  '1bf10658542e10288e84e046b54c9fb8c3a84e6a7866162505508d33237a4cac' # 137 raavi.ttf     en-US Version 6.00 Raavi
  'b238697bf107096e4adf3d227527c72258ce4c77e96981968e2e1f33abc2e211' # 138 raavib.ttf    en-US Version 6.00 Raavi Bold
  '9da7b75179a25f7b003dfe06418b79dcda911448b6c90c4f272360aaf61ef1cf' # 139 tunga.ttf     en-US Version 6.00 Tunga
  '08e7b31fec2a9fc18b163aa573e1309fee8fa6ed502185682c07218001c3906d' # 140 tungab.ttf    en-US Version 6.00 Tunga Bold
  '590fcec6d6efa2b2673e37ec67dfa425edc7862e872827cf550bdbb8714a1f3d' # 141 kalinga.ttf   en-US Version 6.00 Kalinga
  'bf0dad25b64870d790c278fbbecf06eb9533bf25a73b7e06eec034f916cda53d' # 142 kalingab.ttf  en-US Version 6.00 Kalinga Bold
  '108226242076e84de48cf1e4e53ee2e8b2d05d0dd98de00dc31908e13dca2989' # 143 kartika.ttf   en-US Version 6.00 Kartika
  'edb9c1dfa6e54001a86399aded9da37dabe57486266a361b41ef25bc68ee245c' # 144 kartikab.ttf  en-US Version 6.00 Kartika Bold
  'ff36c5a4cea53a6344ea411c95ff19087af773546d93c8fe11c41b05e76f3204' # 145 iskpota.ttf   en-US Version 6.00 Iskoola Pota
  '26f215dfc37776e366f3a8ca4cd18ba4b9a63863fff0c685a625afa7bda44de8' # 146 iskpotab.ttf  en-US Version 6.00 Iskoola Pota Bold
  '17d2b1f7afd83c32b0cfac106e9ebd85dda21d09fdf4e7e1644e9d0c5ecb1707' # 147 latha.ttf     en-US Version 6.00 Latha
  'e24b4e84571283b0221c77e77b06932bc457c5346cf14301db201dc835cc3b15' # 148 lathab.ttf    en-US Version 6.00 Latha Bold
  '73e47a7da2e80adc91299fe22e7ae93c88219f7a7c162b92a79a3414f80403a1' # 149 vijaya.ttf    en-US Version 6.81 Vijaya
  '15775010161c9f0de0ff2057c25644b1be821f66612366e71d1c56cfd8a9684f' # 150 vijayab.ttf   en-US Version 6.81 Vijaya Bold
  'a14e6503297b169d63e59591f15c69183a8e061c0b0d539cf1f2a8597ad880d9' # 151 vrinda.ttf    en-US Version 6.81 Vrinda
  '068dabccca71f81925e0eb432e3caec7f0d3f5cc59d56bf0dc5530566d564956' # 152 vrindab.ttf   en-US Version 6.81 Vrinda Bold
  '82133c6547b059b8aa28ff9fc2299d5f9002263c1e1ee4023c509556474c9e8d' # 153 gautami.ttf   en-US Version 6.00 Gautami
  '372dd0e86075711c25619ea1264cdad5ef1cce408b1fe258d4796a967b51de7b' # 154 gautamib.ttf  en-US Version 6.00 Gautami Bold
  '0e84f5bdae34cea321235a58ae2001b84948bf33e50252481a8a4b75474c07e7' # 155 vani.ttf      en-US Version 6.81 Vani
  'bf0acda08465b77fe7a314d698535fe59db4c179c3b9f8d172bfe9c2a493d66b' # 156 vanib.ttf     en-US Version 6.81 Vani Bold
  'df73c7658f367a2f446e6035024545f6f68c1d95fe71fbde4fd644ecf1ad0c74' # 157 meiryob.ttc   ja-JP Version 6.20 Meiryo Bold; Meiryo Bold Italic; Meiryo UI Bold; Meiryo UI Bold Italic
  '4388cc84338b3057b4b093cfe733614856b8de5bf57ef30bb79dc2c65682a107' # 158 meiryo.ttc    ja-JP Version 6.20 Meiryo; Meiryo Italic; Meiryo UI; Meiryo UI Italic
  '762bf8b66dddc38a05a379d16b9b86c3253a2c78cbe1e81a1cc49b18838d55bb' # 159 msgothic.ttc  ja-JP Version 5.10 MS Gothic; MS UI Gothic; MS PGothic
  'a9603003aa8b13f1c360919d528b3e2a0ca59c1bc74a0506691e0d64a88fa92b' # 160 msmincho.ttc  ja-JP Version 5.10 MS Mincho; MS PMincho
  'fda72f7e66bdd83644bdaea2696b3291a8f0416f9e1369221f31d4e75e93e6c6' # 161 yugothib.ttf  en-US Version 1.55 Yu Gothic Bold
  'fc9e3cf9e29f473d208f105a55de4105a798b5a74fecff76e055123b1e0008f1' # 162 yugothil.ttf  en-US Version 1.55 Yu Gothic Light
  'c4161dbe6d6ac38451cefbd22685acfe3ffd44ea1918846ea031072b66187fc2' # 163 yugothic.ttf  en-US Version 1.55 Yu Gothic Regular
  'fcb58baf4145cbc2010dbe83988a991a5572944a82da4e0713e89eef2bff706b' # 164 yumindb.ttf   en-US Version 1.55 Yu Mincho Demibold
  '6bf90baf218054c6914bc3828df0120fada11152dddb15574e8209fb6d271f35' # 165 yuminl.ttf    en-US Version 1.55 Yu Mincho Light
  '5effadfaeb9efec0519485e8c000dfce138b05e4346eae3627e6c761e5d0e00f' # 166 yumin.ttf     en-US Version 1.55 Yu Mincho Regular
  'aea7b99f51f6b3faae07adcee86b8563f76a206483db9590581f35e8b67d58b9' # 167 malgun.ttf    ko-KR Version 6.50 Malgun Gothic
  'f4f57a19450e3bc60fd5f93a0164351742988b329caf9b5ade2914491a021d43' # 168 malgunbd.ttf  ko-KR Version 6.50 Malgun Gothic Bold
  '091bab43d565fca1e500ceac91c57569bfae31d393d8a7987611dcd259eafe19' # 169 batang.ttc    ko-KR Version 5.00 Batang; BatangChe; Gungsuh; GungsuhChe
  'a167be36290c0696737da35eaf48b7ce7704d930985406a1e661f94e54fd191a' # 170 gulim.ttc     ko-KR Version 5.01 Gulim; GulimChe(5.00); Dotum(5.00); DotumChe(5.00)
  '49f9d5beb6b969d7b8a324fd2a5455bdbff8a4550a16f17372d36394dcb6810f' # 171 gadugi.ttf    en-US Version 1.06 Gadugi
  '7903c2f32a03f15fb530ac6af91de8f24644c63e86010b405d6ec7067d60dc06' # 172 gadugib.ttf   en-US Version 1.06 Gadugi Bold
  '111e9a7c41923626e6292b1c10c737eba893883c8d581f45bbbe7554486b51ca' # 173 nyala.ttf     en-US Version 5.01 Nyala
  'ec6fbf1ada52c339fcc8f22b012a7d0daddc442e4580510df739e0b5362b042c' # 174 ebrima.ttf    en-US Version 5.08 Ebrima
  'aba69d8121f37dd6d91d510a418750f0181b98a317b0884950c256806baa9c9d' # 175 ebrimabd.ttf  en-US Version 5.08 Ebrima Bold
  '7a74709fed27bfe3fb45c71ff3890bb9e3dacd43fc30e05c687017eb7f90822a' # 176 plantc.ttf    en-US Version 5.07 Plantagenet Cherokee
  'a3fb1c2c9d4d997f6d8c8805365b11865dcb582b4d6c27f13974c53b4f4efae0' # 177 estre.ttf     en-US Version 6.00 Estrangelo Edessa
  'f868204f2e0e21e6505cce1239501daa1c94ebcf7c956cfdb8cf7392666f5194' # 178 mvboli.ttf    en-US Version 6.00 MV Boli
  'bca2070adfbcad34b98dc9c2da03a34785f59093846d38bdc20e1bfd7aa1c9d5' # 179 euphemia.ttf  en-US Version 5.05 Euphemia
  '0bfea90a3fbc054af58cf685480c8945a395e53f4ecbbdacfba8f46e7ed88ddc' # 180 phagspa.ttf   en-US Version 5.97 Microsoft PhagsPa
  'fb1ce8e63d60deb36b29c9650c15085fee1c7491e8cd9a22ae08a15e27f6c48b' # 181 phagspab.ttf  en-US Version 5.97 Microsoft PhagsPa Bold
  'a38ee65ac36102201e61214f1b8c3d9f4bac502adcd24a60aa246bb66c15d347' # 182 nirmala.ttf   en-US Version 1.10 Nirmala UI
  'a01f9a035789e487eea4ea64c35a9f32c39755a45e6e6a36a38cfbfce17069dd' # 183 nirmalab.ttf  en-US Version 1.10 Nirmala UI Bold
  '81b212d54ced7280a2156a2bb6d9ff0eb98b982951c5a5978d053c72b3582a28' # 184 nirmalas.ttf  en-US Version 1.00 Nirmala UI Semilight
  'c2c03934436fc133679b5f20b4b1b9a118b80e8e0bdf18c632aae5ce28ff903f' # 185 javatext.ttf  en-US Version 1.00 Javanese Text
  '5ea3a22e03026f0ad4a9b7b8fdaf434e0af4dede482a11ac693e374f576c7e96' # 186 daunpenh.ttf  en-US Version 5.00 DaunPenh
  '98e460a046161f1cb484273bf5864269a835993303c623307d299baffd11b71e' # 187 khmerui.ttf   en-US Version 5.02 Khmer UI
  '414d1ba93212bf9afde96e95a416d50f83de609149e9eb04ba2949aae003501b' # 188 khmeruib.ttf  en-US Version 5.02 Khmer UI Bold
  'bb5d870471fda6310ed4ad1ea5419511e1e63ff4b19124035204aea05d12b99d' # 189 moolbor.ttf   en-US Version 5.00 MoolBoran
  'b9682c73a954f5a8a1b2a0ff88b4ff54cb20143a0330c3b1ccc2f9aede2838c7' # 190 dokchamp.ttf  en-US Version 5.00 DokChampa
  '0872ac0c1659c57e61d2f84be7a736546ba78d3b8aeb08d08f1b839b1528762f' # 191 laoui.ttf     en-US Version 5.01 Lao UI
  '2ffcb832b15dd7ca3968c9809a0dbc367e195deb64eeeac7b846452578449f3e' # 192 laouib.ttf    en-US Version 5.01 Lao UI Bold
  '982b460d6165766c1507f47b43913f89b5efdc9c5a99f18fdac9ba59ca4123ac' # 193 monbaiti.ttf  zh-CN Version 5.41 Mongolian Baiti
  '5fe58eb92beaf349f29c7f989e307701a62f60326c83379f0fd32d0930cd28d1' # 194 mmrtext.ttf   en-US Version 1.10 Myanmar Text
  'a90ddbb5a9459dac6f2cb816df3ceffb849a5e141ac8f7bf3fd2d8122ffed333' # 195 mmrtextb.ttf  en-US Version 1.10 Myanmar Text Bold
  '86e3908bf4dbeb1961649ff3f3c46d0f0d26f1ed98a172ad799b5528cf2cdd18' # 196 ntailu.ttf    en-US Version 5.96 Microsoft New Tai Lue
  '6ed996f44b0210bf00fb85ac1a39a83e0d92636a035643f54719055b9ea8c803' # 197 ntailub.ttf   en-US Version 5.96 Microsoft New Tai Lue Bold
  'ee70ba05a098a2b2c4b81e85a7bdd532bac5266c31c46a0ac649b06ba42c73ed' # 198 taile.ttf     en-US Version 5.96 Microsoft Tai Le
  '2c0b89ea18f2c9c7793f6adc65637e87c0c0a1f6781a49ad5f06e108d8b95a28' # 199 taileb.ttf    en-US Version 5.96 Microsoft Tai Le Bold
  'a13144b43eb90bb0c56a6d48fab9eae7c525e91eb332bfa561e5f2c26c7f83d7' # 200 himalaya.ttf  zh-CN Version 5.10 Microsoft Himalaya
  '6c32a5f5e4eb7d6f14ddc73073d78bb98f47a6ca5deaace9694289db18521244' # 201 msuighur.ttf  en-US Version 6.00 Microsoft Uighur
  '8ab5de475b91361575858e67ce5a55f22a60fc9dc54d4025dfe3504d805cbd22' # 202 msuighub.ttf  en-US Version 6.00 Microsoft Uighur Bold
  'd4e309672355628256f48fa783b8be1ac5b9a4f0feb8c4e6ae644cf301350f82' # 203 msyi.ttf      en-US Version 5.97 Microsoft Yi Baiti
  '98698d47ccc410ba01ae1a01f4f2511e031a589371966f91fcea62467aadab5e' # 204 leelawui.ttf  en-US Version 1.00 Leelawadee UI
  'deadd11ac366980b35ae2af8b3b65c7b83c0fae889d49e5fd16155df1064adb9' # 205 leelauib.ttf  en-US Version 1.00 Leelawadee UI Bold
  '2749ccda2b40a0f514b477b39bb1323f81e4001c3a795868e259d00556737331' # 206 leeluisl.ttf  en-US Version 1.00 Leelawadee UI Semilight
  '68ff605509f90727db6ed89eca7238e4174c597577530d98a02aa404b1406397' # 207 angsa.ttf     en-US Version 5.01 Angsana New
  'e4a2b23191e8b834be4b529653620242a465103fc74f12aceac99d0d1729063e' # 208 angsab.ttf    en-US Version 5.01 Angsana New Bold
  'f0f8cdac4ff4b9e36d1564ec121cf3df00cd6bb8ad17190a762db180670e6ab6' # 209 angsaz.ttf    en-US Version 5.01 Angsana New Bold Italic
  '838f22b4027d1df187c4b288d973504d6fe47d12c782cd7b5bf526a6dd2e875b' # 210 angsai.ttf    en-US Version 5.01 Angsana New Italic
  'd25d38720ff16e86fcbaac322e27b2b28d4ee66227f0334eea39ab0d680d7848' # 211 angsau.ttf    en-US Version 5.01 AngsanaUPC
  'afea7a5d88fbb34801c6e67466392fed30b20eb34680f43a866fc9b34ce23766' # 212 angsaub.ttf   en-US Version 5.01 AngsanaUPC Bold
  'eca9f9ec0977f352466d1dc214afa1a505a4f75ba60808d9d8ba85d9ac387e1a' # 213 angsauz.ttf   en-US Version 5.01 AngsanaUPC Bold Italic
  'db223237fdb4a5c6d7c9b33dbd81d2fb2dc9dd4a9ea88940a073fb3fa6c6dfe9' # 214 angsaui.ttf   en-US Version 5.01 AngsanaUPC Italic
  '6735574698be215db065758d2fc734b05df1f9184a7b9d6067a61d397ac4bbed' # 215 browa.ttf     en-US Version 5.01 Browallia New
  '686113728bfa9233edb871244b424c64a7d3d6400754bd7a2304932cdeac6ae3' # 216 browab.ttf    en-US Version 5.01 Browallia New Bold
  'ebf264d6257031e7c5abdf748efcf80417dd85253125c2fb6545f5f2f943097b' # 217 browaz.ttf    en-US Version 5.01 Browallia New Bold Italic
  'ded6a72d315743792aa78abe02e8444c6d8c4d7ac67539c432584b94c5c119ce' # 218 browai.ttf    en-US Version 5.01 Browallia New Italic
  '8babfdcdd802972896cd65b2dfbc3999901eb21d4ea5cc34adee3fa89ec2f607' # 219 browau.ttf    en-US Version 5.01 BrowalliaUPC
  '34799fdb6edc83aae7191f9af458893315c47a5ab241ef4794ac6321fe7bfe52' # 220 browaub.ttf   en-US Version 5.01 BrowalliaUPC Bold
  'a834f273bfc253c3c1777155195d182ad529c4d6b9b7670ed58b799eb6e73c07' # 221 browauz.ttf   en-US Version 5.01 BrowalliaUPC Bold Italic
  'c28fe503bfbeb3dca02842c90090f03a36f71a937f3424173be294fdef861e1d' # 222 browaui.ttf   en-US Version 5.01 BrowalliaUPC Italic
  'deb89852d064389a12d1b11beff9e3af8122bb4bed1372ff3e7c09c649ba5180' # 223 cordia.ttf    en-US Version 5.01 Cordia New
  '624975a9629087d72487e6af31d28d3066ad1c28919e4a9affd8bff456730ab5' # 224 cordiab.ttf   en-US Version 5.01 Cordia New Bold
  'a0d0fab62673417f327015373b11157b5aaa2f552778024b6177bb85fc026632' # 225 cordiaz.ttf   en-US Version 5.01 Cordia New Bold Italic
  'ec8648b0b545e55a936bdb7deb346d1bfbd51010ab29feb80112572c71333e3b' # 226 cordiai.ttf   en-US Version 5.01 Cordia New Italic
  'e3ee7b32f9b36f6d1c8ff2fb139c06ac8036c87d4facd58c4d66baf79e3d7f55' # 227 cordiau.ttf   en-US Version 5.01 CordiaUPC
  '9f0b7f87d2138e8397894b22d53d43ea1b55a92f12b3fc7b8b2c6cb8b197ba87' # 228 cordiaub.ttf  en-US Version 5.01 CordiaUPC Bold
  'ece13160479c08415dbd46ebba936fba1c48c9330a3f6dc8a74a39e6a2ced7f0' # 229 cordiauz.ttf  en-US Version 5.01 CordiaUPC Bold Italic
  '3622e287dd91461c1f0604db441f25e6dd98edc2225fbe369ed6402148a21b40' # 230 cordiaui.ttf  en-US Version 5.01 CordiaUPC Italic
  'c7c431b06dfdc2be21f70633fb5de46029fed15c8983c2f32174dcac4b1a11cf' # 231 upcdl.ttf     en-US Version 5.01 DilleniaUPC
  '5745b49e151e38a2e0b7e942e8d6e672349b6cbf45573e13cddfcba4767ecf19' # 232 upcdb.ttf     en-US Version 5.01 DilleniaUPC Bold
  'c6a8baecf4af7b99022d07b6a8c4bad3c790e2024d3a1d5d1b214019d4820058' # 233 upcdbi.ttf    en-US Version 5.01 DilleniaUPC Bold Italic
  '015087b08a05602092bab12d8d5541dc39db34985721fb8d1fe7027067a16ba4' # 234 upcdi.ttf     en-US Version 5.01 DilleniaUPC Italic
  '2c505e19d768a4db2b42c2b933f4f7a4520077b46dc15f35c5be409630ac5066' # 235 upcel.ttf     en-US Version 5.01 EucrosiaUPC
  'fde4fc8b12f3580107323e98a31530fb86a574b315442c1249b3032126f5f539' # 236 upceb.ttf     en-US Version 5.01 EucrosiaUPC Bold
  'f59264ef03a0923aa0926379b2e3e47e64dcdbb9ba291bddef6d8ad08b28953f' # 237 upcebi.ttf    en-US Version 5.01 EucrosiaUPC Bold Italic
  '6eaa69821682ef4718445353c3f48a52377b629d73a15bcb019e46a4297de20d' # 238 upcei.ttf     en-US Version 5.01 EucrosiaUPC Italic
  '10ed81a28f467f393b8de0fff4c4a9645f4a75df52da5294f3955370f4dcb5ca' # 239 upcfl.ttf     en-US Version 5.02 FreesiaUPC
  'cc85a5eca80d263f7cc9caa090ec570b6728a0d3ac57968deff5905aac15fea8' # 240 upcfb.ttf     en-US Version 5.02 FreesiaUPC Bold
  '2724edfb5c21469867cc093fcc7afbb2b3362257359337193b89b915237a256c' # 241 upcfbi.ttf    en-US Version 5.02 FreesiaUPC Bold Italic
  '0c2e761606cd53ac0f079bb91d237cde30a06608aaa1949af61bd2d999374d45' # 242 upcfi.ttf     en-US Version 5.02 FreesiaUPC Italic
  'a9f8478c4a51a2116182e3387edaf77141772730f696631fecf6cd8b5a124a35' # 243 upcil.ttf     en-US Version 5.02 IrisUPC
  '9d26975bad8d5e4cb78f11515e79c40047e1e34bdec6d233a6a84a3cd21b339b' # 244 upcib.ttf     en-US Version 5.02 IrisUPC Bold
  'a3222b7b29231905df91320ceba9285f6d3a191f2dc275f55b872aadff7c6b26' # 245 upcibi.ttf    en-US Version 5.02 IrisUPC Bold Italic
  '1e0baf66029f802e05435588e180967621b645a577bfff9d4558c731d82a29fc' # 246 upcii.ttf     en-US Version 5.02 IrisUPC Italic
  'f9e7d8e4a5e6783d0cf4a22caf642471ed18048a21967d1b749239cefd3f4b92' # 247 upcjl.ttf     en-US Version 5.01 JasmineUPC
  '716b9f05caaff0dfec2aa3aae33f08ddd8515d13983240532a12e994da9d9263' # 248 upcjb.ttf     en-US Version 5.01 JasmineUPC Bold
  '8dde222f65d5a97bc8148e58b40b3549a508a50de17e5b166dce8aa3129be8bb' # 249 upcjbi.ttf    en-US Version 5.01 JasmineUPC Bold Italic
  'e7677bd3087b74bf89481c1ca7a9352a51248cd906014ada703df9a178db0427' # 250 upcji.ttf     en-US Version 5.01 JasmineUPC Italic
  'f9e18b8fa70da172741e2db315167659448dee7382caa9e08b99544131506e5e' # 251 upckl.ttf     en-US Version 5.01 KodchiangUPC
  '54d977ef73a2eac035c6cef171f6441eafab1363c61ffc09525dfb941a773198' # 252 upckb.ttf     en-US Version 5.01 KodchiangUPC Bold
  'f555c56fd9ab7b674a8675bbee9ba803a27443bb5d27c9416dedf996a01d22c7' # 253 upckbi.ttf    en-US Version 5.01 KodchiangUPC Bold Italic
  'a52ae246dd669b7c8f0e0519ff63dcdef72cc61ba0410d92146e64c5983b78ea' # 254 upcki.ttf     en-US Version 5.01 KodchiangUPC Italic
  '11e1960d6aca5d6de0fcbeda530dbb3dea8837d810596c54235b07a9fbe43f9e' # 255 leelawad.ttf  en-US Version 5.05 Leelawadee
  '436bb96f8bbb151e7634fcea07794044a8565b013e505245322dafa13e6c3efd' # 256 leelawdb.ttf  en-US Version 5.05 Leelawadee Bold
  '2221765602bd9a4cc91da99652a3203d6fb80c655ff15cda003a28252afb6477' # 257 upcll.ttf     en-US Version 5.01 LilyUPC
  '0419cdf9c85467c5b02d194ad8f9902970fe6398aefc8e25fb46c1b9e72e0d07' # 258 upclb.ttf     en-US Version 5.01 LilyUPC Bold
  '32f823c300bb060774d0a81d9b870a1eb0eaab1f97324d47d5e7515f0473d89c' # 259 upclbi.ttf    en-US Version 5.01 LilyUPC Bold Italic
  '000445fb49f67d8211984de0b628666d03bf6b8d4f1490483f33c4503cd14510' # 260 upcli.ttf     en-US Version 5.01 LilyUPC Italic
  '521c6f7546b4eb64fa4b0cd604bbd36333a20a57e388c8e2ad2ad07b9e593864' # 261 simfang.ttf   zh-CN Version 5.01 FangSong
  'f49873fbe1689f1a37ed0f5765eb7d989d8a3b75210d1f1b66b74b043a1871be' # 262 simkai.ttf    zh-CN Version 5.01 KaiTi
  '57cbdb2a26edf53270e00a6486a2fc3e4ca80347522fe7e9ea0181a9621c0e4f' # 263 msyh.ttc      zh-CN Version 6.14 Microsoft YaHei; Microsoft YaHei UI
  '3f43d8932c4d8fa9f1a7a8da72b777249780ae267d7134ad3797461b9a97f99c' # 264 msyhbd.ttc    zh-CN Version 6.12 Microsoft YaHei Bold; Microsoft YaHei UI Bold
  '69b67c82ec337f4e8451cc08c2ebbf572f12a3a490dcdfc58aaf63e3f1ae8b10' # 265 msyhl.ttc     zh-CN Version 1.01 Microsoft YaHei Light; Microsoft YaHei UI Light
  '527fd44cafcd362fd0b2fc1849fd667581031bf89fdece2a6f34f6cebee74be3' # 266 simhei.ttf    zh-CN Version 5.03 SimHei
  'e414ce2cb5a62cef00cf184f7dbad32975a1db384f05e92dc5a9cad6a36d561a' # 267 simsunb.ttf   en-US Version 5.01 SimSun-ExtB
  '6b6b3cbe54d81d29106aedc45fbaf343ba9dee11dfc856656aefa2971307a2a9' # 268 simsun.ttc    zh-SG,zh-CN Version 5.13 SimSun; NSimSun
  '9e597a391d869a0526a2c1ad14714193abb1bd9e7d85738f9cece411018229b7' # 269 kaiu.ttf      zh-TW Version 5.00 DFKai-SB
  '4c089370d98a6c5f1ee19975ffc3a0ce932d67f7cb1e3db8493ac8b8c5eac3fa' # 270 msjh.ttc      zh-TW,zh-HK Version 6.11 Microsoft JhengHei; Microsoft JhengHei UI
  'f2f591aa21673bab8fb385ab529021c69e9bfa6c9f39b6fdb0909d6e4c4771dc' # 271 msjhbd.ttc    zh-TW,zh-HK Version 6.11 Microsoft JhengHei Bold; Microsoft JhengHei UI Bold
  '11648d0fbbf88f4726b54c5b6b93ddec25fe6c99b2c8aed68c778f60c4b4fc39' # 272 msjhl.ttc     zh-TW,zh-HK Version 1.00 Microsoft JhengHei Light; Microsoft JhengHei UI Light
  'bcd2ece54c61f5e20db1b2f60b4215274b3f9a92deba89e7b3f41085e1a31abb' # 273 mingliub.ttc  zh-TW,zh-HK Version 7.01 MingLiU-ExtB; PMingLiU-ExtB; MingLiU_HKSCS-ExtB
  '7040631880be2e6206ac6ddb40d72ab10fc34542a07a2ed0a2005b71ff8d9cce' # 274 mingliu.ttc   zh-HK,zh-TW Version 7.01 MingLiU; PMingLiU; MingLiU_HKSCS
)
_fnt256sumsx+=(
# Older international fonts from the Win8.0 DVD
  '46b9609efe1e421bc85bdb3f6502ed5b2ab457b3127a2638b8f60a9f3d750eea' #  96 andlso.ttf    en-US Version 5.99 Andalus
  'd7e11557e07f3b0e1af91bf3b8d68118a2df657f5a1c24245d91f7bb563c5912' #  97 arabtype.ttf  en-US Version 5.92 Arabic Typesetting
  'a719e6266de473deb30562c9a0f154a950eb16b47ff2a1afee1268cd1cd2d8f6' #  98 majalla.ttf   en-US Version 6.80 Sakkal Majalla
  '3e4a9f15b06c1429ac53c641089b349952ecca1d80e473a43f64fb4d78ecef2d' #  99 majallab.ttf  en-US Version 6.80 Sakkal Majalla Bold
  '9351bd6cfd6e66b47e2b0303eeea45f1ebc91216e03801cc60163e477e21bd0b' # 100 simpo.ttf     en-US Version 5.98 Simplified Arabic
  'e51f9aa8102e1356b3108aac3c642ba42436a00c0af3e9aac931a3b4c663a55c' # 101 simpbdo.ttf   en-US Version 5.98 Simplified Arabic Bold
  'acb1af67ef0a9bd90782772162a23cb2bd658a0743537940abc273e251bcc222' # 103 trado.ttf     en-US Version 5.98 Traditional Arabic
  '1704b76399017a67c1b0b79d14983a9f109018dfb059ad10541b2c9274c43f24' # 104 tradbdo.ttf   en-US Version 5.98 Traditional Arabic Bold
  '79a65ea7fec0e8585c088d227dcdca0b1be09d0831a8f30ce780008636866082' # 105 urdtype.ttf   en-US Version 5.93 Urdu Typesetting
  '195519d5ae4ee05e3482e2b9279c3edb3cdbc6ced594827fe601eff77aa6e34a' # 107 ahronbd.ttf   en-US Version 5.02 Aharoni Bold
  '989ca4279c8f18953cdef95804a201d87445d38728009fadd61fd8a2e86bae1d' # 108 david.ttf     en-US Version 5.02 David
  '8b9c0065059b945339580aaa423e98a25068f57142d9d787899efd735fecac31' # 109 davidbd.ttf   en-US Version 5.02 David Bold
  '7f9fa1010af645881b726591dac4062f5325a63be7369376b00ad4e71f277ee0' # 110 frank.ttf     en-US Version 5.02 FrankRuehl
  '52b3064f1f7d7ed12c150af8e7f53f1d1b167f5b65d633e345eb4419b418e7d2' # 113 lvnm.ttf      en-US Version 5.03 Levenim MT
  '6d2b46fb5a0aa413900b1b07a2095acf9e565cee5571161cc1cb322ebf86134e' # 114 lvnmbd.ttf    en-US Version 5.03 Levenim MT Bold
  'f959aa7adbb7ede2fa432faeea1e0a94d691b96aeb7460657aeef9d8e30ed2d4' # 115 mriam.ttf     en-US Version 5.02 Miriam
  'b8adec9fe72180fba8ee7a9c6598cfeb12970fedec2e77045f28c3b502c81d6e' # 116 mriamc.ttf    en-US Version 5.02 Miriam Fixed
  '0edbeea14891e350240504cfc15a43c6f25c448a13515b5df1beffbeaca9f3d2' # 117 nrkis.ttf     en-US Version 5.02 Narkisim
  'd4d45889fe78bf123010357c943f4af048ef1822bd1eaaa22407e58551a399a5' # 118 rod.ttf       en-US Version 5.02 Rod
  '0de729145aa9c2186558229f64d3ca6e3f8b712429cf1cad4c7cda2f5195bb6c' # 119 shonar.ttf    en-US Version 6.80 Shonar Bangla
  '0c28036efb076928850eeb09fd6498c92e5d96afd7f71dfb712de192aac13e49' # 120 shonarb.ttf   en-US Version 6.80 Shonar Bangla Bold
  '9b58268f84bee951b671b34e001566fbd2e0a00cdbcb33808f7039663478bf23' # 121 aparaj.ttf    en-US Version 5.92 Aparajita
  'fe02ca0d92d814e506dbd06e43a3f4187d67bcbf92bba6597b928793ef3fd3cd' # 122 aparajb.ttf   en-US Version 5.92 Aparajita Bold
  '059cb085f1b258067f87295eca776aa4fba7867749bf94d5efd17dc882813409' # 123 aparajbi.ttf  en-US Version 5.92 Aparajita Bold Italic
  'ecc69bf9b748cec26a204cd409f55d7d14323cd67543bd9a872cd5270ef8292b' # 124 aparaji.ttf   en-US Version 5.92 Aparajita Italic
  'e305b2431dc0611fce0ab5a2c71f76323ac8e97f024f07af5e6b88af85fe816d' # 125 kokila.ttf    en-US Version 5.92 Kokila
  'c975288a5f57e1c9083d4d16602db70d5a5f12233bae9468145192a4bfc4a57d' # 126 kokilab.ttf   en-US Version 5.92 Kokila Bold
  '7f049ca3954b9a996978509b6ba83d2344b92d5d82e61da58574d23ede0630f5' # 127 kokilabi.ttf  en-US Version 5.92 Kokila Bold Italic
  'e380b01ce1fc9a18fee093d971299ad9957255bb70a6bc9ce7fcb12e9f7408a5' # 128 kokilai.ttf   en-US Version 5.92 Kokila Italic
  '0e77754c4e3540e14cfc381be4b5829a42747f2075d400618c404a6681661128' # 129 mangal.ttf    en-US Version 5.94 Mangal
  '3c29ce71943ee184b906535891eecf46b2cbe82df76f9d1dcb11d0b9e99223d5' # 130 mangalb.ttf   en-US Version 5.94 Mangal Bold
  '6789555dd271bd76ea37b98f25058d494d3bddda915cd01b207d5ab525774034' # 131 utsaah.ttf    en-US Version 5.92 Utsaah
  '9edd71c73918d135bade2b45d633bcb6ebaa4d0814486b6495d343e30f2a5510' # 132 utsaahb.ttf   en-US Version 5.92 Utsaah Bold
  '7650cb75ab4b20694eb9823ac9655466dfb9c5f284b025950bab103f59ad20a5' # 133 utsaahbi.ttf  en-US Version 5.92 Utsaah Bold Italic
  'a84d5fb2c47294bd6868edf8cc8826b0d32303942d3d852bb83d4e684f3f65d1' # 134 utsaahi.ttf   en-US Version 5.92 Utsaah Italic
  '47d91d8185f9bc3478af3c1275d0343821cfadf8c3dad009ef0f9563002e3b17' # 135 shruti.ttf    en-US Version 5.94 Shruti
  'f001b0fb47ffd7034cce02c174cade7d4922b581e75df6a614e703181e322353' # 136 shrutib.ttf   en-US Version 5.94 Shruti Bold
  '595c587f08d81072b9cfbb0b084b3f6c096d0a732d165fc746a57aa6e33ae087' # 137 raavi.ttf     en-US Version 5.94 Raavi
  '85bb241d443b9b50f2f71ea1d569970d590bc38e98c6a83f182e9547d2fbbea0' # 138 raavib.ttf    en-US Version 5.94 Raavi Bold
  '548b1c1443effcf67d99188735a8e3e38dfea519a40c857eae26849c09a760f8' # 139 tunga.ttf     en-US Version 5.94 Tunga
  '5dff04676acd19c275649930959b54c38d3eedbcee7a9fc0c0c1f5bf2d176233' # 140 tungab.ttf    en-US Version 5.94 Tunga Bold
  'b1a8f6da10dab10aef24147ddd6b594b8e2f2fc5794185a812cdf7e07060fefe' # 141 kalinga.ttf   en-US Version 5.95 Kalinga
  '87f26624fa110dc0a821bb99ff64536907d063fc2d47f4e6cb657dae138ad80f' # 142 kalingab.ttf  en-US Version 5.95 Kalinga Bold
  '5b437d7611deaaa7b5cfab49e8f78d2f77a4f8b0cc89d18eefc47269920052cc' # 143 kartika.ttf   en-US Version 5.95 Kartika
  '37e70c5a83380dd67ca03571be33913e95b8fde2e983a87cf2df214e7ac33bcc' # 144 kartikab.ttf  en-US Version 5.95 Kartika Bold
  'fe4e0eff5d6bfbf87729a570e89a996cee519279869b27351342a2f893d7aaca' # 145 iskpota.ttf   en-US Version 5.94 Iskoola Pota
  '7dd874f646c0422ae6e77bd7f5606647802326692afe69eb55f2d4e0defda308' # 146 iskpotab.ttf  en-US Version 5.94 Iskoola Pota Bold
  '62ccbae983355d3839d69d5becbd2f733bd5a0ac207d50ed067a18ba18de42bc' # 147 latha.ttf     en-US Version 5.94 Latha
  'ab08ba02227e738701b2f5f3651705abae988f0e4b4a07bbebc57fe911ed08d4' # 148 lathab.ttf    en-US Version 5.94 Latha Bold
  '22b8e1416eb44c9dffc6ba11b9fa49f87d0b1b80ec996493582d659939c11e44' # 149 vijaya.ttf    en-US Version 6.80 Vijaya
  'fd0201213405aa36037c543325725289f7f49363a9eb11d0c2d55be37585b780' # 150 vijayab.ttf   en-US Version 6.80 Vijaya Bold
  '378191b6c66048bfcbede44e4a9be04acb9a2e281186919c35ecf86318d7fe5d' # 151 vrinda.ttf    en-US Version 6.80 Vrinda
  '26569b83b7c17a875a8db76d634839fa030a960c1dfd2e3f82234544268af9cc' # 152 vrindab.ttf   en-US Version 6.80 Vrinda Bold
  'd1eff040130808866aea96622986fcad5ddeb2c176f800aa7cef5d79278f613c' # 153 gautami.ttf   en-US Version 5.94 Gautami
  '62c94bfcdd79848bac51a78c580ece83f7a3a83e4ef6c58b7558be4892541c1b' # 154 gautamib.ttf  en-US Version 5.94 Gautami Bold
  '0bf486c9ee3f1424983802083566508e12c17de108020457bc73745280afcf7c' # 155 vani.ttf      en-US Version 6.80 Vani
  '389e0ca689d1d7bab7193ac6a4c62b93dad9d39d3a4b59c7643c6d82c20a3596' # 156 vanib.ttf     en-US Version 6.80 Vani Bold
  'df630636d16b743956a696253f31cac2e66d8be449528fdbf7b8a9a1bafc9f50' # 157 meiryob.ttc   ja-JP Version 6.12 Meiryo Bold; Meiryo Bold Italic; Meiryo UI Bold; Meiryo UI Bold Italic
  'e09d732425b8b68138f5580f790f95d194168a1ef4e541cdaf189f96361b23b3' # 158 meiryo.ttc    ja-JP Version 6.12 Meiryo; Meiryo Italic; Meiryo UI; Meiryo UI Italic
  '4fea4914840b97ebf95c6b10db2ed6037c5e56f88a2af1466ccc8e5b368d90b3' # 167 malgun.ttf    ko-KR Version 6.22 Malgun Gothic
  '77c86f538f9824636040298598e7179588c4f26c81094681c2c644dbd80b0439' # 168 malgunbd.ttf  ko-KR Version 6.22 Malgun Gothic Bold
  '927fb9474f1eeb09deaebf2bd1d2377eca8c5fe6bbd15bc47ec9cfa92084d5c7' # 171 gadugi.ttf    en-US Version 1.03 Gadugi
  '9fb9eac21906db8724424db4d3c651cad342651f3cc5b2fb96fb99640a930031' # 172 gadugib.ttf   en-US Version 1.03 Gadugi Bold
  '2e2169a472e18f83c0a84408d869551000c19cea64019f5c9cb212a33fd679a1' # 174 ebrima.ttf    en-US Version 5.06 Ebrima
  '90ad1632e0cd8e2496ca49274480b52d6a9e9f24c91b23af1f8ee8fe812d6dac' # 175 ebrimabd.ttf  en-US Version 5.06 Ebrima Bold
  'b0adefa6285fc2a6514e5dafb33c8452738691ad9bf47f8d0db9b5b4210105b9' # 177 estre.ttf     en-US Version 5.00 Estrangelo Edessa
  '27558b5d566a5d9dd25d0b675c85e3e287032eb107fe8898af7b4d4ec855f779' # 178 mvboli.ttf    en-US Version 5.01 MV Boli
  'bf6880a0f270f45424d35d88fb787218e151387e04c52431bc9a27e104ab17cf' # 180 phagspa.ttf   en-US Version 5.96 Microsoft PhagsPa
  '0b5b429fe614844e00911f20dc06a5c70c5e6f964b73037c7d7538fa11477aa3' # 181 phagspab.ttf  en-US Version 5.96 Microsoft PhagsPa Bold
  '01cda608c77af9d8a3a8c7ac77ed7c6cd2b85db63d20059a2d56e0220889e147' # 182 nirmala.ttf   en-US Version 1.01 Nirmala UI
  '2dc3c7e7f9fd0e020d87f9d06bee061e59d2e95789e1135c89396a97668e0d55' # 183 nirmalab.ttf  en-US Version 1.01 Nirmala UI Bold
  '717e973208db2a97a467402affc7b60373285f0826b42f9f9372e7174cd382e4' # 193 monbaiti.ttf  zh-CN Version 5.10 Mongolian Baiti
  '2a658c58752178b0c2736ae99ee1ff4f1d6f984a987cb73bf1427e9d8d9013e0' # 194 mmrtext.ttf   en-US Version 1.00 Myanmar Text
  'b46ec93017835ee3e0e9f41f4d0052dadd79cf345f92ff662e2aa64b766df78c' # 200 himalaya.ttf  zh-CN Version 5.06 Microsoft Himalaya
  '1da9b5ace583a0a52e85280264d84917630ff6d600caea9a1b99cbd7e8b7c07f' # 201 msuighur.ttf  en-US Version 5.93 Microsoft Uighur
  'c2f95d25963c01a980a9cb88615c5ab3949464bed519b1ad56acc671c4608c48' # 202 msuighub.ttf  en-US Version 5.93 Microsoft Uighur Bold
  '6404bed366fecf274f3be27d5e73254bece14ef23342d852fed9d219af659d43' # 207 angsa.ttf     en-US Version 5.00 Angsana New
  'dc78e5013080281400e816ef04d203b8dc1e5b7948c699a837afc35649817256' # 208 angsab.ttf    en-US Version 5.00 Angsana New Bold
  'd885794216928ed04809c1d23eae78a354e95024d5321a186035544e5a35fd9b' # 209 angsaz.ttf    en-US Version 5.00 Angsana New Bold Italic
  'b87d254d4f5b22b8bc5d07379101a635b8d3324586ae4c2c7bbbd61a3540d73e' # 210 angsai.ttf    en-US Version 5.00 Angsana New Italic
  '12902ff136ca3f299f7c25d5d31d872a7850dd7dfbed0770151ae1d667c092bb' # 211 angsau.ttf    en-US Version 5.00 AngsanaUPC
  '638289e7bbed5be501c8eb6697c708ee5ec562303ea51eaf2f8906731696d011' # 212 angsaub.ttf   en-US Version 5.00 AngsanaUPC Bold
  '3100caa371fe0a6a5ff3127e512b3ceb39e0c74e671c83c81718119ecbc5507a' # 213 angsauz.ttf   en-US Version 5.00 AngsanaUPC Bold Italic
  '940fc6e9040c55969c0197ae05620b91f0335e1d5b6e953b5b96463dd7c3bda7' # 214 angsaui.ttf   en-US Version 5.00 AngsanaUPC Italic
  '20ba365275e4972f1a68588c821cd1ec88656349633d4598a1dec93498d5638e' # 215 browa.ttf     en-US Version 5.00 Browallia New
  '69798848f0614eab0f9d04eb67b8942bb534f71cd7d0ab79e4608cf87fb66afb' # 216 browab.ttf    en-US Version 5.00 Browallia New Bold
  '89ad8ad5a6ec28e779e1a0f793b677501a57771b32878f9b5e868665324e04fd' # 217 browaz.ttf    en-US Version 5.00 Browallia New Bold Italic
  '5d2300334780434b86a12db6220c8ed7490ea68a17a99f94ce4aa798f21a7f87' # 218 browai.ttf    en-US Version 5.00 Browallia New Italic
  '098a849ddfbe1afd6c4e54c42deecd31d32c12da507916ce0ecc88947bc8a70a' # 219 browau.ttf    en-US Version 5.00 BrowalliaUPC
  '70503462f62f46ad0ab6a6ca7814953b9eb857877e74fc72979dfdba2606f53d' # 220 browaub.ttf   en-US Version 5.00 BrowalliaUPC Bold
  '58dd269b448b3abb62fc0764b4f1b48b0ce339052dd3db8d881e5db3e77dac8b' # 221 browauz.ttf   en-US Version 5.00 BrowalliaUPC Bold Italic
  'c379b968cb1561c52ee44e88bf16c4f93569f3067916de9a8a3c9c3c393852dd' # 222 browaui.ttf   en-US Version 5.00 BrowalliaUPC Italic
  'd03bd2ccc6505440f0fcfbb5cb4a9bf242791703cb87cd886c6760929ee766ac' # 223 cordia.ttf    en-US Version 5.00 Cordia New
  '5a12d0156247eb12b2d7680bff7d5ed9b44eb33cda9b4877736a88af2821777c' # 224 cordiab.ttf   en-US Version 5.00 Cordia New Bold
  'b848bc662135a8b08b8f46c2127176555b7453a0c89e42b2654e4f6de1661860' # 225 cordiaz.ttf   en-US Version 5.00 Cordia New Bold Italic
  '764401bf389db98a37f288c08c76bfe6b4ca8147995bef6f99312a1bfe185477' # 226 cordiai.ttf   en-US Version 5.00 Cordia New Italic
  '1034a31e8b6724305d01f812547de6943fbf32033a4736f4013eb194020279ba' # 227 cordiau.ttf   en-US Version 5.00 CordiaUPC
  'f8a8c99cbcf8a6f82951ccf399bddb5b32760dfdd40ee3f92e0fe33ffd93d822' # 228 cordiaub.ttf  en-US Version 5.00 CordiaUPC Bold
  '5a1d9d371256fba57d00ed06d27ca5cc3b18690358e03554589df96a6b7c68a8' # 229 cordiauz.ttf  en-US Version 5.00 CordiaUPC Bold Italic
  'dac15e34caa82d3b6e980a8010e0f06453b66aef393ac55e367a8e0c743c9058' # 230 cordiaui.ttf  en-US Version 5.00 CordiaUPC Italic
  '408848ec0cf386bf5e52800dcaa3113fc3fefd4c1c743bfe6871b6d91e9f7a21' # 239 upcfl.ttf     en-US Version 5.01 FreesiaUPC
  '1f2e7d4fa8e9aed1eb4bc4e625eedc6683c148a9d20566a692a67704a1eabfb6' # 240 upcfb.ttf     en-US Version 5.01 FreesiaUPC Bold
  '58cd5165d088860a68f6c3d3e10b9a1bd1336630770cdca9769944af067c9284' # 241 upcfbi.ttf    en-US Version 5.01 FreesiaUPC Bold Italic
  'c08a3f8f9680ec796464f8b1936ea96d41bd982c485ca6006b5628eb5cc0fb01' # 242 upcfi.ttf     en-US Version 5.01 FreesiaUPC Italic
  '96e25e1830e041af2ce430c3e4be8cbf49e2e5b9359b69dd3c50821474a1ab77' # 243 upcil.ttf     en-US Version 5.01 IrisUPC
  '94048fa81894578cfd03327dded12c38f663db34f8dfc1e6e30553ebfbb00ed9' # 244 upcib.ttf     en-US Version 5.01 IrisUPC Bold
  'bb6020a0c7896acea03bceff2ea847af854fc773d7eeaee176d6e4c86952e595' # 245 upcibi.ttf    en-US Version 5.01 IrisUPC Bold Italic
  '6a5a6e54fea01f599fc4176db6e1c24e171c6aad5933e6284d7dc8dfd7b66d48' # 246 upcii.ttf     en-US Version 5.01 IrisUPC Italic
  '34cb01a122f82b5ad76ee916dbb34ac35edb2916b857ac6ed4c8593a759ad5ab' # 263 msyh.ttc      zh-CN Version 6.10 Microsoft YaHei; Microsoft YaHei UI
  '4e4c62999230f7b5497105fbac586ec797b24d1c29c665ebc0b2b2037e838cf1' # 264 msyhbd.ttc    zh-CN Version 6.11 Microsoft YaHei Bold; Microsoft YaHei UI Bold
  '51896ed6d0cc48cfd9f716ce55da10d8abda19b8a7a210406d2c0102b3162aa2' # 268 simsun.ttc    zh-CN Version 5.04 SimSun; NSimSun
  'd5f8cc33a9046a8d4832b6240de683ff217f374e83ce573831808be477de321c' # 270 msjh.ttc      zh-HK,zh-TW Version 6.10 Microsoft JhengHei; Microsoft JhengHei UI
  'ce47d64b9bb5a6452b0a5f8bab2dabe20eb97d213d19695ac31ee05b2802aecf' # 271 msjhbd.ttc    zh-TW,zh-HK Version 6.10 Microsoft JhengHei Bold; Microsoft JhengHei UI Bold
)
fi

if [ "${_opt_Build}" -ne 1 ]; then
  for _pkgname in "${pkgname[@]}"; do
    if [ "${_pkgname##*-}" != 'latin' ]; then
      eval "unset _fnts_${_pkgname##*-}" # set -u will tell me when I forget something
    fi
  done
  unset _pkgname
  if [ "${_opt_Build}" -ne 2 ]; then
    unset _lang_fonts
  fi
  unset pkgname # destroy the array identify
  pkgname="${pkgbase}"
  unset pkgbase
fi

if [ "${_opt_Optimal}" -ne 0 ]; then
  _fnt256sumsx=('x') # The main array has the optimal fonts
fi

# No bans for Windows fonts
_fnt256bans=('x')

_fn_gencopy() {
  # Generate handy copy scripts.
  rm -f '_COPY.BAT'
  if [ ! -s '_COPY.BAT' ]; then
    cat > '_COPY.BAT' << EOF
@ECHO OFF
CLS

REM **** DELETE FROM HERE ****
ECHO THIS BAT FILE MUST BE EDITED TO USE.
PAUSE
EXIT
REM **** TO HERE ****
REM REM out or remove the previous 5 lines to enable this BAT file.
REM We did the hard part by picking all the files. You do the easy part by
REM editing the following to match to your environment.

REM Sometimes this must be run as admin because some fonts don't have the right permissions.

REM You can use this to copy fonts from a running Windows to a Samba share
SET MYSHARE=\\\\192.168.1.10\\_INCO\\TTFONTS-${pkgname}
REM How about a folder on your desktop
REM SET MYSHARE=%USERPROFILE%\\Desktop\\TTFONTS-${pkgname}
REM How about to your flash drive
REM SET MYSHARE=G:\\TTFONTS-${pkgname}
MKDIR "%MYSHARE%"
EOF
    local _fontno=0
    local _fontodo=0
    local _fnt
    for _fnt in "${_fonts[@]}"; do
      local _fntl="${_fnt,,}"
      if [[ ! "${_fntl}" == *.tt[fc] ]]; then
        echo "Fonts array not a font ${_fnt}"
        rm -f '_COPY.BAT'
        set +u
        false
      fi
      _fontno=$((${_fontno}+1))
      if [ "${_fontodo}" -le 0 ]; then
        _fontodo=24
        echo "ECHO ${_fontno}" >> "_COPY.BAT"
      fi
      _fontodo=$((${_fontodo}-1))
      [ -s "${_fnt,,}" ] && echo -n "REM " >> "_COPY.BAT"
      echo 'COPY "%WINDIR%\FONTS\'"${_fnt}"'" "%MYSHARE%\'"${_fnt,,}"'"' >> '_COPY.BAT'
    done
    echo 'PAUSE' >> '_COPY.BAT'
    chmod 755 '_COPY.BAT' # You can run this from the share
    sed -i -e 's:$:\r:g' '_COPY.BAT' # unix2dos with sed http://pmoghadam.com/homepage/HTML/dos2unix.html
  fi
  rm -f '_COPY.sh'
  if [ ! -s '_COPY.sh' ]; then
    local _fnthave=()
    local _fntnot=()
    local _fnt
    for _fnt in "${_fonts[@]}"; do
      [ -s "${_fnt,,}" ] && _fnthave+=("${_fnt,,}") || _fntnot+=("${_fnt,,}")
    done
    cat > '_COPY.sh' << EOF
#!/bin/sh
# Enable and edit the server in the following line as necessary.
#smbclient '//192.168.1.10/C' -U 'GUEST%' -c "prompt; cd WINDOWS/FONTS; mget ${_fntnot[@]:-}"

# These fonts we already have
##smbclient '//192.168.1.10/C' -U 'GUEST%' -c "prompt; cd WINDOWS/FONTS; mget ${_fnthave[@]:-}"
EOF
    chmod 755 '_COPY.sh'
  fi
}

_fn_updpkgsums() {
  _fn_fontlower
  local _fnt
  echo 'Sums to PKGBUILD.tmp'
  if ! :; then
    local _fonts2=()
    for _fnt in ${_fonts[@]}; do
      _fonts2+=("${_fnt,,}")
    done
    cat > 'PKGBUILD.tmp' << EOF
source=(${_fonts2[@]})
#Copy these sums into PKGBUILD and erase this file
EOF
    echo "sha256sums=('x')" >> "PKGBUILD.tmp"
    updpkgsums 'PKGBUILD.tmp'
    sed -i -e 's:^sha256sums=:_fnt256sums=:g' 'PKGBUILD.tmp'
  else
    declare -gA _sumstext
    cat > 'PKGBUILD.tmp' << EOF
#Copy these sums into PKGBUILD and erase this file.
#Many packages need these to be split and copied to multiple places.
#If so, the package should arrange them so the splits are easy.
_fnt256sums=(
EOF
    local _fontno=0
    for _fnt in ${_fonts[@]}; do
      _fnt="${_fnt,,}"
      local _vers
      local _fail=1
      if [ "${_opt_GetFontName}" -ne 0 ] && [[ "${_fnt}" == *.tt[fc] ]]; then
        _fail=0
        _vers="$(./FONTVER.pl "${_fnt}")" || _fail=$?
      fi
      if [ "${_fail}" -ne 0 ]; then
        _vers="$(sed -ne 's:^.*\(Version [0-9\.]\+\).*$:\1:p' "${_fnt}" | head -n1)"
        #if [[ "${_fnt}" == *.tt[fc] ]]; then
        #  _vers="${_vers} ${_ttc_names[${_fnt}]:-}"
        #fi
      fi
      _fontno=$((${_fontno}+1))
      local _sumtext="$(printf "  '%s' # %3u %-13s %s" "$(sha256sum "${_fnt}" | cut -d' ' -f1)" "${_fontno}" "${_fnt}" "${_vers}")" # "
      echo "${_sumtext}" >> 'PKGBUILD.tmp'
      #_sumstext+=("${_fnt},${_sumtext}")
      _sumstext["${_fnt}"]="${_sumtext}"
    done
    echo ')' >> 'PKGBUILD.tmp'
  fi
}
#_fn_updpkgsums; exit 1

# sum $1 must match sum $2 or be found anywhere in _fnt256sumsx. sum must not
# be in _fnt256bans.
# This best preserves the spirit and function of hash checking and eliminates 
# the hassle and security problems of having users update sums with no 
# verification that their versions are correct (or the author's versions are
# wrong). We're trading the small likelyhood of a TTF containing a virus with 
# the small likelyhood that someone can produce a hacked font with any one of 
# the sums in _fnt256sumsx.
_fn_softmatch() {
  [ -z "$1" ] && return 1 # file not found
  [ "$1" = "$2" ] && return 0
# http://stackoverflow.com/questions/3685970/check-if-an-array-contains-a-value
  local _sum
  for _sum in "${_fnt256bans[@]}"; do
    if [ "$1" = "${_sum}" ]; then
      echo "Font $3 cannot be used for any reason. Please find a different version."
       return 1
    fi
  done
  for _sum in "${_fnt256sumsx[@]}"; do
    [ "$1" = "${_sum}" ] && return 0
  done
  return 1
}

_fn_fontcheck() {
  # Verify font check sum, missing, or extra fonts
  local _extrafonts=(*.tt[fc])
  local _notfound=0
  local _notfoundar=()
  local _mismatch=0
  local _mismatchar=()
  local _i
  for ((_i=0;_i<${#_fonts[@]};++_i)); do
    local _fnt="${_fonts[${_i}]}"
    _fnt="${_fnt,,}"
    local _delfont
    for _delfont in ${!_extrafonts[@]}; do
      if [ "${_fnt}" = "${_extrafonts[$_delfont]}" ]; then
        unset _extrafonts[${_delfont}]
      fi
    done
    if [ ! -s "${_fnt}" ]; then
      _notfound=$((${_notfound}+1))
      _notfoundar+=("${_fnt}")
    elif ! _fn_softmatch "$(sha256sum < "${_fnt}" | cut -d' ' -f1)" "${_fnt256sums[${_i}]:-}" "${_fnt}"; then
      _mismatch=$((${_mismatch}+1))
      _mismatchar+=("${_fnt}")
      if [ "${_opt_SkipMissing}" -eq 2 ]; then
        ln -sf "${startdir}/${_fnt}" "${srcdir}/${_fnt}"
      fi
    else
      ln -sf "${startdir}/${_fnt}" "${srcdir}/${_fnt}"
    fi
  done
  if [ "${_mismatch}" -gt 0 ]; then
    if [ "${_opt_Optimal}" -eq 0 -a "${_opt_SkipMissing}" -ne 2 ]; then
      _fn_updpkgsums
      local _mismatchsum
      echo -e '#extra sums not yet in the arrays\n_sha256sumsx+=(' >> "PKGBUILD.tmp"
      for _mismatchsum in "${_mismatchar[@]}"; do
        echo "${_sumstext[${_mismatchsum}]}" >> "PKGBUILD.tmp"
      done
      echo ')' >> "PKGBUILD.tmp"
      unset _sumstext
    fi
    echo "Mismatch hash on ${_mismatch} font(s)"
    echo "${_mismatchar[@]}"
    echo 'Check your files or copy the sums from PKGBUILD.tmp to PKGBUILD'
  fi
  if [ "${_notfound}" -gt 0 ]; then
    echo "Unable to find ${_notfound} font(s)"
    echo "${_notfoundar[@]}"
    echo "See the the supplied _COPY scripts for easy ways to get the fonts from Windows."
  fi
  if [ ! -z "${_extrafonts:-}" ]; then
    echo "Extra fonts: ${_extrafonts[@]}"
  fi
  if [ "${_mismatch}" -gt 0 -a "${_opt_SkipMissing}" -lt 2 -o "${_notfound}" -gt 0 -a "${_opt_SkipMissing}" -lt 1 ]; then
    echo
    echo 'Any missing files must be supplied and editing of the PKGBUILD may be required.'
    echo 'Edit the PKGBUILD for instructions and changes.'
    echo 'The necessity for user intervention makes this PKGBUILD not compatible with'
    echo '1 step package installers like packer or yaourt.'
    set +u
    false
  fi
}

# Apply patches and timestamps to files. sha256sum must match to ensure we only patch the right version and can't repatch.
_fn_fontpatch() {
  local _patch
  for _patch in *=patch; do
    local _fnt="$(cut -d= <<< "${_patch}" -f1)"
    local _sum="$(cut -d= <<< "${_patch}" -f2)"
    if [ -f "${_patch}" -a -f "${_fnt}" ] && [ "$(sha256sum < "${_fnt}" | cut -d' ' -f1)" = "${_sum}" ]; then
      rm -f "${_fnt}.tmp"
      mv "${_fnt}" "${_fnt}.tmp"
      bspatch "${_fnt}.tmp" "${_fnt}" "${_patch}"
      #touch -r"${_fnt}.tmp" "${_fnt}"
      local _fntdt="$(cut -d= <<< "${_patch}" -f3)"
      touch -d"${_fntdt}" "${_fnt}"
      rm -f "${_fnt}.tmp"
    fi
  done
}

# Tabs are essential!
# Important: use real tab characters!
_ff_script=\
'		i = 1
		while (i < $argc)
			theFontNames = FontsInFile($argv[i])
			cnt = SizeOf(theFontNames)
			j = 0
			while (j < cnt)
				thefontname = theFontNames[j]
				thisPath = $argv[i] + "(" + thefontname + ")"
				Open(thisPath, 1)
				Generate(thefontname + ".ttf", "ttf")
				Print(thefontname + ".ttf")
				Close()
				j++
			endloop
		i = i+1
		endloop
'

build() {
  if [ "$(grep -c $'\t' <<<"${_ff_script}")" -lt 16 ]; then
    echo 'Tabs are required in _ff_script. Please fix PKGBUILD.'
    false
  fi
  set -u
  cd "${startdir}"
  _fn_gencopy
  _fn_fontlower
  _fn_fontpatch
  _fn_fontcheck
  rm -f 'PKGBUILD.tmp'

  # The TTC is now selectable in LibreOffice and XFCE Terminal so no more conversion.
  # This is the old conversion code. The new conversion code in package() doesn't miss Cambria Math
  #cd "${srcdir}"
  #if [ -s 'cambria.ttc' ]; then
  #  # cambria.ttc is a TrueType Collection (TTC) which causes problems with
  #  # LibreOffice (Cambria Regular cannot be selected) so we need to convert
  #  # the TTC into a TrueType Font (TTF).
  #  FONTFORGE_LANGUAGE=ff fontforge -c 'Open("cambria.ttc(Cambria)"); Generate("cambria.ttf")'
  #fi
  set +u
}

# This package function is only used by font packages that do not have a pkgbase like ttf-office-2007.
# It is not used in packages with splits ttf-win7-fonts or ttf-ms-win8.
package() {
  set -u
  cd "${srcdir}"

  # Convert all enclosed TTC to TTF if requested
  local _fnt
  if [ "${_opt_ConvertTTC}" -ne 0 ]; then
    declare -a _ttcs_to_extract
    local _fntno
    for _fntno in "${!_fonts[@]}"; do
      _fnt="${_fonts[${_fntno}]}"
      if [[ "${_fnt}" == *.ttc ]]; then
        _ttcs_to_extract+=("${_fnt}")
        _fonts[${_fntno}]=''
      fi
    done

    if [ ! -z "${_ttcs_to_extract:-}" ] && readarray -t _extracted_ttfs < <(fontforge -lang='ff' -c "${_ff_script}" "${_ttcs_to_extract[@]}"); then
      _fonts+=("${_extracted_ttfs[@]}")
    fi
  fi

  # Prepare destination directory
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"

  # Install fonts
  for _fnt in "${_fonts[@]}"; do
    if [ ! -z "${_fnt}" ]; then
      install -pm644 "${_fnt}" "${pkgdir}/usr/share/fonts/TTF/${_fnt,,}"
    fi
  done

  # Install license
  install -Dpm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'license.rtf'
  set +u
}

# Universal package function:
# $1 = package to make like arabic, latin, or all
function _package {
  set -u
  cd "${srcdir}"

  local _fontsout
  local _winlistconflict=('ttf-win7-fonts')
  local _win
  if [ "$1" = 'latin' ]; then
    pkgdesc="${_pkgdesc//%/Latin}"
  elif [ "$1" = 'all' ]; then
    #pkgdesc="${_pkgdesc//%/Latin and International}"
    for _win in "${_winlistconflict[@]}"; do
      local _lang
      for _lang in "${!_lang_xlat[@]}"; do
        conflicts+=("${_win}-${_lang}")
      done
    done
    for _lang in "${!_lang_xlat[@]}"; do
      provides+=("${_pkgbase}-${_lang}")
      conflicts+=("${_pkgbase}-${_lang}")
    done
    conflicts+=('ttf-win7-fonts-cjk')
  else
    pkgdesc="${_pkgdesc//%/${_lang_xlat[$1]}}"
    provides=() # ($1)
    optdepends=()
    conflicts=()
    for _win in "${_winlistconflict[@]}"; do
      conflicts+=("${_win}-$1")
    done
    case "$1" in
      zh_tw|zh_cn|japanese|korean) conflicts+=('ttf-win7-fonts-cjk');;
    esac
  fi
  eval '_fontsout=("${_fnts_'"$1"'[@]}")'

  # Convert all enclosed TTC to TTF if requested
  local _fnt
  if [ "${_opt_ConvertTTC}" -ne 0 ]; then
    declare -a _ttcs_to_extract
    local _fntno
    for _fntno in "${!_fontsout[@]}"; do
      _fnt="${_fontsout[${_fntno}]}"
      if [[ "${_fnt}" == *.ttc ]]; then
        _ttcs_to_extract+=("${_fnt}")
        _fontsout[${_fntno}]=''
      fi
    done

    if [ ! -z "${_ttcs_to_extract:-}" ] && readarray -t _extracted_ttfs < <(fontforge -lang='ff' -c "${_ff_script}" "${_ttcs_to_extract[@]}"); then
      _fontsout+=("${_extracted_ttfs[@]}")
    fi
  fi

  # Install fonts
  for _fnt in "${_fontsout[@]}"; do
    if [ ! -z "${_fnt}" ]; then
      install -Dpm644 "${_fnt}" "${pkgdir}/usr/share/fonts/TTF/${_fnt,,}" || :
    fi
  done

  # according to /etc/fonts/conf.d/README these are numbered 20 to come before 30 through 39 family substitution
  if [ "$1" = 'all' ]; then
    local _conf
    for _conf in "20-${_pkgbase}"-*.conf; do
      backup+=("etc/fonts/conf.avail/${_conf}")
      install -Dpm644 -t "${pkgdir}/etc/fonts/conf.avail" "${_conf}"
      install -d "${pkgdir}/etc/fonts/conf.d"
      ln -sf "/etc/fonts/conf.avail/${_conf}" "${pkgdir}/etc/fonts/conf.d/${_conf}"
    done
  else
    # Install available fontconfig fix.
    local _conf="20-${_pkgbase}-$1.conf"
    if [ -e "${_conf}" ]; then
      backup=("etc/fonts/conf.avail/${_conf}")
      install -Dpm644 -t "${pkgdir}/etc/fonts/conf.avail" "${_conf}"
      install -d "${pkgdir}/etc/fonts/conf.d"
      ln -sf "/etc/fonts/conf.avail/${_conf}" "${pkgdir}/etc/fonts/conf.d/${_conf}"
    fi
  fi

  # Install license
  install -Dpm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'license.rtf'
  set +u
}

# Generate the split package functions to universal _package.
case "${_opt_Build}" in
0)
  package() {
    _package 'latin'
  }
  ;;
1)
  unset -f package
  for _package_name in ${pkgname[@]}; do
    eval "package_${_package_name}() { _package ${_package_name##*-}; }"
  done
  unset _package_name
  eval "package_${pkgbase}() { _package 'latin'; }"
  ;;
2)
  _fnts_all=("${_fnts_latin[@]}" "${_lang_fonts[@]}")
  package() {
    _package 'all'
  }
esac

set +u
# vim: set ts=2 sw=2 ft=sh noet:
