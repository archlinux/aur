# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Nowaker
# Contributor: Martin Schmoelzer mschmoelzer gmail

_opt_Build=0 # Default 0
# 0=Build only Latin fonts package (the original, use with mksrcinfo)
# 1=Also build international fonts as separate packages for selective install.
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
#   The best versions come from a fully updated Windows 7 SP1.
#   Installed software like Office shouldn't overwrite the Windows 7 fonts.
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
# This package is intended as a more up-to-date replacement for the AUR
# 'ttf-ms-fonts' and 'ttf-vista-fonts' packages. It provides newer versions of
# the fonts in these packages.
# Due to license issues and availability the fonts cannot be downloaded automatically.
#
# You must acquire them from a running Windows 7 system or install media:
#  - Running Windows 7 system: fonts are located in C:\Windows\Fonts
#  - Windows 7 install media: fonts are located in sources/install.wim, which
#    is a "Windows Imaging Format" archive. This archive can be extracted with
#    7-zip (p7zip package): "7z x install.wim 1/Windows/Fonts"
#    Alternatively, you can use GNOME's File Roller (and maybe other archive
#    managers) to extract the files if the p7zip package is installed.
#  The 7Zip File Manager can be used in Windows to extract the files.
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

# An updated Windows 7.1 SP1 has 21 fonts newer than the 7.1 DVD.
#  - (4) Arial
#  - (4) Calibi non Light
#  - (1) Microsoft Sans Serif
#  - (4) Segoe (some fonts)
#  - (1) Segoe Symbol
#  - (2) Tahoma
#  - (4) Times New Roman
#  - (1) Verdana

# Two fonts are not on the Windows 7 DVD but are delivered only by Windows Update
# so can only be obtained from a running Windows. They are supplied with any
# Windows 8 or 8.1 DVD.
#  - (1) Calibri Light
#  - (1) Calibri Light Italic
# These can be installed in Windows manually from
# https://support.microsoft.com/en-us/kb/2761217 An update is available to add the Calibri Light and Calibri Light Italic fonts to Windows 7 and Windows Server 2008 R2

# Windows 7 SP1 has newer versions of the following 19 fonts:
#  - (4) Arial
#  - (4) Cambria
#  - (1) Gabriola
#  - (2) Mangal (international)
#  - (4) Times New Roman
#  - (4) Verdana
#
# These newer fonts can be extracted from the Windows 7 SP1 updater with the
# following commands:
#  $ cd ~/build/tty-win7-fonts  # (or any other working directory)
#  $ (use the X86 download, it's half the size) wget 'http://download.microsoft.com/download/0/A/F/0AFB5316-3062-494A-AB78-7FB0D4461357/windows6.1-KB976932-X64.exe'
#  $ wget 'http://download.microsoft.com/download/0/A/F/0AFB5316-3062-494A-AB78-7FB0D4461357/windows6.1-KB976932-X86.exe'
#  $ cabextract -F '*.tt[fc]' -d 'win7_sp1' 'windows6.1-KB976932-X86.exe'
#  $ mkdir -p 'sp1-fonts'
#  $ find 'win7_sp1' -name '*.tt[fc]' -exec cp -p '{}' ./sp1-fonts/ \;
#
# This will copy the fonts to the "sp1-fonts" directory. This is a large
# file (920MiB or 550MiB) and has only a few fonts so it's not worth downloading
# unless you need newer font versions and have no other way to get them.

# Some mistakes in ttf-win7-fonts-autodownload
# (This packages was deleted from the AUR August 2015)
# Didn't download the freely available Andale, see ttf-ms-fonts
# Newer Arial Black available, see ttf-ms-fonts
# Downloads Arial & Calibri twice, once in zip, and once in SP1 update and overwrites the newer version with the older version.
# Downloads 900MiB SP1 to get 6MB of fonts.
# No international fonts
# Dependency on convmv to do case change more easily done to US ASCII filenames by bash ${var,,}
# Why call it Win7 when so few of the fonts are Win7 related?

# Some mistakes in ttf-ms-win8
# Using variables without leading underscore
# Not using local on variables
# Too little commenting, including the purpose of _extract_ttcs
# Using "function".
# Labels the source arrays with versions without consideration that there might be multiple versions. I label the sums arrays.
# The ${pkgbase} technique seems to not be like the instructions
# Filename case is not managed leading to user confusion.

set -u
_pkgbase='ttf-win7-fonts'
pkgbase="${_pkgbase}"
pkgname=("${pkgbase}"{,-arabic,-hebrew,-sea,-indic,-japanese,-korean,-zh_cn,-zh_tw,-thai,-other})
pkgver='7.1'
pkgrel='9'
_pkgdesc='Microsoft Windows 7 % TrueType fonts'
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
provides=('ttf-font' 'ttf-ms-fonts' 'ttf-tahoma' 'ttf-vista-fonts')
conflicts=('ttf-ms-fonts' 'ttf-tahoma' 'ttf-vista-fonts' 'ttf-ms-win8' 'ttf-win7-fonts-autodownload')
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
######################################################################################################
#        Normal         Light           Bold            Italic          Light+Italic     Bold+Italic #
######################################################################################################
        'arial.ttf'                     'arialbd.ttf'   'ariali.ttf'                     'arialbi.ttf'
        'comic.ttf'                     'comicbd.ttf'
        'cour.ttf'                      'courbd.ttf'    'couri.ttf'                      'courbi.ttf'
        'Gabriola.ttf'
        'georgia.ttf'                   'georgiab.ttf'  'georgiai.ttf'                   'georgiaz.ttf'
        'impact.ttf'
        'times.ttf'                     'timesbd.ttf'   'timesi.ttf'                     'timesbi.ttf'
        'trebuc.ttf'                    'trebucbd.ttf'  'trebucit.ttf'                   'trebucbi.ttf'
        'verdana.ttf'                   'verdanab.ttf'  'verdanai.ttf'                   'verdanaz.ttf'
        'webdings.ttf'
        'wingding.ttf'
        'sylfaen.ttf' # International North America
        'symbol.ttf'
        'calibri.ttf'   'calibril.ttf'  'calibrib.ttf'  'calibrii.ttf'  'calibrili.ttf'  'calibriz.ttf'
        'cambria.ttc'                   'cambriab.ttf'  'cambriai.ttf'                   'cambriaz.ttf'
        'Candara.ttf'                   'Candarab.ttf'  'Candarai.ttf'                   'Candaraz.ttf'
        'consola.ttf'                   'consolab.ttf'  'consolai.ttf'                   'consolaz.ttf'
        'constan.ttf'                   'constanb.ttf'  'constani.ttf'                   'constanz.ttf'
        'corbel.ttf'                    'corbelb.ttf'   'corbeli.ttf'                    'corbelz.ttf'
        'lucon.ttf'
        'ariblk.ttf'
        'l_10646.ttf'
        'micross.ttf'
        'pala.ttf'                      'palab.ttf'     'palai.ttf'                      'palabi.ttf' 
        'tahoma.ttf'                    'tahomabd.ttf'
        'framd.ttf'                                     'framdit.ttf'
        'segoepr.ttf'                   'segoeprb.ttf'
        'segoesc.ttf'                   'segoescb.ttf'
        'segoeui.ttf'                   'segoeuib.ttf'  'segoeuii.ttf'  'segoeuil.ttf'   'segoeuiz.ttf'
        'seguisb.ttf'
        'seguisym.ttf'
#       'plantc.ttf' # International North America, does not conflict with ttf-aboriginal-serif or ttf-aboriginal-sans
# Marlett is only for drawing windows in Windows
# Arial Black from Windows 7 doesn't work in X.
)

_fonts=("${_fonts[@],,}")
_fnts_latin=("${_fonts[@]}" "${_fnts_latinsf[@]}")
unset _fnts_latinsf

# Some fonts we don't want.
# '511db37f04906eb2e77a91949edb04a61ce9838e9523011621dff4971a8d5867' #     marlett.ttf   en-US Version 5.00 Marlett

# Fonts pulled from Sourceforge
# 'dad7c04acb26e23dfe4780e79375ca193ddaf68409317e81577a30674668830e' #     AriBlk.TTF    en-US Version 2.35 Arial Black
# '48d9bc613917709d3b0e0f4a6d4fe33a5c544c5035dffe9e90bc11e50e822071' #     AndaleMo.TTF  en-US Version 2.00 Andale Mono

# The newest fonts found in a fully updated Windows 7.1 including Calibri Light & Light Italic which only comes from Windows Update.
# These are the optimal fonts.
# _fonts and _fnt256sums must be in the same order. _fnt256sumsx can be in any order.
_fnt256sums=(
  '1d071ea275a34d2b0308a7bcb8284a5ea3f916e676ba148a4dad75c918d94860' #   1 arial.ttf     en-US Version 5.22 Arial
  '421cdf9718843cbb6cb45b4854f6e0b291674424508efd9616611ae48cfe27a2' #   2 arialbd.ttf   en-US Version 5.22 Arial Bold
  '0e0fdb339a08b6e55862e84006d3524e1a116c07e1e51938a59ec67813553002' #   3 ariali.ttf    en-US Version 5.22 Arial Italic
  'a7c8a1ebc598f1984ec1214afc88fcbbf55ffeed18da33eb4f8b290578acdc2e' #   4 arialbi.ttf   en-US Version 5.22 Arial Bold Italic
  'da6bd53ea1f8259e41b198d75e187676c6355086ea8cb3cb0e1690d5237f82a4' #   5 comic.ttf     en-US Version 5.00 Comic Sans MS
  '8f5d4ac83aeee7dc1361585883ef59304edcfc57f4996be51e74aa3a07c5aa30' #   6 comicbd.ttf   en-US Version 5.00 Comic Sans MS Bold
  'b5343cdbefd73fd9cddd0e6d0779d76336e3dd61683e50a5ed031a104de20a53' #   7 cour.ttf      en-US Version 5.13 Courier New
  'acf1f44a209518a76df17fb35fd6c0494d613d70aef4ccab52e8f7daffca1c44' #   8 courbd.ttf    en-US Version 5.13 Courier New Bold
  'b02c8a85e12079cd4750385b3c87102039838ef3546ea34bb0175106b8d77289' #   9 couri.ttf     en-US Version 5.13 Courier New Italic
  'ee94513c6fd0482a8dca4e147689a175ae055e95e41ec87392cde84424828b2c' #  10 courbi.ttf    en-US Version 5.13 Courier New Bold Italic
  '29eaa6d65d0f1508d2d550d5ddf4e7e3a4e23cf13b376ff93140a8a6115b2f82' #  11 gabriola.ttf  en-US Version 5.92 Gabriola
  '46a57e3971f92d2359759f1cf0cc6706def7010a145786cf15c199e44ef9b061' #  12 georgia.ttf   en-US Version 5.00 Georgia
  '0537ac91f425795dda88d1a8ea66ae59f7357e5eb0c37309621003770c6ae160' #  13 georgiab.ttf  en-US Version 5.00 Georgia Bold
  'd691381f2476ed5ee1e80475a430b4864bf31fd46132b270eec1ce2672b4f8a2' #  14 georgiai.ttf  en-US Version 5.00 Georgia Italic
  '15f287c3345c2e64c2a2da053789dc0eef09ae0fc82a193ca64164b41d3565fe' #  15 georgiaz.ttf  en-US Version 5.00 Georgia Bold Italic
  'd9d7f0b973c131b0b7923a726f6f1de964b1073ec982106a027c3db53cf02633' #  16 impact.ttf    en-US Version 5.00 Impact
  '850d14d1ffa949a4cb2b94b4d105045a6bb6e0c06c94887b53cb193b3a28aed3' #  17 times.ttf     en-US Version 5.22 Times New Roman
  '781ea55ae0f2c10531ef8c9475fbbdeb64d502050cdca9adc2bf63e587ddee3e' #  18 timesbd.ttf   en-US Version 5.22 Times New Roman Bold
  'd3b21031a560715c4d397e56c5174ffbaf1c94e643d09ea37bc6264424bf3f84' #  19 timesi.ttf    en-US Version 5.22 Times New Roman Italic
  '48ae0efba1251a215f6ef5b5f451e2fbab5b07d523eb330dca53fdef5de1b8e8' #  20 timesbi.ttf   en-US Version 5.22 Times New Roman Bold Italic
  'b69a5b33e997c3bc55f35dde8267cb93fe5fbdc3ecbc23b1d987602a9fd2b1f2' #  21 trebuc.ttf    en-US Version 5.00 Trebuchet MS
  '7fea7f91f1140721bd7837a36ed2b1c856215f3ac08e6d2eb29c1afe235d0900' #  22 trebucbd.ttf  en-US Version 5.00 Trebuchet MS Bold
  '3f1d76cbf72de8cf7afbb6c4f3fcce5e5e89b92c8647310908aa42c44bd29b5c' #  23 trebucit.ttf  en-US Version 5.00 Trebuchet MS Italic
  'd374f4cc7819ad7a57204543b5ab01aa1580725bf2571eb66a25155216d90f3b' #  24 trebucbi.ttf  en-US Version 5.00 Trebuchet MS Bold Italic
  '7568b5a1a38aa5c2e5c486c3ac2e9a7ecd229e81dda726a2266bc935fb5af2fa' #  25 verdana.ttf   en-US Version 5.05 Verdana
  'd96a5071ed19b6bb2d467ccc9e3645ec10d4a2c14123dd64852719a0f39a8a2f' #  26 verdanab.ttf  en-US Version 5.03 Verdana Bold
  'a3c30d4f91e11d61aef3bd07e58eb50f1a8db2c37c257984794eead020747595' #  27 verdanai.ttf  en-US Version 5.03 Verdana Italic
  'bf2eb7af0acdedaf1984fe2e68c1eb5dcf69798c4161100272d086701e6b10cf' #  28 verdanaz.ttf  en-US Version 5.03 Verdana Bold Italic
  '1161ce511c44eb5464a4f8144aaf3eb965a50ed66957ad7d38e497ab9d958e5a' #  29 webdings.ttf  en-US Version 5.00 Webdings
  'd7c38355bd52f52e043ed904f3463d476925300d1bdca9e842b28077ca3549b8' #  30 wingding.ttf  en-US Version 5.00 Wingdings
  '18bba295099328afa56726198a0b69d3ed74548ac5a6ba6a3ce8abd375b4b0c6' #  31 sylfaen.ttf   en-US Version 5.02 Sylfaen
  'bffdc2fd675d9af414824ae84d8456504542480afb34fbc6bfd6903656c4f854' #  32 symbol.ttf    en-US Version 5.00 Symbol
  '0d3628edf3d2f2b6e583eec2e8171800c9c5773ec259a7774c923980361cb738' #  33 calibri.ttf   en-US Version 5.74 Calibri
  '853709c6521f9b211343a3e2b92c62a4a01074ded478b67fb88ad9d27c9f3e19' #  34 calibril.ttf  en-US Version 2.10 Calibri Light
  '9d7e17a498ac1917bae5cd03f8b47f905fb00c777420e2cc336f77dd5195aa06' #  35 calibrib.ttf  en-US Version 5.74 Calibri Bold
  'c28b1a2f7f65685882858a6dad3d31519bd64acaa4665c289190c3382db5f835' #  36 calibrii.ttf  en-US Version 5.74 Calibri Italic
  '93798d1047507741959132e544bfc4a071ef060a59b71c76c1a7b684944acdab' #  37 calibrili.ttf en-US Version 2.10 Calibri Light Italic
  '8071d1c1731a134a015994f9eb5f7249037a059c1d1e9b97dc818d933bcc82c5' #  38 calibriz.ttf  en-US Version 5.74 Calibri Bold Italic
  'ff5524832f7b6899f5a10df0f37bf2ff31d7de8d1671891ef7c2d1c2689e37c8' #  39 cambria.ttc   en-US Version 5.97 Cambria; Cambria Math
  'f244387440d55d70fbe18e3f5d2b3c265adbffcf184a9ded44618a900ccfc77b' #  40 cambriab.ttf  en-US Version 5.97 Cambria Bold
  '44fc1461cce2d02c8f54495135abee357c78ae118584da5471d815294d01220c' #  41 cambriai.ttf  en-US Version 5.97 Cambria Italic
  'f5583a61bea5801dbfbde0b700c37c180250d2c073c8ff1df4983253f142ca44' #  42 cambriaz.ttf  en-US Version 5.97 Cambria Bold Italic
  'f4cc0c11780a2d94cd6b74ed54fa657f26677013028c956ecb40da81c6b59b9e' #  43 candara.ttf   en-US Version 5.61 Candara
  'f959e0709a770094814199e49b0441b13e2bb075475b7ed2125ead7841ff2215' #  44 candarab.ttf  en-US Version 5.61 Candara Bold
  'da786a0df49cd2f45a9a8dc67120ec534e4624bf168829947bb08c4f937c21ad' #  45 candarai.ttf  en-US Version 5.61 Candara Italic
  'c2017a26bbd51775376baa93ba63095ba90a955c0eb93bbe44b9e73e0958fd73' #  46 candaraz.ttf  en-US Version 5.61 Candara Bold Italic
  '2036a839a4c99ac494ae103a69555bbce38eb815ad3bce422c308cc33dcb5b30' #  47 consola.ttf   en-US Version 5.24 Consolas
  '5471a23f674e09edc271c0829ff6d5e8135bc55e2a544cd6d8d10fd41215154b' #  48 consolab.ttf  en-US Version 5.24 Consolas Bold
  'beacce7a8f56aab6217f1c26b670a51b879ca56392c3d55a5a6bf13654ea2e62' #  49 consolai.ttf  en-US Version 5.24 Consolas Italic
  '63ad9676906ad8347a3183b20113b77585f1a6f284d4f703e65682e7c69c20df' #  50 consolaz.ttf  en-US Version 5.24 Consolas Bold Italic
  '28401ef53647e4e68f2c2bda54856fe90d9afb1cf4072bf4ea9cf6b380c09d4c' #  51 constan.ttf   en-US Version 5.90 Constantia
  '11a7a1c6b1b4028cd7e55f60a9773ecc7d39b66b8f82f5b7c6fbf8a4fdfcf94e' #  52 constanb.ttf  en-US Version 5.90 Constantia Bold
  'be0306e2040aeeed8bf228524071f4b941d28cbdd3ff413a9db07d1da9213ec9' #  53 constani.ttf  en-US Version 5.90 Constantia Italic
  '6bf361ae27d2f67e05d9ad0fa6e0bc4e16c2ada6926d6c24b557e2547f4f242e' #  54 constanz.ttf  en-US Version 5.90 Constantia Bold Italic
  '83f5b36107f7ea50fd5c52b1c3e8d64de3edc5d0f2c2e2e9f634fbbcfd7abd74' #  55 corbel.ttf    en-US Version 5.61 Corbel
  '2d3fb4d471e9669a5ab2bc8aa9b359639e17af321510f3b878bae03bc259b056' #  56 corbelb.ttf   en-US Version 5.61 Corbel Bold
  '7e9cd651666dce6dd3ad37b8199c7798b226b8995d35e6b672b53ce0bbec59cb' #  57 corbeli.ttf   en-US Version 5.61 Corbel Italic
  '9c68522951940ad49354f4fce56b528414a7e83c44474ceea0582a5434693066' #  58 corbelz.ttf   en-US Version 5.61 Corbel Bold Italic
  'f4df4d6d1a69d24e08da2ad2f45203b4c7147ddaa5187ccd73087903ca36d177' #  59 lucon.ttf     en-US Version 5.00 Lucida Console
  '6dab274b36928bc76b5002eac90a52f2450d07b9327be95acf2bea1e56e4e1da' #  60 ariblk.ttf    en-US Version 5.06 Arial Black
  'b9ed2bf08381f8b763673504d82b27c6e029156c73cede54e551e59fe8e940da' #  61 l_10646.ttf   en-US Version 5.00 Lucida Sans Unicode
  '0b5a39493f49e11aca659af70b622b7bb88e348d308c033f2d0fc4794c3289be' #  62 micross.ttf   en-US Version 5.21 Microsoft Sans Serif
  'bec3fd1fbcbfabe94b59bbebb8618b7d64e1871815be27e2666f2717def466af' #  63 pala.ttf      en-US Version 5.00 Palatino Linotype
  'b760ebf6227ce40ee184d5163b59ee3d72a3572e5147b74393e98b2c4f2fcde0' #  64 palab.ttf     en-US Version 5.00 Palatino Linotype Bold
  'aeb3b444f8bc2fa61deb8879b7a86913015e21db808dc79732856fdcbda13fbf' #  65 palai.ttf     en-US Version 5.00 Palatino Linotype Italic
  '71d04fbf6ed563c3c69266e9a0ccedbe089d3738d43afec16eb681c7e519c9ff' #  66 palabi.ttf    en-US Version 5.00 Palatino Linotype Bold Italic
  '8ff8a56987a92d2cddca6a0f18cc9d35213607d91e561e29cce95c54a9e8cf6c' #  67 tahoma.ttf    en-US Version 5.21 Tahoma
  '383d2832c28fe1dfa981f08bbf1510d8f772e1e7622d7aaca9e4a446a5a9f134' #  68 tahomabd.ttf  en-US Version 5.21 Tahoma Bold
  '2d648599fc7acacb024ab08a0720a62e2f2cc070ff19582eb9b5c824e1515ecb' #  69 framd.ttf     en-US Version 5.01 Franklin Gothic Medium
  '68f1597a57a071f291449e66c888c1b86ad617d8eb18da52c7c2dbdf781ddc2f' #  70 framdit.ttf   en-US Version 5.00 Franklin Gothic Medium Italic
  'ecf3f898c2970377f7853ff7d7dd973e069bb8fd6264a36c01fff56ee28af701' #  71 segoepr.ttf   en-US Version 5.02 Segoe Print
  'f1b950b4ffbcd71c581ecdaea184b789e1dbbc43da6391c790c096812b20f769' #  72 segoeprb.ttf  en-US Version 5.02 Segoe Print Bold
  '8f6328619340426b2c985f6fd305bb64d164b20b20a5b493a21533761bd5d631' #  73 segoesc.ttf   en-US Version 5.00 Segoe Script
  'abf76b314ca2432ab718a74a4028bb7707073cb0d50643547c59f41a540b66a5' #  74 segoescb.ttf  en-US Version 5.00 Segoe Script Bold
  '1e1975d9d7cff9ac9ddb197126be3d8202cc8e6cfbbeb1c793ab5240f0e95ea1' #  75 segoeui.ttf   en-US Version 5.12 Segoe UI
  'a1aa13688858bce5ea32d45c1438e74c77b99ceff5645c2a546bc2ce5a9f8456' #  76 segoeuib.ttf  en-US Version 5.12 Segoe UI Bold
  '8d97797f633cabf41fa5e854a7683387d6f71a5993d34edfdc363937eb05b25c' #  77 segoeuii.ttf  en-US Version 5.12 Segoe UI Italic
  '5cea1f3385b7d2e8930533d6b1c721d0916806035995fc681f02b548fdad38ea' #  78 segoeuil.ttf  en-US Version 5.00 Segoe UI Light
  '210d410c953811902c5e3b92cbb1f16b243006b80cfb185c2c0dc522486a139f' #  79 segoeuiz.ttf  en-US Version 5.12 Segoe UI Bold Italic
  '7b61fca63da26e45444402f42ce068b29244d9d3d351e86796df7ca0a94df63c' #  80 seguisb.ttf   en-US Version 5.00 Segoe UI Semibold
  'e2c74ae156f0886f580bc77ceeff46988c32924ec1436710de23a6767819da99' #  81 seguisym.ttf  en-US Version 5.01 Segoe UI Symbol
)

# Any mismatch in the above table will be searched against all of the following.
_fnt256sumsx=(
# Fonts replaced by optional update KB3102429 2016-01-19: Update that supports Azerbaijani Manat and Georgian Lari currency symbols in Windows
# We leave these fonts in as non optimal because people are turning optional updates off due to Microsoft polluting optional updates with GWX and telemetry.
  '97dcf78fe226789fd413eabce2bda89a2f8a9182da216ea43b1fe0bacbbe9f0a' #   1 arial.ttf     en-US Version 5.20 Arial
  '8ca5dcaf6589267dc6f842e614ad0fe2e42374b23efe87d89b991bd860f671e2' #   2 arialbd.ttf   en-US Version 5.20 Arial Bold
  '9d5031d3e374ac7db5a93c4e38db62206c17f2c97bd98b657b316d4442ebbe6c' #   3 ariali.ttf    en-US Version 5.20 Arial Italic
  'cce71e42d5a7dc20f48b3ce29f17e1d8a3363064b676086984345c9664f612c7' #   4 arialbi.ttf   en-US Version 5.20 Arial Bold Italic
  'c5e7cee4b77caf5ed5f1ffd7510fdb66d32109c6861b4a481b93b9166df03534' #   7 cour.ttf      en-US Version 5.11 Courier New
  '89cff1ff9e59a661ba947500e9c242506e2dbf36c0417783dea8b762e13da704' #   8 courbd.ttf    en-US Version 5.11 Courier New Bold
  'd9c60f6e55128b775b25f8e26b20b486c1a4de56f1d55348d5ab6200d9471b06' #   9 couri.ttf     en-US Version 5.11 Courier New Italic
  '5d51cebc9151f377f52b39cd34da80f9179236b1ba4f261ae4023c077114e27b' #  10 courbi.ttf    en-US Version 5.11 Courier New Bold Italic
  '2f19540795c149eb4b1789167d5e796ae6114f663573958bb95045f7904cd66e' #  17 times.ttf     en-US Version 5.20 Times New Roman
  '0ae11b9575d35e4f0efbc575a41f1d80cf5a34e1bc826a41b08e2d0a45332bb0' #  18 timesbd.ttf   en-US Version 5.20 Times New Roman Bold
  'e5aeafebac177223192e49697b07ed0972cf30c92b1d2df420d0b8c27a5bc81c' #  19 timesi.ttf    en-US Version 5.20 Times New Roman Italic
  'ee2c22ded32c648f160b069e4f80a3e620ff58b14491f9e267bb67284b6df890' #  20 timesbi.ttf   en-US Version 5.20 Times New Roman Bold Italic
  '512d4a4dbf465349132dc0530b5efdbb4baaae10e940a081f5f2e783a7b3675d' #  31 sylfaen.ttf   en-US Version 5.01 Sylfaen
  '22fd74688605ec98e38dc39b32299655298cc54faba8e88461e783220c1f9261' #  33 calibri.ttf   en-US Version 5.73 Calibri
  'b518f026be8d5a1c85bd32707a5ea946cfd3ace4a0a3fa39a2cb485e6803f334' #  35 calibrib.ttf  en-US Version 5.73 Calibri Bold
  'fd65027a491504dd3e10c43d40e07a3c7cc142d6606ceea882694738989664a7' #  36 calibrii.ttf  en-US Version 5.73 Calibri Italic
  'ed66ec4546db15af63a0a85c2253b616de422eae0ac3cd72232116a5e4e7ee41' #  38 calibriz.ttf  en-US Version 5.73 Calibri Bold Italic
  'd675f6efa6f39c92585a0499901593c2df7a1b61cdb6bf4185e3833f83b0106e' #  39 cambria.ttc   en-US Version 5.96 Cambria; Cambria Math
  '2613006fb72ac39d2629cc10dc4046191981bf3c0796addd4a728003271e018f' #  40 cambriab.ttf  en-US Version 5.96 Cambria Bold
  '71e671f7048248bba725729cd5e5f3b1378950bbfc9e592ad15af71df0780607' #  41 cambriai.ttf  en-US Version 5.96 Cambria Italic
  '2582aed03c3370a8fad2e9f93b4b4d30a0b1bafa61c51bf23b8d5f65a1ad53de' #  42 cambriaz.ttf  en-US Version 5.96 Cambria Bold Italic
  '45c14a49e0ba2edc00b72afad9a930cad5c1b9a93323b239a8c308efc5a65e8e' #  47 consola.ttf   en-US Version 5.22 Consolas
  '5c27a540c51a0e60b2caa4e9f6c9164fde89a9fdc560747bfa1658f6e556cf61' #  48 consolab.ttf  en-US Version 5.22 Consolas Bold
  '18db132c539323badaf0e1c9ceffa497e1996946a8faac26cc5fbe6fc8233314' #  49 consolai.ttf  en-US Version 5.22 Consolas Italic
  'fc9e9f0b6ae6d068b01e1511e475b508e15799529f53679f1e927f5418040c3f' #  50 consolaz.ttf  en-US Version 5.22 Consolas Bold Italic
  '3027a64f6b544fc80d0172f7d1db7cf051a656a60cc94c3ca88bd1683f4fd19a' #  62 micross.ttf   en-US Version 5.20 Microsoft Sans Serif
  'c3f0abde735307640d9900244ddbc7b5f2a706361a86d2bfc5004c9a8cd3b7f6' #  67 tahoma.ttf    en-US Version 5.20 Tahoma
  '7eee934f4ca580ac07d78aeed7257a65314b3b93a9c9f6edf6f33d92ad5ddd30' #  68 tahomabd.ttf  en-US Version 5.20 Tahoma Bold
  '4217e96cf586f27ca5dc7e5a2e45826340f6af0f91bdbd2ffc4a694724591736' #  75 segoeui.ttf   en-US Version 5.11 Segoe UI
  '65ceeab23f1bec915558cecb189accdd637d5036e9f7afb635ffef0b1dfa08b3' #  76 segoeuib.ttf  en-US Version 5.11 Segoe UI Bold
  '42ba0659e5b9349fcf0ff299a3a69e5d3ff9b161a18ce41817dd217aeb5bba1e' #  77 segoeuii.ttf  en-US Version 5.11 Segoe UI Italic
  '6c9700922e14f899cf732eded07afa4e5b8e640c762408f96eba76efb88d4989' #  79 segoeuiz.ttf  en-US Version 5.11 Segoe UI Bold Italic

# Older fonts from the Windows 7.1 DVD.
  '001bb08e859d4db7814902119412a14713b0c45e89cbc429bb3f5e6af14815e0' #   1 arial.ttf     en-US Version 5.06 Arial
  'b27f2fb5da01910f925955c81a50c944e2147346a4ac41dfefdc5895d40a091f' #   2 arialbd.ttf   en-US Version 5.06 Arial Bold
  'f40e4fa3c247433f317f5103175ad4164032dfb09b72d1c5374d25fabb71e249' #   3 ariali.ttf    en-US Version 5.06 Arial Italic
  '18bc55c21eef55f24c8acc06a419860adac92ec832760c7ae156f0cc90e52005' #   4 arialbi.ttf   en-US Version 5.06 Arial Bold Italic
  'd9fb32eb1646d6fc977c63fd780a46c60b6d1f607bf55eb7baa185aa2637711d' #  17 times.ttf     en-US Version 5.07 Times New Roman
  '268218b3a0009bb3c3e3677c4d107de38a21f2a86cda6b4f6f3ec8e00171f43f' #  18 timesbd.ttf   en-US Version 5.07 Times New Roman Bold
  'd1baa654326673a6e49c22f3dc2638253a30565a2ae78a1f2c60a1e482230fc8' #  19 timesi.ttf    en-US Version 5.07 Times New Roman Italic
  '21732df1135f9ccfbcac6818723f94c5ac3baced44b532a483e889906c4ad419' #  20 timesbi.ttf   en-US Version 5.07 Times New Roman Bold Italic
  '1a21de1619b2d5facbdf83f1bd49b5b18aefdec2c91fc097f5e68f50a6a1a88c' #  25 verdana.ttf   en-US Version 5.03 Verdana
  '436cb479a8f9eff517016868323bdfbca1a053bba4cc55c8753859b64d041c5c' #  33 calibri.ttf   en-US Version 5.62 Calibri
  'ce7dd6ba37e7b8dff865b6ce334ef773b9ad86d8a9d495c309ced108856bed54' #  35 calibrib.ttf  en-US Version 5.62 Calibri Bold
  'd9f13268dca6e828cb9ed5827dc99d188cf0d7c55349f92802fd6532926bdfbf' #  36 calibrii.ttf  en-US Version 5.62 Calibri Italic
  'b5e3f6b9fcdf4b3a89ed182d4ade810d45cfef17f57b4bbc5cd6be1e83de40ab' #  38 calibriz.ttf  en-US Version 5.62 Calibri Bold Italic
  '32a9b170586d0a6f7954518427625a8c317ac7ef0cca6a149dd4403ec0abe3d8' #  62 micross.ttf   en-US Version 5.02 Microsoft Sans Serif
  'aba01ff3a202005ab6964ccb2ab2684912cfe9b62d9676752b390aa4f4510b75' #  67 tahoma.ttf    en-US Version 5.06 Tahoma
  '1acbc38a9d5bf05ae519f6405f0d3634938b992250b605d15976f15f774d5eb3' #  68 tahomabd.ttf  en-US Version 5.06 Tahoma Bold
  '38be0d2b58bbd3249f5af9bbe1fa0b38fee587441ab0c1850d1dda1c0766a8c1' #  75 segoeui.ttf   en-US Version 5.01 Segoe UI
  '9878074a1a534929577a388ccef39c852328c692fdd9ca3fef45eb000fe5f591' #  76 segoeuib.ttf  en-US Version 5.01 Segoe UI Bold
  '0d6d0871bdca199fd3e4a8044f710b20357f09d6d14c15b50a12cf0d9aa41fc7' #  77 segoeuii.ttf  en-US Version 5.01 Segoe UI Italic
  'a2658365f60e92a9ee5d3589bd8ed2f5fad222f091a3937c14cab4fb26701d29' #  79 segoeuiz.ttf  en-US Version 5.01 Segoe UI Bold Italic
  '53020949de0e6f6d7a69e8d67bd766cc9c868640552f2c069d646896966e8d4b' #  81 seguisym.ttf  en-US Version 5.00 Segoe UI Symbol

# Older fonts from Windows 7.0 DVD. Someone forgot to change the version on Arial.
  'a7c40b6347305a7a7946cbe95c423663e67794efdc0cc497a13d35364f4bc70b' #   1 arial.ttf     en-US Version 5.06 Arial
  '893af24f334b23a68f0233ccfa5b19a1c87b9fc6050ba01c34e91fc8e8f62a77' #   2 arialbd.ttf   en-US Version 5.06 Arial Bold
  '3b99e1fcef64b5b9069bde6dbba8e507d6bd99a50d1eecb3a6ac12d092539423' #   3 ariali.ttf    en-US Version 5.06 Arial Italic
  '56c2456da5de4c037e83baa6bce16b72bee8cd8ee6b58d118967896336c049ad' #   4 arialbi.ttf   en-US Version 5.06 Arial Bold Italic
  'e46bf2ea19f9f416123f32c79eefdedc90f49c92d3606833afa6176a0bea903d' #  11 gabriola.ttf  en-US Version 5.90 Gabriola
  '84f9d249dbd5597b67ce487a730ae25d844d6f4968dd088f57cb2769082dd9cd' #  17 times.ttf     en-US Version 5.05 Times New Roman
  '8ec6b7088e954e52443f8c131133a594580fe06c083f82da7a87c4c6216a547e' #  18 timesbd.ttf   en-US Version 5.05 Times New Roman Bold
  '98187f2a8e9b0e232dfb59efb7d42335237abb122bac090862ce8a19aa82494e' #  19 timesi.ttf    en-US Version 5.05 Times New Roman Italic
  'fce4048011d32e66c4265d0acad4fea69077c6463bc03930546deada5fddec45' #  20 timesbi.ttf   en-US Version 5.05 Times New Roman Bold Italic
  'aef25c78eaf9cb243f62508ed5a373bb98918fe880a63b3e17ea0b123270175c' #  25 verdana.ttf   en-US Version 5.02 Verdana
  'bba4571a7cc83c0ccc8b96035e2b165526946b1d45baf73d1b402c65ed48de62' #  26 verdanab.ttf  en-US Version 5.02 Verdana Bold
  'ff503224a9c81914bfedbafe4d79246bd133ebcfad5b0ffc0cd9ebe18e96f9fb' #  27 verdanai.ttf  en-US Version 5.02 Verdana Italic
  '51644512b8e60d007c5c9fd17b9114364722124433bd3c6bb6166916aa9f863b' #  28 verdanaz.ttf  en-US Version 5.02 Verdana Bold Italic
  'ba3bef63a5f397f893b27d3e5be020b966bf96b5ed9064241a24805c288ea79e' #  39 cambria.ttc   en-US Version 5.93 Cambria; Cambria Math
  '85377e39b6987b338795ecd08b18ca5077867585cd18c431438854374441e952' #  40 cambriab.ttf  en-US Version 5.90 Cambria Bold
  '6ca040031a8387ad3a7fb815f896fdbd21fa181ad6fe19e5a193a72bf6a7d396' #  41 cambriai.ttf  en-US Version 5.90 Cambria Italic
  '9cbc78f6fe5ffec33ca9240e64f48ae2c5b158cfacb0a1f6a40521e8d06045b6' #  42 cambriaz.ttf  en-US Version 5.90 Cambria Bold Italic

# Calibri Light from the Windows 8.1 DVD since these fonts are hard to get without a running Windows
  'cd8f6ebc4ff8655cab52c8436260a3adb8324424efded68e95baa9a2a54d45d6' #  73 calibril.ttf  en-US Version 2.11 Calibri Light
  '75786eca7de57e4c968a3b6be69bfcd6d7450e3217a747892bd8a3859ae11409' #  74 calibrili.ttf en-US Version 2.11 Calibri Light Italic
# Calibri Light from the Windows 8.0 DVD since these fonts are hard to get without a running Windows
  '86d7239b49cfc4f16b17d0b0eb5240fe1ca1400e5feb86699fe282a322602c67' #  73 calibril.ttf  en-US Version 2.00 Calibri Light
  '7e11508b1fd82bc2c77bb2ce234cfa724d54d036910b255eaab722e7160a3105' #  74 calibrili.ttf en-US Version 2.00 Calibri Light Italic
# These fonts are numbered from the ttf-ms-win8 package
)

_ttf_office_2007_fonts=(
# Office 2007 fonts might overwrite Windows fonts on install despite the older version numbers.
# If Office 2007 doesn't, Office 2010 and Office 2013 might which would need to be added.
  '8316b1b5c1e47aad6220e10c83537cd32704e99e7885aabf56a1d897b3d3f1ee' # 187 calibri.ttf   Version 1.02 Calibri
  '5fc2218b5ef0ca1edabe1e694eb6a710f505c8c865a27e377c79d987a9a336e2' # 188 calibrib.ttf  Version 1.02 Calibri Bold
  'fde29212db82cd4bf9e118863561c0295dc55c84cb617041798ce9e7363997b9' # 189 calibrii.ttf  Version 1.02 Calibri Italic
  '7fb57eb4c64f249356bb62e2b84ce4ebeb46b89b2d119a2d0888362a278c07ba' # 190 calibriz.ttf  Version 1.02 Calibri Bold Italic
  '44b855cfd25745e1bbf548f50b8ae06ef3558cc6b215fdb209de2e0dd22e0226' # 191 cambria.ttc   Version 1.02 Cambria; Cambria Math
  '0aa76048bde8acfafafa3f59ae94a7bfb6613a74d367b3fcb841cd180a7d7a16' # 192 cambriab.ttf  Version 1.02 Cambria Bold
  'fc9a9a90cbd828a22733e1f61f089663b95c7304a7b9beef33e3ee454608b73d' # 193 cambriai.ttf  Version 1.01 Cambria Italic
  '4fbab6e3f15a3fa7341a7630865f40aade9068270d3c75ef6633f466eb1a8f60' # 194 cambriaz.ttf  Version 1.01 Cambria Bold Italic
  'e9f66a22402b92c5cd9dfc9c5b4d93f1fbe4fa865841dfe031d33288ab3bb4a8' # 195 candara.ttf   Version 1.01 Candara
  'dccbfb201fce3996776dfb28bc64c8fdb9d8d2aaa077c6964ac3326ef01fb66d' # 196 candarab.ttf  Version 1.01 Candara Bold
  '507cf89bc137dd086b8dbdfeebcdc139d724a206abd2a9cc32c75e9ce6ff2cf3' # 197 candarai.ttf  Version 1.01 Candara Italic
  '48c036482be2cd50beb203a424e221a1a82a7f9cd60b00430233fc7ca131cb14' # 198 candaraz.ttf  Version 1.01 Candara Bold Italic
  '5f8d58e719a7d724be036145f506acf38b0942e253a7c331887c7056b93deac8' # 199 consola.ttf   Version 1.00 Consolas
  '5295a046a10ef96b7050891920212295ee8e86e4dd8177ceb6cf054ec1dba5f1' # 200 consolab.ttf  Version 1.00 Consolas Bold
  '9de4ef7b2cb04285224a23c1b7725a80a3852d321a6006b1a22b559cd5450ae9' # 201 consolai.ttf  Version 1.00 Consolas Italic
  '23b32c48f969e88e430b65a11311393180e2ab95be9309a5b286f473a7899f39' # 202 consolaz.ttf  Version 1.00 Consolas Bold Italic
  '735808619bb3f40ea10746aabb2bdea275c7f2c8a00cfeb5d765fcca1c834adb' # 203 constan.ttf   Version 1.01 Constantia
  '66b7706fa9e94a9c2907eefe84a1560b081f5aeea624b73a43043d4a2e817ea9' # 204 constanb.ttf  Version 1.01 Constantia Bold
  '8aa9def1b2b1abf0ef3a3095daf11fafd9557d9221b2ff57e52465b24a83812d' # 205 constani.ttf  Version 1.01 Constantia Italic
  '37a083be091532f379dfdcea441ca3e3a3f4aa30e3d8dcf958fe18134219d5b0' # 206 constanz.ttf  Version 1.01 Constantia Bold Italic
  'b899c4cdc0c7193c37d8d6720afe17b6e2f618a47a3c196e5598f245a1a6942e' # 207 corbel.ttf    Version 1.01 Corbel
  'ee6d7fe208a7285cf93d6a94c4a172500fa5b69f98cc7e94898b120db74d2e8a' # 208 corbelb.ttf   Version 1.01 Corbel Bold
  'deeaff659011f0357b2714fe184bafb934708c3f11c70c4a7c607f8809611845' # 209 corbeli.ttf   Version 1.01 Corbel Italic
  '6778c7532967aacd43db63a495003aa5a7d1f0fc04eacc2429961ff50d94c9c0' # 210 corbelz.ttf   Version 1.01 Corbel Bold Italic
  '9f006360948fbdcf8535e650f3ece264432b1c515b5d1f688dbecfb03cd83155' # 211 segoeui.ttf   Version 1.00 Segoe UI
  '9c6fbf48500d4956a5663607865d87a850a72aba790a00e4465a16d48fe8a048' # 212 segoeuib.ttf  Version 1.00 Segoe UI Bold
  '41b571072720f7bc72f8ab344c00e6f5fa38b7262fb290926061d064edd22a4b' # 213 segoeuii.ttf  Version 1.00 Segoe UI Italic
  '1712c07b9ec477bfccb927888644666bef333eef4cc260ae1cf60a19bd327e47' # 214 segoeuiz.ttf  Version 1.00 Segoe UI Bold Italic
# Office does not overwrite Windows fonts. If it did Window Update wouldn't be able to fix the fonts.
# They are only there for previous Windows that don't have the fonts.
# ttf-office-2007-fonts is the PKGBUILD that must deal with so many random versions.
)
unset _ttf_office_2007_fonts

# These are from ttf-win7-fonts-autodownload. I don't really want these in the list.
_ttf_win7_fonts_autodownload=(
  '1906a771ed879a5de75a3ff552fbad533827fe7b39e18319ce9d9ae134c346c7' #   1 arial.ttf     Version 2.95 Arial
  'f8f19c2bc7205605e2cdf28725b98c818d7079a4a33a654facffc74a67b4294c' #   2 arialbd.ttf   Version 2.76 Arial Bold
  'c8dec6540df60f41c5d571b66146d331b2583c952a89a0f224c396f0aeabb117' #   3 ariali.ttf    Version 2.90 Arial Italic
  '722c61a99c1af1413d762d0a3b185dd497fe55b873c8672a0c3c4bfe05d29d92' #   4 arialbi.ttf   Version 2.90 Arial Bold Italic
  'b82c53776058f291382ff7e008d4675839d2dc21eb295c66391f6fb0655d8fc0' #   5 comic.ttf     Version 2.10 Comic Sans MS
  '873361465d994994762d0b9845c99fc7baa2a600442ea8db713a7dd19f8b0172' #   6 comicbd.ttf   Version 2.10 Comic Sans MS Bold
  '97c6ad2e60d7e41f34d3aa9e41fcc569ce64002d980d54cabc02e368393c3733' #   7 cour.ttf      Version 2.90 Courier New
  '47ad9b2bdea49cab9736748e882c1e4d5bdf8a379f94ef11d8a37f0b6b06f6d5' #   8 courbd.ttf    Version 2.90 Courier New Bold
  '5187b6af27cb529733ba0f4b2b2ad3c4f6064984e29a73c7ce948c6c2e941743' #   9 couri.ttf     Version 2.90 Courier New Italic
  '76cb7f8d0d0d45d0e66095184df7d2c844e93ad86575d6e34e8cb20aa1efb5a6' #  10 courbi.ttf    Version 2.90 Courier New Bold Italic
  '946e988a0c5c1500eb2c39c61ee1ca673232ca7c341bc2a8c1000df8db75e9ac' #  12 georgia.ttf   Version 2.11 Georgia
  '9c479ad14c0d4203869a0daa83fa45fd73fb3332aa0e660b64aa2bb0e508e7d3' #  13 georgiab.ttf  Version 2.10 Georgia Bold
  '2b451a97dc0cadb23b8c4240e4dcb66bb095a9e401a0c3cfbe8788cbac5036b4' #  14 georgiai.ttf  Version 2.10 Georgia Italic
  '6f86d5e3fae545071c33bd51bb70caecd36205411472f5b8ca7d3601f2d0a35c' #  15 georgiaz.ttf  Version 2.10 Georgia Bold Italic
  '00f1fc230ac99f9b97ba1a7c214eb5b909a78660cb3826fca7d64c3af5a14848' #  16 impact.ttf    Version 2.35 Impact
  '51966b27ce9d5a3f58bc4890b98bdd08efd9683b9265251ddaf09b8965a849ea' #  17 times.ttf     Version 2.95 Times New Roman
  '1c24128bee049c13004fe01e907b9dae2be541d6491d3a993facdba8da2c02b5' #  18 timesbd.ttf   Version 2.90 Times New Roman Bold
  '6ba038af5a48d4619fe59dd601e91f401cf7434f5361391ab596bd3312cf7427' #  19 timesi.ttf    Version 2.90 Times New Roman Italic
  '7ce1d60e266fbdd0ea1610be63e920c8c430050e175d72066b1a263f11f93824' #  20 timesbi.ttf   MS core font:V1.00 Times New Roman Bold Italic
  '43811345f91898766198e59af68993e9cd29e64eddd72f77bdbd23631d783d99' #  21 trebuc.ttf    Version 1.10 Trebuchet MS
  '25f5d2bd7b873b95884a90a276c5ae4512f7461ef7e7557f877a18df80235759' #  22 trebucbd.ttf  Version 1.10 Trebuchet MS Bold
  'db56fdac7d3ba20b7aededcb6ee86c46687489d17b759e1708ea4e2d21e38410' #  23 trebucit.ttf  Version 1.22 Trebuchet MS Italic
  'd8badecbceb8ee98909aefefd22daf91989e06ad1a90af7365628804fc8fa4a9' #  24 trebucbi.ttf  Version 1.10 Trebuchet MS Bold Italic
  '886eedb1df75504d383d10cc40404e56f6361be50e50986d7568ba94ea43cac3' #  25 verdana.ttf   Version 2.41 Verdana
  '2b1ec02c0463ce5e312913da8825002165999b6f370c276cd378ef0f3e16db27' #  26 verdanab.ttf  Version 2.40 Verdana Bold
  '6e656fb07fea27377b53130fe3fd24c1958900c94f5020847a3aa4244b5f7710' #  27 verdanai.ttf  Version 2.40 Verdana Italic
  '9484013828b60be32207db265dcca961cc5ee96006da6b3ed8cabdd6407cf26a' #  28 verdanaz.ttf  Version 2.40 Verdana Bold Italic
  '10d099c88521b1b9e380b7690cbe47b54bb19396ca515358cfdc15ac249e2f5d' #  29 webdings.ttf  Version 1.03 Webdings
  '4e5a43ec8488b9b3bc8114628263c939a212e13be924570655ddbd6e3392a42e' #  30 wingding.ttf  Version 2.50 Wingdings
  'd126b16ee49d46b319a695eff57ac3bc2582c615aa89e2da5ef6a6e97437b7f4' #  31 symbol.ttf    Version 1.60 Symbol
  '6da25cc267312d08d86939f2bdd5e7c1f9c34150c7b09c1dcbad63396ecbaa29' #  32 calibri.ttf   Version 0.90 Calibri
  '97806b10d4e0a3193a50f7f6aa1e2f58c8d5dedff01758b073c6b0d571c41358' #  34 calibrib.ttf  Version 0.90 Calibri Bold
  'edced7a773df78a6765342c8fc2216aa6734fe3083d64cbc961470b72dfa4e81' #  35 calibrii.ttf  Version 0.90 Calibri Italic
  '20b1dec1abc12300183c3405c403e99f8f472cd3740aeb37c67dbf2f029a5509' #  37 calibriz.ttf  Version 0.90 Calibri Bold Italic
  'ae17a534fc524bc6af6a38cb3116ccdf9b79461cdf05c828d84f5ac40376bb13' #  42 candara.ttf   Version 0.90 Candara
  '9f7c49ad9a99ef17221475fd2b9e192282453444094bc0edbe6e5b8943a12d9c' #  43 candarab.ttf  Version 0.90 Candara Bold
  '9e25a036170d7a8706692832bf1e43473fd4a97ad20b9dc455ff50ce15d79cff' #  44 candarai.ttf  Version 0.90 Candara Italic
  'b59c3237890601478d03d3107c352261e16d975426a26a7fdea0426c50186b5a' #  45 candaraz.ttf  Version 0.90 Candara Bold Italic
  '735808619bb3f40ea10746aabb2bdea275c7f2c8a00cfeb5d765fcca1c834adb' #  50 constan.ttf   Version 1.01 Constantia
  '66b7706fa9e94a9c2907eefe84a1560b081f5aeea624b73a43043d4a2e817ea9' #  51 constanb.ttf  Version 1.01 Constantia Bold
  '8aa9def1b2b1abf0ef3a3095daf11fafd9557d9221b2ff57e52465b24a83812d' #  52 constani.ttf  Version 1.01 Constantia Italic
  '37a083be091532f379dfdcea441ca3e3a3f4aa30e3d8dcf958fe18134219d5b0' #  53 constanz.ttf  Version 1.01 Constantia Bold Italic
  '8f706a4ee7a65a65ad5ef2e26cd1339fda4f3e25c278607c9070ff3173f9dd6e' #  54 corbel.ttf    Version 0.90 Corbel
  'e45a73d65b6202fc66b30994b60aee7219e11c21c8ddf704cbadb88f5e1e7a11' #  55 corbelb.ttf   Version 0.90 Corbel Bold
  '7d83891f18a56d49862b09a12c7c989d7c564a16f5bd042ef2428809e82a7570' #  56 corbeli.ttf   Version 0.90 Corbel Italic
  'e016dd3917c3a054c4907e65a5ab94ddcd4197d80ce539358a5be3bb8296e7a8' #  57 corbelz.ttf   Version 0.90 Corbel Bold Italic
  'dad7c04acb26e23dfe4780e79375ca193ddaf68409317e81577a30674668830e' #  59 ariblk.ttf    Version 2.35 Arial Black
)
unset _ttf_win7_fonts_autodownload

_tt_deli=':'
# Generate international font arrays. This code is designed to make creating these big arrays fast and easy.

# Format: font.ttf:Language Name:pkgname
# Fill in Language Name by hand from any font list like Wikipedia.
# Fill in pkgname to assign each font to a package. I duplicated ttf-ms-win8.
# pkgname can be left out if its the lower case of Language Name.
# Entries that still need language info added by hand sort to top by font name.
# Entries with complete language info sort by pkgname and Language Name to the bottom so each package is shown together.
_tt_lang=(
  "andlso.ttf:Arabic"                      # en-US Andalus
  "arabtype.ttf:Arabic"                    # en-US Arabic Typesetting
  "majalla.ttf:Arabic"                     # en-US Sakkal Majalla
  "majallab.ttf:Arabic"                    # en-US Sakkal Majalla Bold
  "simpo.ttf:Arabic"                       # en-US Simplified Arabic
  "simpbdo.ttf:Arabic"                     # en-US Simplified Arabic Bold
  "simpfxo.ttf:Arabic"                     # en-US Simplified Arabic Fixed
  "trado.ttf:Arabic"                       # en-US Traditional Arabic
  "tradbdo.ttf:Arabic"                     # en-US Traditional Arabic Bold
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
  "iskpotab.ttf:Sinhala:indic"             # en-US IskoolaPota-Bold
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
  "msgothic.ttc:Japanese"                  # ja-JP MS Gothic; MS PGothic; MS UI Gothic
  "msmincho.ttc:Japanese"                  # ja-JP MS Mincho; MS PMincho
  "malgun.ttf:Korean (no Hanja):korean"    # ko-KR Malgun Gothic
  "malgunbd.ttf:Korean (no Hanja):korean"  # ko-KR Malgun Gothic Bold
  "batang.ttc:Korean"                      # ko-KR Batang; BatangChe; Gungsuh; GungsuhChe
  "gulim.ttc:Korean"                       # ko-KR Gulim; GulimChe(5.00); Dotum(5.00); DotumChe(5.00)
  "nyala.ttf:Ethiopic:other"               # en-US Nyala
  "ebrima.ttf:N'Ko, Tifinagh, Vai:other"   # en-US Ebrima
  "ebrimabd.ttf:N'Ko, Tifinagh, Vai:other" # en-US Ebrima Bold
  "plantc.ttf:Plantagenet Cherokee:other"  # en-US Plantagenet Cherokee
  "estre.ttf:Syriac:other"                 # en-US Estrangelo Edessa
  "mvboli.ttf:Thaana:other"                # en-US MV Boli
  "euphemia.ttf:Unified Canadian Syllabics:other" # en-US Euphemia
  "phagspa.ttf:'Phags-pa:sea"              # en-US Microsoft PhagsPa
  "phagspab.ttf:'Phags-pa:sea"             # en-US Microsoft PhagsPa Bold
  "daunpenh.ttf:Khmer:sea"                 # en-US DaunPenh
  "khmerui.ttf:Khmer:sea"                  # en-US Khmer UI
  "khmeruib.ttf:Khmer:sea"                 # en-US Khmer UI Bold
  "moolbor.ttf:Khmer:sea"                  # en-US MoolBoran
  "dokchamp.ttf:Lao:sea"                   # en-US DokChampa
  "laoui.ttf:Lao:sea"                      # en-US Lao UI
  "laouib.ttf:Lao:sea"                     # en-US Lao UI Bold
  "monbaiti.ttf:Mongolian:sea"             # en-US Mongolian Baiti
  "ntailu.ttf:New Tai Lue:sea"             # en-US Microsoft New Tai Lue
  "ntailub.ttf:New Tai Lue:sea"            # en-US Microsoft New Tai Lue Bold
  "taile.ttf:Tai Nua:sea"                  # en-US Microsoft Tai Le
  "taileb.ttf:Tai Nua:sea"                 # en-US Microsoft Tai Le Bold
  "himalaya.ttf:Tibetan:sea"               # en-US Microsoft Himalaya
  "msuighur.ttf:Uighur:sea"                # en-US Microsoft Uighur
  "msyi.ttf:Yi:sea"                        # en-US Microsoft Yi Baiti
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
  "msyh.ttf:Simplified Chinese:zh_cn"      # zh-CN Microsoft YaHei
  "msyhbd.ttf:Simplified Chinese:zh_cn"    # zh-CN Microsoft YaHei Bold
  "simhei.ttf:Simplified Chinese:zh_cn"    # zh-CN SimHei
  "simsunb.ttf:Simplified Chinese:zh_cn"   # en-US SimSun-ExtB
  "simsun.ttc:Simplified Chinese:zh_cn"    # zh-CN SimSun; NSimSun
  "kaiu.ttf:Traditional Chinese:zh_tw"     # zh-TW DFKai-SB
  "msjh.ttf:Traditional Chinese:zh_tw"     # zh-HK,zh-TW Microsoft JhengHei
  "msjhbd.ttf:Traditional Chinese:zh_tw"   # zh-TW,zh-HK Microsoft JhengHei Bold
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
  '29eedc86c06288ac5c3786cff85b1de3fa320e172eba267df46c50dd70b30999' #  82 andlso.ttf    en-US Version 5.92 Andalus
  'bb82a69c09865f121b1d1294eb00f87c218d58adc3c7dc8da483ae83ceff0b56' #  83 arabtype.ttf  en-US Version 5.91 Arabic Typesetting
  '2602b7a98a0f10bf765dea99c43e7cab39d2c98a77733c5acd598ff7c7cf173d' #  84 majalla.ttf   en-US Version 5.01 Sakkal Majalla
  'cee32a9084a546d58ae078b7cd8f32f28a2040c783c2fb59d7fecc687604a6bf' #  85 majallab.ttf  en-US Version 5.01 Sakkal Majalla Bold
  '4aafc38068e2a29dd63bdcbbbdc4e743eb4a4515b2e0c1e70b32f64cb949b974' #  86 simpo.ttf     en-US Version 5.92 Simplified Arabic
  '52e838af453968de56390c32289bf8b3feaddfe4eaae39f5517f052d2e210488' #  87 simpbdo.ttf   en-US Version 5.92 Simplified Arabic Bold
  '74531151c6d19ac6f335ba989d77a3b56b2cf6dce1b21ea525f48cad42161109' #  88 simpfxo.ttf   en-US Version 5.92 Simplified Arabic Fixed
  '951a5167021ed830419dbd7962a36246e8903361100dac7c779babfceffbe4ca' #  89 trado.ttf     en-US Version 5.92 Traditional Arabic
  '7d22a1be076224867650047a2bec0fd28e64dcf6281212de51939992cf47c872' #  90 tradbdo.ttf   en-US Version 5.92 Traditional Arabic Bold
  '195519d5ae4ee05e3482e2b9279c3edb3cdbc6ced594827fe601eff77aa6e34a' #  91 ahronbd.ttf   en-US Version 5.02 Aharoni Bold
  '989ca4279c8f18953cdef95804a201d87445d38728009fadd61fd8a2e86bae1d' #  92 david.ttf     en-US Version 5.02 David
  '8b9c0065059b945339580aaa423e98a25068f57142d9d787899efd735fecac31' #  93 davidbd.ttf   en-US Version 5.02 David Bold
  '7f9fa1010af645881b726591dac4062f5325a63be7369376b00ad4e71f277ee0' #  94 frank.ttf     en-US Version 5.02 FrankRuehl
  'dd503a4cb2b6607d36923548c2ba50d53f0595db4dae667c26ffb328f0966c0a' #  95 gisha.ttf     en-US Version 5.00 Gisha
  '70883b0dc5960ad15ee0277717de4a77bfb9218694497b438ad35438e6fbca05' #  96 gishabd.ttf   en-US Version 5.00 Gisha Bold
  'b8dcdb57a8700b597dd3f539526070192f67c36dedb25c132443e8a2449503b5' #  97 lvnm.ttf      en-US Version 5.02 Levenim MT
  '49f4760c091458a281e1e06de9466d3fa3bc23527739139e66ab4cb185c03001' #  98 lvnmbd.ttf    en-US Version 5.02 Levenim MT Bold
  'f959aa7adbb7ede2fa432faeea1e0a94d691b96aeb7460657aeef9d8e30ed2d4' #  99 mriam.ttf     en-US Version 5.02 Miriam
  'b8adec9fe72180fba8ee7a9c6598cfeb12970fedec2e77045f28c3b502c81d6e' # 100 mriamc.ttf    en-US Version 5.02 Miriam Fixed
  '0edbeea14891e350240504cfc15a43c6f25c448a13515b5df1beffbeaca9f3d2' # 101 nrkis.ttf     en-US Version 5.02 Narkisim
  'd4d45889fe78bf123010357c943f4af048ef1822bd1eaaa22407e58551a399a5' # 102 rod.ttf       en-US Version 5.02 Rod
  '34110d7c11479f69a07cb594ecc44d61741106871bb21184cd489b78338ac448' # 103 shonar.ttf    en-US Version 5.91 Shonar Bangla
  'c648e4c41f00fd7b7fc5ca5649807860908ac13d4f0e4e5a19775e21634cb87f' # 104 shonarb.ttf   en-US Version 5.91 Shonar Bangla Bold
  '0d519981fc26e2fe934bd25ec9dfe478e082c99063d868008b20996809e13ccc' # 105 aparaj.ttf    en-US Version 5.91 Aparajita
  'c7188ba39546acd166557525ac67c9907c2abc66ab31394c0120c85c9c1a0017' # 106 aparajb.ttf   en-US Version 5.91 Aparajita Bold
  'b536715ec342d95231f496c994bb9b12d0302065cb70c924e05be1d18c36d685' # 107 aparajbi.ttf  en-US Version 5.91 Aparajita Bold Italic
  '06fe69637de949a6923ccdba5522e22954d7423f427749ad1960b8ea0a7e1ab4' # 108 aparaji.ttf   en-US Version 5.91 Aparajita Italic
  'cc2582726934814c8395663348ff081b5ba3f1698bc1c7e5d98780ada3371010' # 109 kokila.ttf    en-US Version 5.91 Kokila
  'e3659f71d81ae5d84ada79c11a619a4166ed8b6af7a8aa3f337668586048b04a' # 110 kokilab.ttf   en-US Version 5.91 Kokila Bold
  '1c1e219f774ca60bfbe8945c39a3652a869193a6b0dd94b9df83c9c7b447da37' # 111 kokilabi.ttf  en-US Version 5.91 Kokila Bold Italic
  'fdd45867f639c9156dc2afd6c488d28b266676fd241c60c0bd1f130a01222b64' # 112 kokilai.ttf   en-US Version 5.91 Kokila Italic
  '98f6cbbf8c0fb839c0ca08338bc8d2dcc3b4a7d79f3921c71cfd28edb40f3e47' # 113 mangal.ttf    en-US Version 5.91 Mangal
  '7f74007d58af4db8d77c9c1023f53d03dd87fb68bbd3c4e9d2fb080fabd092b9' # 114 mangalb.ttf   en-US Version 5.91 Mangal Bold
  'f305ed07d34aad4b2dd2b41adfddee92b39094578b7565cf8dc7bb566a2ef2fa' # 115 utsaah.ttf    en-US Version 5.91 Utsaah
  'c36ab33b5fd88f49f26627b7831afb2fca1776c827f02cd7e618f51e8c3a9d9c' # 116 utsaahb.ttf   en-US Version 5.91 Utsaah Bold
  'cb53336cdc1303f706b5b929548560db0e5218efb6b670e941e3d7cafe0b88e2' # 117 utsaahbi.ttf  en-US Version 5.91 Utsaah Bold Italic
  '873bf011cf840e81221d5d57988c3c562faa378c24007f1b09da87294fdba734' # 118 utsaahi.ttf   en-US Version 5.91 Utsaah Italic
  '81715c93f334654c272f87f950b38c2336c27ba75e987ca613a63c63f45551f9' # 119 shruti.ttf    en-US Version 5.90 Shruti
  '41c2cce4c46f4f58e50a0833ed0e6774b6f2a8278663e1041e30750fb333f896' # 120 shrutib.ttf   en-US Version 5.90 Shruti Bold
  '9538df0043b24213c23a5d72794c21b5a7079b7559ac139c61fcf6e5a1456d65' # 121 raavi.ttf     en-US Version 5.90 Raavi
  '18375130720bd594e3843f5190043c0ee5c443634de7377ce84d8c1c0e303665' # 122 raavib.ttf    en-US Version 5.90 Raavi Bold
  'e787ce11b4bcfa0ac23b0001e13c46e5de2ba32278a395de71ab29bd31b971b5' # 123 tunga.ttf     en-US Version 5.90 Tunga
  'fbcc1e6afc1a31ad50a80a1b945b8fe376498d65f631ea8559d9903c8a867da0' # 124 tungab.ttf    en-US Version 5.90 Tunga Bold
  'c6e7edaa6fb6470640fb2ceb3cbe6dea91e85d45080c020098ab2a64f1e55ed0' # 125 kalinga.ttf   en-US Version 5.90 Kalinga
  'a44e2363dc02b671ccc19f316287a7e60673a2daab92aee5fdec15516afc1440' # 126 kalingab.ttf  en-US Version 5.90 Kalinga Bold
  '99a0d865d149b7dbb1470d014e420963d9f8886f7bca2e14ec8868c9145f962e' # 127 kartika.ttf   en-US Version 5.90 Kartika
  '6decc4edd28a56e28fac1b308b56059bb2987c3cd9f84336c9562adad579f41b' # 128 kartikab.ttf  en-US Version 5.90 Kartika Bold
  'ac5225f630841b8fce80ba31044274fd9cc893957fcecad51114e21795536bbb' # 129 iskpota.ttf   en-US Version 5.90 Iskoola Pota
  'f9d06e11566e98b7d489468e52c881794570adcf9e072032a31d98945bdac11b' # 130 iskpotab.ttf  en-US Version 5.90 IskoolaPota-Bold
  '14e4e33df206ae15853d87b963246c6668d0dcca1ceb6d49ab0f007923fa4356' # 131 latha.ttf     en-US Version 5.90 Latha
  '0438aa6a1a008888878e75b48692c2f9a1b33d821a715d78c84ea98db15e4fcf' # 132 lathab.ttf    en-US Version 5.90 Latha Bold
  '4041332419cdbb9b6d21ecc1f77d827632337d8a82c148c8760a5c1dd46a2cdd' # 133 vijaya.ttf    en-US Version 5.91 Vijaya
  'd67e041b48eb03bfe1e34f9d3b1a539e4edc74bf079cc21395f7ddddf0521f00' # 134 vijayab.ttf   en-US Version 5.91 Vijaya Bold
  '39d3f73f4857378f079c6a23d8dd4dc6fa8324712b982a4129b7d265ceaa85d7' # 135 vrinda.ttf    en-US Version 5.90 Vrinda
  '78bacdb47a919ff4833ccdc66156db75e206dfb345f82545dd0b5bf523db32c6' # 136 vrindab.ttf   en-US Version 5.90 Vrinda Bold
  '15c4267d811a3216c5df9110596125ea4a108244e3c39d20fe6d5a2b06c253dd' # 137 gautami.ttf   en-US Version 5.90 Gautami
  '80eccb06c696972ccbb52467dc5abd5fe4de1eeb14f4797580eea14ff50326b9' # 138 gautamib.ttf  en-US Version 5.90 Gautami Bold
  '82af7e7a7c45ebeea2c70b8676b8b3b8ed5ca5dee959fd5d83064ed376ecf70f' # 139 vani.ttf      en-US Version 5.91 Vani
  'bf3a4ffaf0591f7a43498073b7d91dbb0840f73daee05c0d885ad849762eeecf' # 140 vanib.ttf     en-US Version 5.91 Vani Bold
  '30e97d1ba57c3568eba44c80e54436cebc64ff163fdb38b175e1cbb90e95607d' # 141 meiryob.ttc   ja-JP Version 6.02 Meiryo Bold; Meiryo Bold Italic; Meiryo UI Bold; Meiryo UI Bold Italic
  'adc44805931578d85620bd9464c1d87812b6a9160e979e5ee4c69420a47e5968' # 142 meiryo.ttc    ja-JP Version 6.02 Meiryo; Meiryo Italic; Meiryo UI; Meiryo UI Italic
  'ef9044f54896c6d045a425e62e38b3232d49facc5549a12837d077ff0bf74298' # 143 msgothic.ttc  ja-JP Version 5.01 MS Gothic; MS PGothic; MS UI Gothic
  '77b53f8b54d69cbc33381573c6d0239d7fefcebcea89ca14fe0b1ccfe6784cef' # 144 msmincho.ttc  ja-JP Version 5.01 MS Mincho; MS PMincho
  '247c8216a3d96e7355738b9cb6aaab5de0868d798a0f635cfc1b1352a50b0679' # 145 malgun.ttf    ko-KR Version 6.11 Malgun Gothic
  '5d6e188a1c307f0ce5fcf76310d98fad94e751eec3d5c8dfe68398b8ec028b6e' # 146 malgunbd.ttf  ko-KR Version 6.00 Malgun Gothic Bold
  '091bab43d565fca1e500ceac91c57569bfae31d393d8a7987611dcd259eafe19' # 147 batang.ttc    ko-KR Version 5.00 Batang; BatangChe; Gungsuh; GungsuhChe
  'a167be36290c0696737da35eaf48b7ce7704d930985406a1e661f94e54fd191a' # 148 gulim.ttc     ko-KR Version 5.01 Gulim; GulimChe(5.00); Dotum(5.00); DotumChe(5.00)
  'f75b25f420a9300ce6576f4af207a26bea45dc60c5a5e158dc75ff7cf66cf12b' # 149 nyala.ttf     en-US Version 5.00 Nyala
  'bc807fdcbc163c8f66cd8f215992900a70c95f9447f5abe23eab1a2a4d8c99f1' # 150 ebrima.ttf    en-US Version 5.00 Ebrima
  '41f6906440c657fda5a77bb6c7ba62f6bd12ffa3ac56ec7756fdad8e5501b029' # 151 ebrimabd.ttf  en-US Version 5.00 Ebrima Bold
  '683cd454aa2a50347447ca9890feca86cc6eefc4696868dbf3925b0f6eca9e19' # 152 plantc.ttf    en-US Version 5.00 Plantagenet Cherokee
  '9d4af8c7bc0b84e0501db2b43303ee0b64c3fb2e7a59d84ee744bf6cf66ca6ad' # 153 estre.ttf     en-US Version 5.00 Estrangelo Edessa
  '08205f123a14ea253b7cd2b03807220fa927e921ef7f83c9bf37b538997626f4' # 154 mvboli.ttf    en-US Version 5.01 MV Boli
  '70dfea68456eba5968e5a6832398eac938b0b6c40aa6873af1dba69f5e7677f9' # 155 euphemia.ttf  en-US Version 5.00 Euphemia
  '111319fa89cd66d0f8b23a8a262cb32e6fb64134b63611a1b2220811029d605d' # 156 phagspa.ttf   en-US Version 5.90 Microsoft PhagsPa
  'aba7a72e1d649a843446b26e9a512ef9f8a7d83da41e5463501be9bca628ef88' # 157 phagspab.ttf  en-US Version 5.90 Microsoft PhagsPa Bold
  '5ea3a22e03026f0ad4a9b7b8fdaf434e0af4dede482a11ac693e374f576c7e96' # 158 daunpenh.ttf  en-US Version 5.00 DaunPenh
  'c4489c72c3b7f47e2c6749aeab9aaa931bae2bd160a4db51c9e075ed1af9e63a' # 159 khmerui.ttf   en-US Version 5.00 Khmer UI
  '4947ccd8dfeca8ca7213802cf2e5e42ae92adf67ac6d9409c8c816ab0b2e4a7c' # 160 khmeruib.ttf  en-US Version 5.00 Khmer UI Bold
  'bb5d870471fda6310ed4ad1ea5419511e1e63ff4b19124035204aea05d12b99d' # 161 moolbor.ttf   en-US Version 5.00 MoolBoran
  'b9682c73a954f5a8a1b2a0ff88b4ff54cb20143a0330c3b1ccc2f9aede2838c7' # 162 dokchamp.ttf  en-US Version 5.00 DokChampa
  'c4973d9c2a0eab7300dbb461654d645a6d8c7dc6f35eee59cee7411da3b368f0' # 163 laoui.ttf     en-US Version 5.00 Lao UI
  '27a89794c46f565d1c1e13c4ae746ec5087270ac104dcebe6286a4643e6daebf' # 164 laouib.ttf    en-US Version 5.00 Lao UI Bold
  '39548c3d602cae0edd460825e9332dd671564655a0c014137d21f9c9221b6488' # 165 monbaiti.ttf  en-US Version 5.01 Mongolian Baiti
  '59026a6add9b89ea645d2ef0c9742eeb3811a7d16c8c7cb902c454e6fb26cf0c' # 166 ntailu.ttf    en-US Version 5.90 Microsoft New Tai Lue
  '0dbe83bfdec1176241b3aa9952eaee8cd084b7536d7b900d4834d6b5f660b0b0' # 167 ntailub.ttf   en-US Version 5.90 Microsoft New Tai Lue Bold
  'af858785b8ef6f450b7b03f43ab477339a93b3b6f0092dfc4f62e5f50f18365e' # 168 taile.ttf     en-US Version 5.90 Microsoft Tai Le
  'f5586f44a7854cf99b2e6967300306c072869db9226527f2bea488fe978b60d0' # 169 taileb.ttf    en-US Version 5.90 Microsoft Tai Le Bold
  '5c9b5c16ea7f9de3730d716581cc065e153e8f335efb3213b7f8ebc218ee0f24' # 170 himalaya.ttf  en-US Version 5.00 Microsoft Himalaya
  '03727eda98c9040239dfaeead709d3308b1ccee407a13043ed8868a8b72133cd' # 171 msuighur.ttf  en-US Version 5.91 Microsoft Uighur
  '2a36a9ba27d0429017315b9be5c7cfaaec5329ef9028c180da89db12f3aeb20f' # 172 msyi.ttf      en-US Version 5.00 Microsoft Yi Baiti
  '6404bed366fecf274f3be27d5e73254bece14ef23342d852fed9d219af659d43' # 173 angsa.ttf     en-US Version 5.00 Angsana New
  'dc78e5013080281400e816ef04d203b8dc1e5b7948c699a837afc35649817256' # 174 angsab.ttf    en-US Version 5.00 Angsana New Bold
  'd885794216928ed04809c1d23eae78a354e95024d5321a186035544e5a35fd9b' # 175 angsaz.ttf    en-US Version 5.00 Angsana New Bold Italic
  'b87d254d4f5b22b8bc5d07379101a635b8d3324586ae4c2c7bbbd61a3540d73e' # 176 angsai.ttf    en-US Version 5.00 Angsana New Italic
  '12902ff136ca3f299f7c25d5d31d872a7850dd7dfbed0770151ae1d667c092bb' # 177 angsau.ttf    en-US Version 5.00 AngsanaUPC
  '638289e7bbed5be501c8eb6697c708ee5ec562303ea51eaf2f8906731696d011' # 178 angsaub.ttf   en-US Version 5.00 AngsanaUPC Bold
  '3100caa371fe0a6a5ff3127e512b3ceb39e0c74e671c83c81718119ecbc5507a' # 179 angsauz.ttf   en-US Version 5.00 AngsanaUPC Bold Italic
  '940fc6e9040c55969c0197ae05620b91f0335e1d5b6e953b5b96463dd7c3bda7' # 180 angsaui.ttf   en-US Version 5.00 AngsanaUPC Italic
  '20ba365275e4972f1a68588c821cd1ec88656349633d4598a1dec93498d5638e' # 181 browa.ttf     en-US Version 5.00 Browallia New
  '69798848f0614eab0f9d04eb67b8942bb534f71cd7d0ab79e4608cf87fb66afb' # 182 browab.ttf    en-US Version 5.00 Browallia New Bold
  '89ad8ad5a6ec28e779e1a0f793b677501a57771b32878f9b5e868665324e04fd' # 183 browaz.ttf    en-US Version 5.00 Browallia New Bold Italic
  '5d2300334780434b86a12db6220c8ed7490ea68a17a99f94ce4aa798f21a7f87' # 184 browai.ttf    en-US Version 5.00 Browallia New Italic
  '098a849ddfbe1afd6c4e54c42deecd31d32c12da507916ce0ecc88947bc8a70a' # 185 browau.ttf    en-US Version 5.00 BrowalliaUPC
  '70503462f62f46ad0ab6a6ca7814953b9eb857877e74fc72979dfdba2606f53d' # 186 browaub.ttf   en-US Version 5.00 BrowalliaUPC Bold
  '58dd269b448b3abb62fc0764b4f1b48b0ce339052dd3db8d881e5db3e77dac8b' # 187 browauz.ttf   en-US Version 5.00 BrowalliaUPC Bold Italic
  'c379b968cb1561c52ee44e88bf16c4f93569f3067916de9a8a3c9c3c393852dd' # 188 browaui.ttf   en-US Version 5.00 BrowalliaUPC Italic
  'd03bd2ccc6505440f0fcfbb5cb4a9bf242791703cb87cd886c6760929ee766ac' # 189 cordia.ttf    en-US Version 5.00 Cordia New
  '5a12d0156247eb12b2d7680bff7d5ed9b44eb33cda9b4877736a88af2821777c' # 190 cordiab.ttf   en-US Version 5.00 Cordia New Bold
  'b848bc662135a8b08b8f46c2127176555b7453a0c89e42b2654e4f6de1661860' # 191 cordiaz.ttf   en-US Version 5.00 Cordia New Bold Italic
  '764401bf389db98a37f288c08c76bfe6b4ca8147995bef6f99312a1bfe185477' # 192 cordiai.ttf   en-US Version 5.00 Cordia New Italic
  '1034a31e8b6724305d01f812547de6943fbf32033a4736f4013eb194020279ba' # 193 cordiau.ttf   en-US Version 5.00 CordiaUPC
  'f8a8c99cbcf8a6f82951ccf399bddb5b32760dfdd40ee3f92e0fe33ffd93d822' # 194 cordiaub.ttf  en-US Version 5.00 CordiaUPC Bold
  '5a1d9d371256fba57d00ed06d27ca5cc3b18690358e03554589df96a6b7c68a8' # 195 cordiauz.ttf  en-US Version 5.00 CordiaUPC Bold Italic
  'dac15e34caa82d3b6e980a8010e0f06453b66aef393ac55e367a8e0c743c9058' # 196 cordiaui.ttf  en-US Version 5.00 CordiaUPC Italic
  'c7c431b06dfdc2be21f70633fb5de46029fed15c8983c2f32174dcac4b1a11cf' # 197 upcdl.ttf     en-US Version 5.01 DilleniaUPC
  '5745b49e151e38a2e0b7e942e8d6e672349b6cbf45573e13cddfcba4767ecf19' # 198 upcdb.ttf     en-US Version 5.01 DilleniaUPC Bold
  'c6a8baecf4af7b99022d07b6a8c4bad3c790e2024d3a1d5d1b214019d4820058' # 199 upcdbi.ttf    en-US Version 5.01 DilleniaUPC Bold Italic
  '015087b08a05602092bab12d8d5541dc39db34985721fb8d1fe7027067a16ba4' # 200 upcdi.ttf     en-US Version 5.01 DilleniaUPC Italic
  '2c505e19d768a4db2b42c2b933f4f7a4520077b46dc15f35c5be409630ac5066' # 201 upcel.ttf     en-US Version 5.01 EucrosiaUPC
  'fde4fc8b12f3580107323e98a31530fb86a574b315442c1249b3032126f5f539' # 202 upceb.ttf     en-US Version 5.01 EucrosiaUPC Bold
  'f59264ef03a0923aa0926379b2e3e47e64dcdbb9ba291bddef6d8ad08b28953f' # 203 upcebi.ttf    en-US Version 5.01 EucrosiaUPC Bold Italic
  '6eaa69821682ef4718445353c3f48a52377b629d73a15bcb019e46a4297de20d' # 204 upcei.ttf     en-US Version 5.01 EucrosiaUPC Italic
  '408848ec0cf386bf5e52800dcaa3113fc3fefd4c1c743bfe6871b6d91e9f7a21' # 205 upcfl.ttf     en-US Version 5.01 FreesiaUPC
  '1f2e7d4fa8e9aed1eb4bc4e625eedc6683c148a9d20566a692a67704a1eabfb6' # 206 upcfb.ttf     en-US Version 5.01 FreesiaUPC Bold
  '58cd5165d088860a68f6c3d3e10b9a1bd1336630770cdca9769944af067c9284' # 207 upcfbi.ttf    en-US Version 5.01 FreesiaUPC Bold Italic
  'c08a3f8f9680ec796464f8b1936ea96d41bd982c485ca6006b5628eb5cc0fb01' # 208 upcfi.ttf     en-US Version 5.01 FreesiaUPC Italic
  '96e25e1830e041af2ce430c3e4be8cbf49e2e5b9359b69dd3c50821474a1ab77' # 209 upcil.ttf     en-US Version 5.01 IrisUPC
  '94048fa81894578cfd03327dded12c38f663db34f8dfc1e6e30553ebfbb00ed9' # 210 upcib.ttf     en-US Version 5.01 IrisUPC Bold
  'bb6020a0c7896acea03bceff2ea847af854fc773d7eeaee176d6e4c86952e595' # 211 upcibi.ttf    en-US Version 5.01 IrisUPC Bold Italic
  '6a5a6e54fea01f599fc4176db6e1c24e171c6aad5933e6284d7dc8dfd7b66d48' # 212 upcii.ttf     en-US Version 5.01 IrisUPC Italic
  'f9e7d8e4a5e6783d0cf4a22caf642471ed18048a21967d1b749239cefd3f4b92' # 213 upcjl.ttf     en-US Version 5.01 JasmineUPC
  '716b9f05caaff0dfec2aa3aae33f08ddd8515d13983240532a12e994da9d9263' # 214 upcjb.ttf     en-US Version 5.01 JasmineUPC Bold
  '8dde222f65d5a97bc8148e58b40b3549a508a50de17e5b166dce8aa3129be8bb' # 215 upcjbi.ttf    en-US Version 5.01 JasmineUPC Bold Italic
  'e7677bd3087b74bf89481c1ca7a9352a51248cd906014ada703df9a178db0427' # 216 upcji.ttf     en-US Version 5.01 JasmineUPC Italic
  'f9e18b8fa70da172741e2db315167659448dee7382caa9e08b99544131506e5e' # 217 upckl.ttf     en-US Version 5.01 KodchiangUPC
  '54d977ef73a2eac035c6cef171f6441eafab1363c61ffc09525dfb941a773198' # 218 upckb.ttf     en-US Version 5.01 KodchiangUPC Bold
  'f555c56fd9ab7b674a8675bbee9ba803a27443bb5d27c9416dedf996a01d22c7' # 219 upckbi.ttf    en-US Version 5.01 KodchiangUPC Bold Italic
  'a52ae246dd669b7c8f0e0519ff63dcdef72cc61ba0410d92146e64c5983b78ea' # 220 upcki.ttf     en-US Version 5.01 KodchiangUPC Italic
  '400cbc516af383797108c317a69c73c99d9fcc107dd2219181aaa72686249f71' # 221 leelawad.ttf  en-US Version 5.00 Leelawadee
  '659837b84c86f358618dd580c182ec00b66437436ed41de432d9ddf6d144a5c3' # 222 leelawdb.ttf  en-US Version 5.00 Leelawadee Bold
  '2221765602bd9a4cc91da99652a3203d6fb80c655ff15cda003a28252afb6477' # 223 upcll.ttf     en-US Version 5.01 LilyUPC
  '0419cdf9c85467c5b02d194ad8f9902970fe6398aefc8e25fb46c1b9e72e0d07' # 224 upclb.ttf     en-US Version 5.01 LilyUPC Bold
  '32f823c300bb060774d0a81d9b870a1eb0eaab1f97324d47d5e7515f0473d89c' # 225 upclbi.ttf    en-US Version 5.01 LilyUPC Bold Italic
  '000445fb49f67d8211984de0b628666d03bf6b8d4f1490483f33c4503cd14510' # 226 upcli.ttf     en-US Version 5.01 LilyUPC Italic
  '521c6f7546b4eb64fa4b0cd604bbd36333a20a57e388c8e2ad2ad07b9e593864' # 227 simfang.ttf   zh-CN Version 5.01 FangSong
  'f49873fbe1689f1a37ed0f5765eb7d989d8a3b75210d1f1b66b74b043a1871be' # 228 simkai.ttf    zh-CN Version 5.01 KaiTi
  '1547ada4f8a1d8f12f154d221009b90e9389ea77f3911c8fab6494e533cf0ef2' # 229 msyh.ttf      zh-CN Version 6.02 Microsoft YaHei
  '902de9fa292978d04e5052b5005bcc445ebb0907eb83245386e559f3aba732cd' # 230 msyhbd.ttf    zh-CN Version 6.02 Microsoft YaHei Bold
  '336a838f4a78e150826be608dae69de59d50948c3d2b71760e096ae764154bdc' # 231 simhei.ttf    zh-CN Version 5.01 SimHei
  '55b05d3daa2a0ca45e2f8c3b60271e9a6cb668bb7878386b2d0800bc13f2b8d0' # 232 simsunb.ttf   en-US Version 5.00 SimSun-ExtB
  'ff7d69bfa6588d3fdedbddbe3a29ac11f0c50236723ee72a9ea49ec3e2553f5d' # 233 simsun.ttc    zh-CN Version 5.03 SimSun; NSimSun
  '9e597a391d869a0526a2c1ad14714193abb1bd9e7d85738f9cece411018229b7' # 234 kaiu.ttf      zh-TW Version 5.00 DFKai-SB
  '03a01753d6916c13bb2d2d159ba6f858949d191059b588f143fd589bf394d101' # 235 msjh.ttf      zh-HK,zh-TW Version 6.02 Microsoft JhengHei
  'f5237e5303a4e95cab2833cb02ab7fa1f3079cc87644a29cf3f855589bf04c39' # 236 msjhbd.ttf    zh-HK,zh-TW Version 6.00 Microsoft JhengHei Bold
  'd7a459c1ebb8d8403bf45345cbecd34fd3be4642ea91e08a8dba8164ad4d7cc1' # 237 mingliub.ttc  zh-TW,zh-HK Version 7.00 MingLiU-ExtB; PMingLiU-ExtB; MingLiU_HKSCS-ExtB
  'b642c3b47249c14b6e35866833e298069f9e5d76a0870bb18d9aaa4f5c774c28' # 238 mingliu.ttc   zh-TW,zh-HK Version 7.00 MingLiU; PMingLiU; MingLiU_HKSCS
)
_fnt256sumsx+=(
# Older international fonts from the Win7.1 and 7.0 DVD
  '56b633b3690d7e078b4a3da999c4f12b2e583df70699f72807d344d3e42c89b4' # 113 mangal.ttf    en-US Version 5.90 Mangal
  'c04365a4a5accd570deae0877f579bd3bccb3395cd7553e3f412b370a1013c26' # 114 mangalb.ttf   en-US Version 5.90 Mangal Bold
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

REM Somtimes this must be run as admin because some fonts don't have the right permissions.

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
  local _winlistconflict=('ttf-ms-win8')
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
