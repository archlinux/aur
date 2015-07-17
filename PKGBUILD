# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Martin Schmoelzer mschmoelzer gmail

_opt_IncludeWin7Fonts=1 # Default 1
# 0=    Installing ttf-win7-fonts, skip Office fonts that conflict.
# 1=Not installing ttf-win7-fonts, install all available Office fonts.

_opt_GetFontName=0 # Default 0
# For our custom updpkgsums:
# 1=Use Perl Font::TTF to get version and name. Detailed but slow.
#   Useful for version comparison or publishing a detailed PKGBUILD.
# 0=Just get the version with sed. Fast. Useful to quick fix sums for installing.

_opt_Optimal=0 # Default 0
# 1=Use only the best versions of fonts and reject suboptimal fonts.
#   The best versions come from the Office DVD except for
#   Arial Narrow (4) which must come from an updated Office 2007 install.
#   Most fonts aren't installed on the running Office 2007 I've seen.
# 0=Use whatever fonts are supplied.

# Fixed: Upper and lower case file names are fully managed.
# Fixed: Adaptive hash sum handling.
# Fixed: Eliminate file conflict with ttf-win7-fonts

# BUILD INSTRUCTIONS:
# ----------------------
# This package provides the Microsoft Office 2007 fonts for your Linux
# system for use with LibreOffice, or whatever.
# Due to license issues and availability the fonts cannot be downloaded automatically.
#
# You must acquire them from an Office 2007 CD/DVD/Network share etc. Use
# cabextract available from [community] to extract them to the directory
# containing this PKGBUILD like this:
#
# "cabextract --filter '*.TT[FC]' /path/to/office2007/Enterprise.WW/EnterWW.cab"
# In Windows, files can be extracted from CAB with Total Commander or 7-Zip.
# Grey Plus (+) select *.TTF, (+) again select *.TTC. Windows Explorer can
# read CAB files but can't select by wildcard and sort by type is too slow.

# Office 2007 Pro Plus ProPlsWW.cab is missing segoechess.ttf which we don't
# Install anymore.

# You need the files listed in the _fonts=() array. Place them in the same
# directory as this PKGBUILD file, then run 'makepkg -scCfi'.
#
# To make it easier to get the 214 fonts without having to pick each one out,
# two copy scripts have been provided. These scripts are disabled to prevent
# errant running and must be edited to enable and adapt them to your
# environment.

# If your Windows doesn't share, _COPY.BAT runs in Windows and copies the
# font files to a Samba share, desktop, flash drive, or some other folder
# you can ftp, sftp, or transfer any way you like.

# _COPY.sh copies the files directly from a Windows share using smbclient.
# Some fonts won't copy due to permissions errors.

# For this package the optimal fonts come from the DVD for which the copy
# scripts aren't helpful. If the copy scripts are used many fonts will be
# Windows versions so you must set _opt_Optimal=0 above.

# It is possible that the checksums don't match. This is due to the fact that
# different Windows releases may have older or newer fonts than the ones that
# were used to create the package. Some fonts may have been updated by Office
# or Windows Update. I've captured alternate sums for as many fonts
# as I can find. Should you find some fonts that aren't in the various sums
# arrays the package won't build. First look through the sums arrays.
# If you've found a font source that I missed then fix the sums, or
# find a better font source.

# To fix the sums, you have to replace the _fnt256sums=(...) entry in
# this PKGBUILD:
#  - On any mismatch a sums file PKGBUILD.tmp is generated automatically
#    unless you elect for optimal fonts.
#  - Copy and paste the sums from PKGBUILD.tmp into this file, replacing
#    the existing _fnt256sums=(...) entry.
#  - If you want optimal fonts, replace the faulty fonts from the sources
#    noted as optimal.

# Consider sending me the sums so they can be added to the PKGBUILD. Include
# the source so I can verify them.

set -u
pkgname='ttf-office-2007-fonts'
pkgver='1.0'
pkgrel='3'
pkgdesc='Microsoft Office 2007 TrueType Fonts.'
arch=('any')
url='http://support.microsoft.com/kb/924623'
license=('custom')
depends=('fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir')
makedepends=('bsdiff') #'fontforge') # 'cabextract')
if [ "${_opt_GetFontName}" -ne 0 ]; then
  makedepends+=('perl' 'perl-font-ttf')
fi
if [ "${_opt_IncludeWin7Fonts}" -eq 0 ]; then
  optdepends=('ttf-win7-fonts: Calibri Cambria Candara, Consolas, Constantia, Corbel')
fi
install="${pkgname}.install"
source=('license.rtf' 'FONTVER.pl')
sha256sums=('096cdd18e26b2b3d8cf0b3ec6a1ffb5b0eaae0fcc2105e3c145f19037a42d467'
            '11f49d06142fc3a5a01a0f49abacd599c7badcae2ceff226f35409d8f9a6bd89')

# See sums for font name and known versions.
_fonts=(
'AGENCYB.TTF' 'AGENCYR.TTF' 'ALGER.TTF' 'ANTQUABI.TTF'
# Microsoft Update for Office 2007 supplies hotfix patched Arial Narrow fonts.
# https://support.microsoft.com/en-us/kb/956514
# Description of the 2007 Office hotfix package (Gfonts.msp): August 26, 2008
'ARIALNBI.TTF' 'ARIALNB.TTF' 'ARIALNI.TTF' 'ARIALN.TTF'
# The Arial Narrow off the DVD don't work in either Windows or Linux.
# The hotfixed Arial Narrow from a fully updated Office 2007 work.
'ANTQUAB.TTF'  'ANTQUAI.TTF'
'ARIALUNI.TTF' 'ARLRDBD.TTF' 'BASKVILL.TTF' 'BAUHS93.TTF'
'BELLB.TTF' 'BELLI.TTF' 'BELL.TTF' 'BERNHC.TTF' 'BKANT.TTF' 'BOD_BI.TTF'
'BOD_BLAI.TTF' 'BOD_BLAR.TTF' 'BOD_B.TTF' 'BOD_CBI.TTF' 'BOD_CB.TTF'
'BOD_CI.TTF' 'BOD_CR.TTF' 'BOD_I.TTF' 'BOD_PSTC.TTF' 'BOD_R.TTF'
'BOOKOSBI.TTF' 'BOOKOSB.TTF' 'BOOKOSI.TTF' 'BOOKOS.TTF' 'BRADHITC.TTF'
'BRITANIC.TTF' 'BRLNSB.TTF' 'BRLNSDB.TTF' 'BRLNSR.TTF' 'BROADW.TTF'
'BRUSHSCI.TTF'
#'BSSYM7.TTF' # Bookshelf Symbol 7 won't render in X
'CALIFB.TTF' 'CALIFI.TTF' 'CALIFR.TTF' 'CALISTBI.TTF'
'CALISTB.TTF' 'CALISTI.TTF' 'CALIST.TTF' 
'CASTELAR.TTF' 'CENSCBK.TTF' 'CENTAUR.TTF' 'CENTURY.TTF' 'CHILLER.TTF'
'COLONNA.TTF'
'COOPBL.TTF'
'COPRGTB.TTF' 'COPRGTL.TTF'
'CURLZ___.TTF' 'ELEPHNTI.TTF' 'ELEPHNT.TTF' 'ENGR.TTF'
'ERASBD.TTF' 'ERASDEMI.TTF' 'ERASLGHT.TTF' 'ERASMD.TTF' 'FELIXTI.TTF'
'FORTE.TTF' 'FRABKIT.TTF' 'FRABK.TTF' 'FRADMCN.TTF' 'FRADMIT.TTF'
'FRADM.TTF' 'FRAHVIT.TTF' 'FRAHV.TTF' 'FRAMDCN.TTF' 'FREESCPT.TTF'
'FRSCRIPT.TTF' 'FTLTLT.TTF' 'GARABD.TTF' 'GARAIT.TTF' 'GARA.TTF'
'GIGI.TTF' 'GILBI___.TTF' 'GILB____.TTF' 'GILC____.TTF' 'GILI____.TTF'
'GILLUBCD.TTF' 'GILSANUB.TTF' 'GIL_____.TTF' 'GLECB.TTF' 'GLSNECB.TTF'
'GOTHICBI.TTF' 'GOTHICB.TTF' 'GOTHICI.TTF' 'GOTHIC.TTF' 'GOUDOSB.TTF'
'GOUDOSI.TTF' 'GOUDOS.TTF' 'GOUDYSTO.TTF' 'HARLOWSI.TTF' 'HARNGTON.TTF'
'HATTEN.TTF' 'HTOWERTI.TTF' 'HTOWERT.TTF' 'IMPRISHA.TTF' 'INFROMAN.TTF'
'ITCBLKAD.TTF' 'ITCEDSCR.TTF' 'ITCKRIST.TTF' 'JOKERMAN.TTF' 'JUICE___.TTF'
'KUNSTLER.TTF' 'LATINWD.TTF' 'LBRITEDI.TTF' 'LBRITED.TTF' 'LBRITEI.TTF'
'LBRITE.TTF' 'LCALLIG.TTF' 'LFAXDI.TTF' 'LFAXD.TTF' 'LFAXI.TTF' 'LFAX.TTF'
'LHANDW.TTF' 'LSANSDI.TTF' 'LSANSD.TTF' 'LSANSI.TTF' 'LSANS.TTF'
'LTYPEBO.TTF' 'LTYPEB.TTF' 'LTYPEO.TTF' 'LTYPE.TTF' 'MAGNETOB.TTF' 'MAIAN.TTF'
'MATURASC.TTF' 'MISTRAL.TTF' 'MOD20.TTF' 'MSMINCHO.TTF' 'MTCORSVA.TTF'
'NIAGENG.TTF' 'NIAGSOL.TTF' 'OCRAEXT.TTF' 'OLDENGL.TTF' 'ONYX.TTF'
#'OUTLOOK.TTF' # MS Outlook has no use outside of Windows
'PALSCRI.TTF' 'PAPYRUS.TTF' 'PARCHM.TTF' 'PERBI___.TTF'
'PERB____.TTF' 'PERI____.TTF' 'PERTIBD.TTF' 'PERTILI.TTF' 'PER_____.TTF'
'PLAYBILL.TTF' 'POORICH.TTF' 'PRISTINA.TTF' 'RAGE.TTF' 'RAVIE.TTF' 'REFSAN.TTF'
'REFSPCL.TTF' 'ROCCB___.TTF' 'ROCC____.TTF' 'ROCKBI.TTF' 'ROCKB.TTF' 'ROCKEB.TTF'
'ROCKI.TTF' 'ROCK.TTF' 'SCHLBKBI.TTF' 'SCHLBKB.TTF' 'SCHLBKI.TTF' 'SCRIPTBL.TTF'
#'SEGOECHESS.TTF' # Segoe Chess won't render in X
'SHOWG.TTF' 'SNAP____.TTF' 'STENCIL.TTF' 'TCBI____.TTF' 'TCB_____.TTF'
'TCCB____.TTF' 'TCCEB.TTF' 'TCCM____.TTF' 'TCMI____.TTF' 'TCM_____.TTF'
'TEMPSITC.TTF' 'VINERITC.TTF' 'VIVALDII.TTF' 'VLADIMIR.TTF' 'WINGDNG2.TTF'
'WINGDNG3.TTF')

# Office 2007 fonts from the DVD that must be patched to use (even in Windows).
# '62e15117f7d314900949fe60b62c2e908c3921d0425cf26a9cf606d46ab96b16' #     arialn.ttf    Version 2.37 Arial Narrow
# 'dc7f1542fca0f52bdf53e24a49dbb6e9a733c6beeb5ccb27dd0215713d126233' #     arialnb.ttf   Version 2.37 Arial Narrow Bold
# 'aaeb7fef1dcc8a0a7c355da23c58bde97c6518a6e0792558edfa0c788ec9ae67' #     arialni.ttf   Version 2.37 Arial Narrow Italic
# 'a2aa71a058516435f4f1a389f403f14159ee629fa74eb333f0f7e3aff01b7c40' #     arialnbi.ttf  Version 2.37 Arial Narrow Bold Italic

# Office 2007 fonts we don't want.
# '3bd67d5982d259580a6d032f375c3b80e58c4496ffd8858b377dd69123809819' #     bssym7.ttf    Version 1.03 Bookshelf Symbol 7
# '1cc072157711f80296f3d013cec95093fc1be4e35a97406c46e76b14a97f41e1' #     outlook.ttf   Version 1.17 MS Outlook
# 'd35dcf41c1d5eb61146c17271b39e2f4f9526cdbf4bd480d9add7d9f15c92e3d' #    segoechess.ttf Version 1.00 Segoe Chess

# These Office XP fonts work but are not appropriate for an Office 2007 font package. Office 2007 Arial Narrow that work are available.
# '770370eaacd3b59045a8dc81e0d32f9af1883ef905a6914a9fa1e82af2fa9d96' #     arialn.ttf    Version 2.35 Arial Narrow
# '7983ebea91e631bd8ccaf36186dc47026732c93066be24254ccd3fc44d10331a' #     arialnb.ttf   Version 2.35 Arial Narrow Bold
# '1c249e859dbe70e8cdea5d794a3bad1f403462cd4d83c9bac370bbe00f23ef50' #     arialni.ttf   Version 2.35 Arial Narrow Italic
# 'c17d3c986d7ce69a07e37626885c7f97f0f8c32f856611415f0833fbbed2ca8d' #     arialnbi.ttf  Version 2.35 Arial Narrow Bold Italic

# Office 2007 fonts from the DVD with the patched Arial Narrow from Microsoft Update.
# These are the optimal fonts. Windows 8 fonts might be newer, but then you can just get the Windows 8 font package.
_fnt256sums=(
  '4fde694cc486b55266f7561c685fbd9153ea0003f0c0c39fc744b132051d40c5' #   1 agencyb.ttf   Version 1.01 Agency FB Bold
  'd672eb87a3787bdaf8f75df50f9ade864e2d5c9cdec5b07ce6de9d7d39433ea2' #   2 agencyr.ttf   Version 1.01 Agency FB
  'ceb1338d26ec7a1ca56cf4097bc1a9ff3a7837aba061cfded19e0b47af2e4b26' #   3 alger.ttf     Version 1.56 Algerian
  'bc546e3e96f8cdd9e6cf02eb5c8ac5551ef20ef4639ff701c338ea281f56fbd0' #   4 antquabi.ttf  Version 2.35 Book Antiqua Bold Italic
  '161b859efd20c69ddebb23012a49f4f2030d56a0c1b9bcfd4df753217ce3e358' #   5 arialnbi.ttf  Version 2.40 Arial Narrow Bold Italic
  '6c4a4b643461def5411e0217b74a625dcf2fb681252ef5da1db0af4eae80aa7e' #   6 arialnb.ttf   Version 2.40 Arial Narrow Bold
  'faf73aa7ce40b77ad19c09507a2263fe3f3ce9fa5642e8a1cd54fb3c9f52d599' #   7 arialni.ttf   Version 2.40 Arial Narrow Italic
  'cad552553cf2a75afca01955751aaa115e2a64fd6c6eea42e1fbd236630b7e0a' #   8 arialn.ttf    Version 2.40 Arial Narrow
  '134a9f8ecf618660305d7d34b6905375c1d5d7838ea15cdb2789ba94317f4117' #   9 antquab.ttf   Version 2.35 Book Antiqua Bold
  '6b00590bd7a52a94e9e90e35a28c1d2fa03f83f458d2f2dfbced70a9c1ea0c80' #  10 antquai.ttf   Version 2.35 Book Antiqua Italic
  'fe50313c37c2eca0bbf8cc3565b5ef32314753889afbe44cb275d65c3b58f0df' #  11 arialuni.ttf  Version 1.01 Arial Unicode MS
  'd9352e7d73711f006a27f44e71808a74fec109e2342e680e054c4458569f0a94' #  12 arlrdbd.ttf   Version 1.51 Arial Rounded MT Bold
  '529c972a6d5c1992c76e908255f655f98989b74b146058c90555af6d925a1715' #  13 baskvill.ttf  Version 1.51 Baskerville Old Face
  '0b5f05791ed5231432e302beed14f8dc4293e4df1c0993c72d6039c7ab0d08c7' #  14 bauhs93.ttf   Version 1.52 Bauhaus 93
  'dcc8d42eebbab6822f736a7b99e1c9d6ee6861b247a19049bb33e5955d991dde' #  15 bellb.ttf     Version 1.51 Bell MT Bold
  '17b6e7689e333fea42b19d817427cecf95b86a340bb0af5babba3ab25e6a1b40' #  16 belli.ttf     Version 1.51 Bell MT Italic
  '986a5b8bb70238e3c896e3113ef581df26204131f72d59fc12d2deef7ef89e4c' #  17 bell.ttf      Version 1.51 Bell MT
  '8715897a451aa9e37353b6cce5f5f3d853ecbe97de87756838704eff47c8ce86' #  18 bernhc.ttf    Version 1.51 Bernard MT Condensed
  'c019f155a0004760f32079c22c29ef0ddd223d0c2c79e2487122e66d38a53b32' #  19 bkant.ttf     Version 2.35 Book Antiqua
  '9729e2ae73b15871db606a18a48b8674ce2bae35d76a511d3510c4a9db2385ef' #  20 bod_bi.ttf    Version 2.10 Bodoni MT Bold Italic
  '29854f6597ca7b46db601c7a2eb28c13e31ee0541c7a5a499581fdee8da1b1d5' #  21 bod_blai.ttf  Version 2.10 Bodoni MT Black Italic
  '63261985fc00d6db2dda4f22da039c70f3c4c90aa0f087fc1b7a8c9856f2b551' #  22 bod_blar.ttf  Version 2.10 Bodoni MT Black
  '051b0031db491fa893feddd485b917b24a9d12f15a1e99e782c2420da0a3ffb5' #  23 bod_b.ttf     Version 2.10 Bodoni MT Bold
  '24fd78549262987502d83ea0bce5b47a3a0ac85c3941921b241a73fca08dd012' #  24 bod_cbi.ttf   Version 2.10 Bodoni MT Condensed Bold Italic
  'f307de012e77219a25ef59ada33820a3e33f6865c911acdd97440c15058713fd' #  25 bod_cb.ttf    Version 2.10 Bodoni MT Condensed Bold
  '37194e3c2d5b000443d23dc324b1367cbe2be40f28c2a6c693e6051210432ca3' #  26 bod_ci.ttf    Version 2.10 Bodoni MT Condensed Italic
  '0f1f746f293e547f8189783c49aee22a8b839698f7493b5915cc5b432c65d843' #  27 bod_cr.ttf    Version 2.10 Bodoni MT Condensed
  '960458b4c0851b8b9f1d047fe50f7fa01ddfbecaec692521d262660882e9596a' #  28 bod_i.ttf     Version 2.10 Bodoni MT Italic
  'd0efcbb58042808781f33898dc0fbe5342da22d813415a4dcb394872b1d19afa' #  29 bod_pstc.ttf  Version 2.10 Bodoni MT Poster Compressed
  '17b06990413ab318b9e9f2c05d3816059f56d7a678f4712849a3318a9e5e7c7a' #  30 bod_r.ttf     Version 2.10 Bodoni MT
  '2de5e34daf966be8e165bd5604ac0714a7946ea2a0a08f86ff04e687ed54d8d7' #  31 bookosbi.ttf  Version 2.35 Bookman Old Style Bold Italic
  'ec95c7380ab7f92ebc75bba6c56a80646fcb450ef6cccc631852a8b97be75c55' #  32 bookosb.ttf   Version 2.35 Bookman Old Style Bold
  'ec990c65df2ba6ead654bcb69f7f88bb76910b029f2edf663710cae3fde5f7dd' #  33 bookosi.ttf   Version 2.36 Bookman Old Style Italic
  '8f2df7dbc1f2b790f6e6fdd24dbb6c2a96b6e554ba2031c3ab0fe34d322a1b3e' #  34 bookos.ttf    Version 2.35 Bookman Old Style
  '1f7ad9e753a88da096121bd831a7df72868ac48b8edefc8c96c7a73303f1575d' #  35 bradhitc.ttf  Version 1.05 Bradley Hand ITC
  '1aa27a3e349a8c8daf466e0f89e94b0dc5b9cbe82e0d7a77e04d3dd6e1588e3d' #  36 britanic.ttf  Version 1.51 Britannic Bold
  'ad7d00c413fe11ec423ff5e2b63da7d403049ab3babf13d0b2ab34a43f4d4a55' #  37 brlnsb.ttf    Version 1.00 Berlin Sans FB Bold
  '4c50d832f4e1401e226566159735dae932dd224d795ac57772061096117e4147' #  38 brlnsdb.ttf   Version 1.00 Berlin Sans FB Demi Bold
  '0b6044c72e67aaae9c2ae3c8b4bb06d066fdbc02779c68e3883984acbbe24cb8' #  39 brlnsr.ttf    Version 1.00 Berlin Sans FB
  'a252b1e5d460f1e0e4781146186393e5b217ab379db237c7bcb8d7c353943edc' #  40 broadw.ttf    Version 1.55 Broadway
  'b77d119749b51c7ae5242dd093360d5b1c94117469e578cfdd2de03fdc55eda5' #  41 brushsci.ttf  Version 1.52 Brush Script MT Italic
  '9e23cba751cdd44dd7466e019b38d29360cee1aca62bd4b75dfc5cca93ea4b7a' #  42 califb.ttf    Version 1.00 Californian FB Bold
  '56b5168f5b847ce0f3280076d6c0ed026681ce3c5141629f5d8eba92dd1fcccc' #  43 califi.ttf    Version 1.00 Californian FB Italic
  'a779c135081030298594ea50fcdf59bcf5cd341008137931e2fd0e68d4ca65d6' #  44 califr.ttf    Version 1.00 Californian FB
  '9b9e45f016b013d92c3caf1985db22f85e39c8b1f208636f9ac21f9c135239ce' #  45 calistbi.ttf  Version 1.62 Calisto MT Bold Italic
  '1b3949401e310a5967a4c108bb9be49e28e69f73095ad088f783035e8f22d28f' #  46 calistb.ttf   Version 1.62 Calisto MT Bold
  'c7f699a3f94e57187ed36f1acebfe3e0460615ba368d14ed0aab45272844c1d5' #  47 calisti.ttf   Version 1.62 Calisto MT Italic
  'f976b470e19fde1971824107182927472cf67a08acc42f8e2f23951312863a8c' #  48 calist.ttf    Version 1.62 Calisto MT
  '5d5db8ae79e77adca68e52454088f3a456f363acc9f577cc6dd08b18fa996bda' #  49 castelar.ttf  Version 1.55 Castellar
  '8209f9295b20a9c3d0f7e5163d7ef9946353e653c40f25e7ef9f905856ec246a' #  50 censcbk.ttf   Version 2.35 Century Schoolbook
  '1d9fec6f9b2b72203ea56a4c7e3b40499984829ff99ae8ae53340fd8d5f07fcb' #  51 centaur.ttf   Version 1.55 Centaur
  '21be61ff5289c2125dbb48e2a739fd4dd98c3e58b37abfc22cc0412dd8376d95' #  52 century.ttf   Version 1.20 Century
  '64327ea7bccc5583396d6796cbc535d27c0389906a36312e5811d9ec535c6a03' #  53 chiller.ttf   Version 1.05 Chiller
  '7da22b3012c6071b7756f6d077ada0cbef49d66dccb7667ab74c97b3748675d5' #  54 colonna.ttf   Version 1.51 Colonna MT
  '0518e37fd63c8b97d63a6ce678eaca254f0677ab94d420e99860772ecf348636' #  55 coopbl.ttf    Version 1.51 Cooper Black
  'f354b9e48583dd9cb2a60dcd79eaa787722396d768aac0608d2ac0751d35bc3c' #  56 coprgtb.ttf   Version 1.51 Copperplate Gothic Bold
  '607520e814ebd77845cfb7824d0afd47ffff9ea4f335c8f2db356d3c6396a99d' #  57 coprgtl.ttf   Version 1.51 Copperplate Gothic Light
  'caf7d153d2860f395f846db58032173c3f76b57f9368ec08382f728742cf5a5d' #  58 curlz___.ttf  Version 1.02 Curlz MT
  'f9ff23ecb4dd03c511e5462d0b3563b733d4a924579d41c1df8fcb68d647d2d9' #  59 elephnti.ttf  Version 1.51 Elephant Italic
  '327ee1da1a144b1bd7970a8715daf00159ee1d0a9a81aeb33dcbf02631ed56e7' #  60 elephnt.ttf   Version 1.51 Elephant
  '944dd47cc65586f54d83ed55d654c82b179111b2651e6e1d575c2f4bda55085c' #  61 engr.ttf      Version 1.60 Engravers MT
  '88d1a747cec854b6efd25a2721f250c5623f61a818a6ea5e219408485fc9a3bb' #  62 erasbd.ttf    Version 1.01 Eras Bold ITC
  '9633185651dbec620c26f03e96e8d604a743c93d85e2b51e2f57c795a86cd642' #  63 erasdemi.ttf  Version 1.01 Eras Demi ITC
  'd432c14b62c70f4777f9db5901063b76d8db88b27aca46a5fb5b4a4c552c5c3a' #  64 eraslght.ttf  Version 1.01 Eras Light ITC
  '856137000a507908e4c289410917db83d19da88f6050af71675211ba68e9e0b3' #  65 erasmd.ttf    Version 1.01 Eras Medium ITC
  '662ac854d07237d7d6a2e1c0efba28c6166002ae8cbe0df0f58c43f65b21c54d' #  66 felixti.ttf   Version 1.51 Felix Titling
  '7407f0814d04a4cc45127933df1d6ffab5c90e5e888d33a7279cd82c36426b30' #  67 forte.ttf     Version 1.60 Forte
  '2fc6ff3c5253dca997c68d592e8cfa066b516a782d4b2747acf297c6523f9306' #  68 frabkit.ttf   Version 2.01 Franklin Gothic Book Italic
  '9ad3d0e5ef31c4a9a98cb0e169e4e625286aa34c712add3e001c0100138730d4' #  69 frabk.ttf     Version 2.01 Franklin Gothic Book
  '4ab0f4d87991cbda91a625369e2804c4fb88969cdb1e4bd83b6bf37d07cf9cfd' #  70 fradmcn.ttf   Version 2.00 Franklin Gothic Demi Cond
  '478e980ecfb423400516403cf49587f5b2e6a6dfc2c41cffcc51c109adc24ee7' #  71 fradmit.ttf   Version 2.00 Franklin Gothic Demi Italic
  'cfd1bb2c9b0e8b624952288acf9bdadaa64e52bc846e4720e2f0653359e5b8c5' #  72 fradm.ttf     Version 2.00 Franklin Gothic Demi
  'ac70b60f163536b2c0e2e2752262a6f8d1db6af43da73d5caab855d369f1da13' #  73 frahvit.ttf   Version 2.00 Franklin Gothic Heavy Italic
  'd1a3a6e5937c5923d4138c1f622145f577ae2f97c7f2d0e899ecec4d0412b839' #  74 frahv.ttf     Version 2.00 Franklin Gothic Heavy
  '1861e0824e53ca60a04ea1bc7bdb159131448fec711ed079ebccbf645dd345d1' #  75 framdcn.ttf   Version 2.00 Franklin Gothic Medium Cond
  '2e131823861483b966f87ca23063ba6f3c0cecf9ac5d785d71ed1710dab477d5' #  76 freescpt.ttf  Version 1.05 Freestyle Script
  'ddeda8f737249e8a2ac17f3e0757525e20631375cbb8b78d99b1462a146cef47' #  77 frscript.ttf  Version 1.02 French Script MT
  '4feeeac17a284f6f45fc66bd28da141e6bd904f291290c1214d25d06e7c542bd' #  78 ftltlt.ttf    Version 1.51 Footlight MT Light
  '76487d4b739ffea6d64f86d0e6a19a8d0031dc67ba2fa2518bbc1818351543ff' #  79 garabd.ttf    Version 2.40 Garamond Bold
  '9cda64dabb9b2aef5a810fe7ed231ca34c4cf42ae5a108c368ab6a21af2c4ccf' #  80 garait.ttf    Version 2.40 Garamond Italic
  '6204f2ace1a6c196b95b079f10ded04af8f431ce8eb2cf3945acc89b594c3728' #  81 gara.ttf      Version 2.40 Garamond
  'cf70b1cf7b70913c7f2288f037fe376e159d9e35f0619a2b412e88d7f3f5ce3a' #  82 gigi.ttf      Version 1.05 Gigi
  'e79f9c1768515a1844bd889092ecebf5c40f301e4415ad1238a8e2f09ce8543e' #  83 gilbi___.ttf  Version 1.65 Gill Sans MT Bold Italic
  'c95e47d509eada17f78d730010a5bbb69f60a940c17df6e4e7354c62262c1ab8' #  84 gilb____.ttf  Version 1.65 Gill Sans MT Bold
  '3216f7d3a15d3107a457b93b5537784108c3237b3fb2d16494d8ecee0a22cbd4' #  85 gilc____.ttf  Version 1.65 Gill Sans MT Condensed
  '5b81f2b18d3b19baa4cf151cd6eb6c49f8e0e58194fd0a02995cccdec803448e' #  86 gili____.ttf  Version 1.65 Gill Sans MT Italic
  '9c96a89a866bcc0b36d1d80f61ebb6ba9251cf9708e0060ac94546be57dbd881' #  87 gillubcd.ttf  Version 1.65 Gill Sans Ultra Bold Condensed
  'a74b5e4489bb98a96ff5f727bf33dd922703d0f3069f4ce95aa2c5d7f92d2253' #  88 gilsanub.ttf  Version 1.65 Gill Sans Ultra Bold
  'f6664b244192ab4cf3a58bb6a653700d1f345d03bb8879888bcea1b6f8f3f97c' #  89 gil_____.ttf  Version 1.65 Gill Sans MT
  '962ebe317bfba70511c4f04ceb3a7160def7e3ce8cfcb035fddce7ef202ff9b4' #  90 glecb.ttf     Version 1.51 Gloucester MT Extra Condensed
  'f44727cfdef37b028ea00283fee7ffa09b821ce2bbbfa28d518ec48976468ea5' #  91 glsnecb.ttf   Version 1.65 Gill Sans MT Ext Condensed Bold
  '2dc5949d57d2e172601fb6f5093c1fbf15a463e29ed47c4c8ff2434baf1c2b19' #  92 gothicbi.ttf  Version 2.35 Century Gothic Bold Italic
  '90cb613b492874a560c0ff18a3402b1d24fb7e846dff11295d5c4644d6c75e83' #  93 gothicb.ttf   Version 2.35 Century Gothic Bold
  '6cf57be6f9d0bd60bd5dc6eee7c11e87e5b19df210156495a524b974185b9fb9' #  94 gothici.ttf   Version 2.35 Century Gothic Italic
  '3a9cbb5d75b2a2b0d22dc94571608e4e9dc7b88e825374985880c5722c1c9e5f' #  95 gothic.ttf    Version 2.35 Century Gothic
  'f3cd0e13e4a0ed77522b1ab29061da6658f449d1d89b56751cdcdeed86da47e2' #  96 goudosb.ttf   Version 1.51 Goudy Old Style Bold
  '71d2d85781689de6326a229aeba2d143a5b3e8a4f0fc93b75af197fb63bf05bd' #  97 goudosi.ttf   Version 1.51 Goudy Old Style Italic
  '380e2cd97160e14042cea52ff785ca92d966e29f873cf2b93e1746f3a582ec74' #  98 goudos.ttf    Version 1.51 Goudy Old Style
  'ab475061e2479350a315bf3f72d65ae9acc37bebef4cf8df979f8f6ced659216' #  99 goudysto.ttf  Version 1.80 Goudy Stout
  'bcd38770fd6a7ee06aefd84775d741d007e538dd7ac8e27d9bb4bff85232ea5a' # 100 harlowsi.ttf  Version 1.65 Harlow Solid Italic
  'f482f5760773767d798c64f470c08c140588e7b07510094497e7a89c3f2f319d' # 101 harngton.ttf  Version 1.51 Harrington
  '40e898e471fa4de3ca09a6dfed961d00d6395af20fe6cf1c6b83c795bea04543' # 102 hatten.ttf    Version 2.30 Haettenschweiler
  '8f7699a0fd02de79d565fbd5205be070b777b790f028c1fd7e6090e34ed81bda' # 103 htowerti.ttf  Version 1.00 High Tower Text Italic
  'd5ed7dbd872ae77e6e30cada5287dbaa1ba755f962d0672c5ed14bea08f08422' # 104 htowert.ttf   Version 1.00 High Tower Text
  '9db1f3315d5c18572381f3880bd2c171fa1f49a1cd6e5f5f8d97cc1317911f06' # 105 imprisha.ttf  Version 1.51 Imprint MT Shadow
  'ee066d11d2933638a5d00c242a24f2c9b8bd68bd3ddb3b334123f8efcd539f03' # 106 infroman.ttf  Version 1.05 Informal Roman
  '2934319d3c6ba08a4477a3dc4f08695d4b926fc81a316f7a278e780ab5c9609d' # 107 itcblkad.ttf  Version 1.05 Blackadder ITC
  '60c4f425563b12a6c0223d5c65212fffb42f4b3d84789084aae44c42f3416865' # 108 itcedscr.ttf  Version 1.05 Edwardian Script ITC
  'a298c30e23beb222a016afa24d4d8f389f30ac3b8be6763f9f94199c3b11ff0a' # 109 itckrist.ttf  Version 1.05 Kristen ITC
  'd0d2d8efdbf07df506c87f9cadcd5052a6e446c99570177b1f98555661c6937c' # 110 jokerman.ttf  Version 1.05 Jokerman
  'efef0fa6138c648f9b5694f11d3372cf2733ae6126c91dbc7b2327c00546a699' # 111 juice___.ttf  Version 1.05 Juice ITC
  '8a9783e50f3bf892d958b7e61990d6ccaee65daaa0ffc246d3e1bd4fb0104b41' # 112 kunstler.ttf  Version 1.05 Kunstler Script
  'd64b9e6668069915ae217548b010be1b52be99bc923e88e148a83619b0102868' # 113 latinwd.ttf   Version 1.51 Wide Latin
  'b2d15815ce8f722e22885e67562a66f512f6412399d9400ac01fecd718d54839' # 114 lbritedi.ttf  Version 1.67 Lucida Bright Demibold Italic
  '8012eb0ec90ab1b7a40eec8987927d5764055e332bdb19ab5eeb3c1cf67987c8' # 115 lbrited.ttf   Version 1.67 Lucida Bright Demibold
  'd347d9ae8a42c63ed7dc15bba992d00ee9e606e0ac499a8022757c275855f612' # 116 lbritei.ttf   Version 1.67 Lucida Bright Italic
  '736eb3bdc990636d283384cf6428b03a6632ae16e81dc72cd28aecd0cdadb017' # 117 lbrite.ttf    Version 1.67 Lucida Bright
  '5c7e6c59e09c38c4e280504741bcfc051c95a9c931b3c92c03b7f2733f580622' # 118 lcallig.ttf   Version 1.67 Lucida Calligraphy Italic
  'fd16af41073406530c7633bbf6976c1aecac1f4bc9d1882135cf58ec9b31dd07' # 119 lfaxdi.ttf    Version 1.67 Lucida Fax Demibold Italic
  '1a8dd16d0d1456923c5d3824943771e63eb67e6b8660e5c1c479674fbbba163d' # 120 lfaxd.ttf     Version 1.67 Lucida Fax Demibold
  '27899b1624a2c13245cbfd28666090e3fe9ca17ecba4cd6e19a615892f6c6db5' # 121 lfaxi.ttf     Version 1.67 Lucida Fax Italic
  '25b23e0e8ba977da78fd0f6c13b76e561756010a73cb5a8187dd817496e25fec' # 122 lfax.ttf      Version 1.67 Lucida Fax Regular
  'c5ab997a1c3e49cb0d34fa5a3f2c39934d39f2657dca224fcb3b480768676501' # 123 lhandw.ttf    Version 1.67 Lucida Handwriting Italic
  'eb2d865bdadbdd19dacd2aa6f1a0d4e93263b3dac13de536106286e809abc238' # 124 lsansdi.ttf   Version 1.67 Lucida Sans Demibold Italic
  '76160ce9cd774532131cf4902b810a2d02c94f225da238ff8c04e25875eb66c5' # 125 lsansd.ttf    Version 1.67 Lucida Sans Demibold Roman
  'ca117345d190cda8ad6c7a41af1d6d43c475d0fdc99c97b8d325986309597f7a' # 126 lsansi.ttf    Version 1.67 Lucida Sans Italic
  'eb3f949ba0f1368698e69396259e667d9fb913ebfde3c742d493aae5dd57141e' # 127 lsans.ttf     Version 1.67 Lucida Sans Regular
  '187f363e9c2e328409938b4413027fe8f0c55423913ba66ea66d3f0d7fd5c74e' # 128 ltypebo.ttf   Version 1.67 Lucida Sans Typewriter Bold Oblique
  '993b8ad78909d2b9d67ea0001112cac238fb65c6b31f6729fdb0b86c24e2b8ab' # 129 ltypeb.ttf    Version 1.67 Lucida Sans Typewriter Bold
  '980e0ce5a0f4c407e90c72a16da2a259b7fc2a0ea48d1faf048028b2735fa941' # 130 ltypeo.ttf    Version 1.67 Lucida Sans Typewriter Oblique
  'b700d1bc51a11c77ca7b119b0677a9cd4dc1e61fe43a7130bc2044cd7dc9b116' # 131 ltype.ttf     Version 1.67 Lucida Sans Typewriter Regular
  '455964b4a07af53205ed705e0f40778ff203f2c9e7c72a8bf2c4d7a3a834e895' # 132 magnetob.ttf  Version 1.00 Magneto Bold
  '8cd40ac425585ee56a4a98f19a1f646828cec1e9565b4a0bfab1d4ce9d7a81c3' # 133 maian.ttf     Version 1.76 Maiandra GD
  'e334bf287bdf4211fe5958c4926c8ad4ddd3f44f5fdcb2d9dcfa1394186d8132' # 134 maturasc.ttf  Version 1.51 Matura MT Script Capitals
  'a03a3a71113d44d7bfb98e9720264f72a05ba112e191fb78eb08d11a3f41e500' # 135 mistral.ttf   Version 2.10 Mistral
  'cd7c7867a456ceae560d825cbec1d95b3de8cb62b00ce513db6afc293f243218' # 136 mod20.ttf     Version 1.51 Modern No. 20
  '2456f205a1f62f915e1c04787f48c70ba7a62dc6c4a01e48b16e694cb75ca8b3' # 137 msmincho.ttf  Version 2.30 MS Mincho
  'a6f6dacb871be365ad93fe1aab09332f768cd2aa35fdfca8e0053a38f5a2662b' # 138 mtcorsva.ttf  Version 2.35 Monotype Corsiva
  'ece195c4b0d53ce4ebaed656341708180abfebdddadf219fb014a31e70410bde' # 139 niageng.ttf   Version 1.00 Niagara Engraved
  'ee5f2638432efa7ea6273625ae2fe5dfa3d393ad0b51f8f5fb0f3d3c5ae65f6f' # 140 niagsol.ttf   Version 1.00 Niagara Solid
  '2b058a75ff9336c703e48b618ef759906dc9e37712e27698f74aa3ec0b949346' # 141 ocraext.ttf   Version 1.80 OCR A Extended
  '1d9d8d06aec3de7b9abbcdac2381f457d9d606b54f05e9b0e0187bf8565a1104' # 142 oldengl.ttf   Version 1.55 Old English Text MT
  'baba81b90b5102d1e1807aed3a4f38ed8f3d0e45c2b12b27152d8101c4de21fb' # 143 onyx.ttf      Version 1.51 Onyx
  '13093d9642d540cb5efad5cad52ad703e11c0e1f5308bc23ff2cfd7737e7516c' # 144 palscri.ttf   Version 1.60 Palace Script MT
  '895fdea742cdccd53e8ce847a7d2d9c3ddbd7ebdbe0444e88246f0f9e4e2526d' # 145 papyrus.ttf   Version 1.11 Papyrus
  '5b4a73788f013c252eb5877a7974e5836eeffc1189dd7319a219080fcc908f80' # 146 parchm.ttf    Version 1.05 Parchment
  'f8346184d59314a919926dcfb60da96421781ab19c2e04c2f76f0f82ace8cee4' # 147 perbi___.ttf  Version 1.76 Perpetua Bold Italic
  '8eb139cdeff99c8297c95bf857d94def798116d02fdcf72cefb88d43fe7a33d4' # 148 perb____.ttf  Version 1.76 Perpetua Bold
  '2f52ec437a22912ec82c06afdde46c6b1c7593b44025c4627901d353a965b161' # 149 peri____.ttf  Version 1.76 Perpetua Italic
  '1024c55e896123dad43b1a15f0c86640556b01e9348eb797e6d7c5a889178d6b' # 150 pertibd.ttf   Version 1.76 Perpetua Titling MT Bold
  '5b90d215f586c91cbaceee9e96d8840431e6b4713909dd47ab70084a067d0b10' # 151 pertili.ttf   Version 1.76 Perpetua Titling MT Light
  'f8202c3426b5c54b192969351f15ea35288de44e811e9514d923898214b94184' # 152 per_____.ttf  Version 1.76 Perpetua
  '673e9f49ace279c73711dd778037b5d435790be236c9e5892609794b0bb4377f' # 153 playbill.ttf  Version 1.51 Playbill
  '1a98bbb22c3097e418a263ca80b63ac1264e8cbd03d5f0a7143bc598297a387b' # 154 poorich.ttf   Version 1.05 Poor Richard
  '4bd22f9cfa8255c17ef5734964bdcea39f0614c1975f9d495576a0110f5bf177' # 155 pristina.ttf  Version 1.05 Pristina
  '4e06cfa893f7e1e656709ac2cc240cf17cc82da9fb8df1afbf689940e47c0cfd' # 156 rage.ttf      Version 1.02 Rage Italic
  '7019d811b304287be2223f1667e0989f862951cbba660bde13a86bb103d97b80' # 157 ravie.ttf     Version 1.00 Ravie
  '26d345f357d8213475eff6459ccf2dbc9d707e2f8c0445540f3bb183f717c0f0' # 158 refsan.ttf    Version 2.00 MS Reference Sans Serif
  '0f9cd250887e38b99ff7111769d249daee8634c2c875f49c3599017bd2586aab' # 159 refspcl.ttf   Version 1.00 MS Reference Specialty
  'bda7c484b491bb10914d668300c6560621de1b091784010f2d4d239020b6e5be' # 160 roccb___.ttf  Version 1.65 Rockwell Condensed Bold
  '967465e783b62ce5fdfb10183753ddfa0ba6396036340fd3cc67f85187d57689' # 161 rocc____.ttf  Version 1.65 Rockwell Condensed
  'c8a0f6976209cc198bc47ee287fd872fd86690f4d2893057e7ee92dd1235fb5f' # 162 rockbi.ttf    Version 1.65 Rockwell Bold Italic
  'fc9fd442d2dcd719c88d42121d69f5dd9dda02cc1c8afa025d261ec28795468f' # 163 rockb.ttf     Version 1.65 Rockwell Bold
  '6c52077681d5d1831b9e8f6621deb82de960418d24fe39d8cdc88778fbb19e30' # 164 rockeb.ttf    Version 1.65 Rockwell Extra Bold
  '70af64a5bc061505e7a1cb1cd691811768a7cc84e53d48fcb526deb53f8c7a57' # 165 rocki.ttf     Version 1.65 Rockwell Italic
  '0c61e5ce8296a55761cdb9d350d4c990be4cda8890cc70f2abdedfc357f96d00' # 166 rock.ttf      Version 1.65 Rockwell
  '8decca6df27be6bb2bd15801dd9cde62502bf4fb20efd835038861455ffe763b' # 167 schlbkbi.ttf  Version 2.35 Century Schoolbook Bold Italic
  'a13c13a72c0aafc2be6baf52fd28b1745af6f0fd5fbd365499c7298f4ee416a1' # 168 schlbkb.ttf   Version 2.35 Century Schoolbook Bold
  '73ff30499a0c673440e6df6e134e0731e586112ab99a0553f7c4dbb28f84366a' # 169 schlbki.ttf   Version 2.35 Century Schoolbook Italic
  'ebd9ca7dc28fee37c942b4084f377711ba571da5fd7154125abf8f81c9628ce6' # 170 scriptbl.ttf  Version 1.02 Script MT Bold
  '80cd2486979c2c18f9dd59277c0fd800959afa1ce23820dcf7bce31f208647af' # 171 showg.ttf     Version 1.00 Showcard Gothic
  'b9e8a921cc54334132052f880fc1b8b236cb6f41b1cfa4618ea399014e6cea4d' # 172 snap____.ttf  Version 1.05 Snap ITC
  '5d53b38fa8ff33d15676cdcd78b261681bfda861c449b4f7ddfd7574a5c11e18' # 173 stencil.ttf   Version 1.52 Stencil
  '4fee7243ffb931f65713de0537a145f6aa1e7302c8398fea68c4864d41e7fd98' # 174 tcbi____.ttf  Version 1.02 Tw Cen MT Bold Italic
  '64df8ce11b656bdda3e35275b83dec7c40fc8a0a73d8a921918fb99b538f62d0' # 175 tcb_____.ttf  Version 1.02 Tw Cen MT Bold
  'b068cd471c07907a772b6f39a415d33d6328d32d1ea0032be9a717cb4b80b254' # 176 tccb____.ttf  Version 1.02 Tw Cen MT Condensed Bold
  '9e8a6af516706030b8536b2ea6535664cd9bea916fb15304556d8139a6945ff9' # 177 tcceb.ttf     Version 1.03 Tw Cen MT Condensed Extra Bold
  '73655bc3a86553ea1d76df8c8eed0e8d0daebc797aba885cde99833ffe9545dd' # 178 tccm____.ttf  Version 1.02 Tw Cen MT Condensed
  '3ffa539609563836dc5546f473f6e7a3b7e4c9f7ba5876522925a980ab87fd7f' # 179 tcmi____.ttf  Version 1.02 Tw Cen MT Italic
  '10df71cef84ae0d7031d7ffa072b185343365be0e59bec4ac231e7c77811584b' # 180 tcm_____.ttf  Version 1.02 Tw Cen MT
  '1b20b818be881cf16e711daf7e3c44be66a93b581bcd7b580a4423f18595fb35' # 181 tempsitc.ttf  Version 1.05 Tempus Sans ITC
  '2bbb4cafa0c5767155971e7bc578483478351a36e55d035450e50b468422a962' # 182 vineritc.ttf  Version 1.05 Viner Hand ITC
  '59e1a422a986daaa64659b7415db304fc6a04a10fdfe00eaf1a93577819d3bf8' # 183 vivaldii.ttf  Version 1.55 Vivaldi Italic
  'ede635464683ba465c949d7dd6894f9dff49a76229618cb0b73e0c85b93e4169' # 184 vladimir.ttf  Version 1.05 Vladimir Script
  'fa671b6fddedd57f158ab90b6aa6a7c33db6f41ab620db72b7ad1e57c38bda5f' # 185 wingdng2.ttf  Version 1.55 Wingdings 2
  'ac9ee085920a3d8b076d5e0c61dc9df42c4bac28d1fc968344f9ceddb3972f69' # 186 wingdng3.ttf  Version 1.55 Wingdings 3
)

# Office does not overwrite fonts already in Windows. For anyone copying from a
# running Windows we list the sums for as many OS as Office 2007 might be
# installed on.
_fnt256sumsx=(
# These are from a running Vista + Office 2007. It's a font free-for-all!
  '6644252484bd23330d160c634eb4fc2568fe43916f04139f743be0adb79025ed' #  70 framdcn.ttf   Version 1.00 Franklin Gothic Medium Cond
  '5108f0a3231fd6fdada25eb1f2f12494c28ec1c8c549176f2414de8ed4809f40' # 141 ocraext.ttf   Version 1.76 OCR A Extended
)

# Office 2007 fonts also provided by Windows 7
if [ "${_opt_IncludeWin7Fonts}" -ne 0 ]; then
  _fonts+=(
'CALIBRI.TTF' 'CALIBRIB.TTF' 'CALIBRII.TTF' 'CALIBRIZ.TTF' # In ttf-win7-fonts
'CAMBRIA.TTC' 'CAMBRIAB.TTF' 'CAMBRIAI.TTF' 'CAMBRIAZ.TTF' # In ttf-win7-fonts which has 2 additional light fonts.
'CANDARA.TTF' 'CANDARAB.TTF' 'CANDARAI.TTF' 'CANDARAZ.TTF' # In ttf-win7-fonts
'CONSOLA.TTF' 'CONSOLAB.TTF' 'CONSOLAI.TTF' 'CONSOLAZ.TTF' # In ttf-win7-fonts
'CONSTAN.TTF' 'CONSTANB.TTF' 'CONSTANI.TTF' 'CONSTANZ.TTF' # In ttf-win7-fonts
'CORBEL.TTF'  'CORBELB.TTF'  'CORBELI.TTF'  'CORBELZ.TTF'  # In ttf-win7-fonts
'SEGOEUI.TTF' 'SEGOEUIB.TTF' 'SEGOEUII.TTF' 'SEGOEUIZ.TTF' # In ttf-win7-fonts
)
  _fnt256sums+=(
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
  )

_fnt256sumsx+=(
# Fonts from an updated Windows 8.1 July 2015
  '8e68434fe031156f12ebb23b7b7baf921f7cd5505a7888d5541e28752fc46b63' # 187 calibri.ttf   Version 5.87 Calibri
  'ea73c9cf0271d364ad19753b4c806813f0079dbeb7f44625bff3ed6adaf21432' # 188 calibrib.ttf  Version 5.87 Calibri Bold
  'b8068d620e0df685eae8443ec5566331ce0cc0f50dc492491d1ebb387cb42ce5' # 189 calibrii.ttf  Version 5.87 Calibri Italic
  '0daec23661a84e019648797ae2ce26fdfc6ab7c88681d0e55e86763aa57eb5b9' # 190 calibriz.ttf  Version 5.87 Calibri Bold Italic
  '8a54e4c7cc8c4756cd97381fd431debc13b8356374d208d9a828b9de9ed59bf1' # 191 cambria.ttc   Version 6.83 Cambria; Cambria Math
  '6e17672ab5a4da801909cd4bf297a4708a82959384906d635070450dbaaaf1bb' # 192 cambriab.ttf  Version 6.83 Cambria Bold
  'cbe26a60c717f0334b9bdfc7c929232dd666ccfe107589140e40ce6d7a8db9f8' # 193 cambriai.ttf  Version 6.83 Cambria Italic
  'a62e765f7516ab9fba44e4a85d15ae7018b70dbc7feba5bed0c18c9061d375e4' # 194 cambriaz.ttf  Version 6.83 Cambria Bold Italic
  '167793b658a131bde7a856f998e7a6ab13c7364eb2d050f5285ceef9ef70d44a' # 199 consola.ttf   Version 5.34 Consolas
  '511d71a455c698ee74d78f03ca4747da53025f862faee1d5bede407285517a81' # 200 consolab.ttf  Version 5.34 Consolas Bold
  '09a343ad31be772eb1aee5cfd315828ac5dea9e7275b2456a75933c2d1461268' # 201 consolai.ttf  Version 5.34 Consolas Italic
  '62a8cb4c643b2e47bc877a70f274f4daac271a3f82f8c6aaa0894e4b26fb3f75' # 202 consolaz.ttf  Version 5.34 Consolas Bold Italic
  '5ba110b3e209f6d48cee35397bab77e12e52596a76136f1479324f444a15a360' # 211 segoeui.ttf   Version 5.35 Segoe UI
  'f0dc4efc48256e9e108a4a280e3257ab55f88e48288fa4914e5392bd5167db07' # 212 segoeuib.ttf  Version 5.35 Segoe UI Bold
  '97f9a129b2620069ba5b40a099b6736e23dc2edfe53e7d2feb37cb6e1599bcf1' # 213 segoeuii.ttf  Version 5.35 Segoe UI Italic
  'e380695146f43519c9c0e33c3527523c8c38f6b64ae5c5076d8ad9fab3e530a1' # 214 segoeuiz.ttf  Version 5.35 Segoe UI Bold Italic

# ttf-ms-win8 has Cambria+Math 6.82. It looks like an intermediate update that we'll probably never see again.

# Fonts from the Windows 8.1 DVD
  '6a543d56e7b27abab2b96911841077e92f93fb064f017c5afb65517602c4976d' # 187 calibri.ttf   Version 5.86 Calibri
  '55df7a17a256d5f9c258fbe0cfa326cefe0ceeb61c8d093fd0a9a84cd0b9db8e' # 188 calibrib.ttf  Version 5.86 Calibri Bold
  '4e090cdb6081a825b6afc93448b570ed706c6930038ac33875b4c1d939e9e0b1' # 189 calibrii.ttf  Version 5.86 Calibri Italic
  'a2e82be24951a54ec1c130dbb884aba5c572f982574c10e5ac712b0a55564c2d' # 190 calibriz.ttf  Version 5.86 Calibri Bold Italic
  'b422f9705b3e221137b5874a90fc00e5e2fb84a98d4090540f6fc7318c6b6e82' # 191 cambria.ttc   Version 6.81 Cambria; Cambria Math
  '5796a6cb3ff57f8f8a5cbef94ed9b780c16aa50d3c1cd20b8a31725ced12564f' # 192 cambriab.ttf  Version 6.81 Cambria Bold
  '24b1c53c1604d066326638327a47141508cdac05fd5f6e9d3b908082e14b318e' # 193 cambriai.ttf  Version 6.81 Cambria Italic
  '928cd5d1d35f61de0ee46e5adeddb09fe4c2647b62d9fbbc5fe40486503cc672' # 194 cambriaz.ttf  Version 6.81 Cambria Bold Italic
  '423504695a3de1f80c618e3e6ead215a6b891be06c179bf048bb5a80d5d0eda3' # 199 consola.ttf   Version 5.33 Consolas
  '73acf8f7f9d16c76829ee5ee801852cd54184a68ac513c1e339487685aa9b732' # 200 consolab.ttf  Version 5.33 Consolas Bold
  '219acde6b177d876ac1debfe03c7b951d6333b350044e1ec16bdd3312c63aee0' # 201 consolai.ttf  Version 5.33 Consolas Italic
  '0000adf3cc6f3f382b061f31277cdcb3787fb816d7251d8fdb57b33085eaab70' # 202 consolaz.ttf  Version 5.33 Consolas Bold Italic
  'cbe6c682f09b600d45f614be798a096c2a784c568020319e6168eec3f0619dc0' # 203 constan.ttf   Version 5.91 Constantia
  '2549919b208203a2dced66cb901e6ec433c5fa34f15f160932f7bcf695c2a4e9' # 211 segoeui.ttf   Version 5.32 Segoe UI
  '2b019e9868a2e2344c86f7e5e3ac58b5b70ea30d0c3f603cd74f3076318ebd10' # 212 segoeuib.ttf  Version 5.32 Segoe UI Bold

# Fonts from the Windows 8.0 DVD
  '6cc4055abce8101cfa3850031df0cc226341618d4361e23a7bc4d5f2ebb2807f' # 187 calibri.ttf   Version 5.72 Calibri
  '009a5e879d37d75e8922a2786e64e7ee197762111f45ac0564262aa1d8f6f81e' # 188 calibrib.ttf  Version 5.72 Calibri Bold
  'f09ea6e6c951fa17dd8b0ed4d68686c977eddfa616f5efc617efd0ad123c4cc9' # 189 calibrii.ttf  Version 5.72 Calibri Italic
  '9378bb36eb676530f5fdc94dc4fcc73d63a6ec6ebb7d5eebe131254d7c51d2d2' # 190 calibriz.ttf  Version 5.72 Calibri Bold Italic
  '9caea325613e6aa20f4142c134b3e61899fa2d92183bee0b09abf0f7be843ce4' # 191 cambria.ttc   Version 6.80 Cambria; Cambria Math
  '60fae0c802ca69688590a4c96e57abfd99042a8d576df1437b965d83b78ff049' # 192 cambriab.ttf  Version 6.80 Cambria Bold
  '4b93dd04e1748a3cbb125f885756c45adfb34daf45285043dadc9e901e46c4fd' # 193 cambriai.ttf  Version 6.80 Cambria Italic
  '951649d2bc24576f31c37eebf6abac5a24c2b50017595fbfb5b4eab4e473328c' # 194 cambriaz.ttf  Version 6.80 Cambria Bold Italic
  '2fb90b43b7583971b38df935e28c3250fc281cc84d2e807b216e2ef07b05f975' # 199 consola.ttf   Version 5.32 Consolas
  'd38458ec34f1568e66565cc260e35da1383023f6052f8cc0ca2a50a1cb9cdf63' # 200 consolab.ttf  Version 5.32 Consolas Bold
  'd0e2af3c6a783d2ea396a5486e5d16d74e2adfcd14a29c337c950b7b2b51c98c' # 201 consolai.ttf  Version 5.32 Consolas Italic
  'e790812a7ea5dd6255973a0a2456054a7ce1f549c28ff89da4727971decfa494' # 202 consolaz.ttf  Version 5.32 Consolas Bold Italic
  '13623a0ac051b0e08fa142a13cb6e5ef43d9d34c220efac7c210ff670a242925' # 211 segoeui.ttf   Version 5.28 Segoe UI
  'dac3156acb4136c47484e8e16b65b275b4109346c09e076fa72aad212cff337d' # 212 segoeuib.ttf  Version 5.27 Segoe UI Bold
  '7ab7d07b58d25ca037fff4df64ee7043e91c12cfff0716a9298c507a2648c422' # 213 segoeuii.ttf  Version 5.26 Segoe UI Italic
  'd756572d10ab716a53cb30e9a14631a64340e556d7a1c62f7f89ed526c37f899' # 214 segoeuiz.ttf  Version 5.26 Segoe UI Bold Italic

# Fonts from an updated Windows 7.
  '22fd74688605ec98e38dc39b32299655298cc54faba8e88461e783220c1f9261' # 187 calibri.ttf   Version 5.73 Calibri
  'b518f026be8d5a1c85bd32707a5ea946cfd3ace4a0a3fa39a2cb485e6803f334' # 188 calibrib.ttf  Version 5.73 Calibri Bold
  'fd65027a491504dd3e10c43d40e07a3c7cc142d6606ceea882694738989664a7' # 189 calibrii.ttf  Version 5.73 Calibri Italic
  'ed66ec4546db15af63a0a85c2253b616de422eae0ac3cd72232116a5e4e7ee41' # 190 calibriz.ttf  Version 5.73 Calibri Bold Italic
  'd675f6efa6f39c92585a0499901593c2df7a1b61cdb6bf4185e3833f83b0106e' # 191 cambria.ttc   Version 5.96 Cambria; Cambria Math
  '2613006fb72ac39d2629cc10dc4046191981bf3c0796addd4a728003271e018f' # 192 cambriab.ttf  Version 5.96 Cambria Bold
  '71e671f7048248bba725729cd5e5f3b1378950bbfc9e592ad15af71df0780607' # 193 cambriai.ttf  Version 5.96 Cambria Italic
  '2582aed03c3370a8fad2e9f93b4b4d30a0b1bafa61c51bf23b8d5f65a1ad53de' # 194 cambriaz.ttf  Version 5.96 Cambria Bold Italic
  'f4cc0c11780a2d94cd6b74ed54fa657f26677013028c956ecb40da81c6b59b9e' # 195 candara.ttf   Version 5.61 Candara
  'f959e0709a770094814199e49b0441b13e2bb075475b7ed2125ead7841ff2215' # 196 candarab.ttf  Version 5.61 Candara Bold
  'da786a0df49cd2f45a9a8dc67120ec534e4624bf168829947bb08c4f937c21ad' # 197 candarai.ttf  Version 5.61 Candara Italic
  'c2017a26bbd51775376baa93ba63095ba90a955c0eb93bbe44b9e73e0958fd73' # 198 candaraz.ttf  Version 5.61 Candara Bold Italic
  '45c14a49e0ba2edc00b72afad9a930cad5c1b9a93323b239a8c308efc5a65e8e' # 199 consola.ttf   Version 5.22 Consolas
  '5c27a540c51a0e60b2caa4e9f6c9164fde89a9fdc560747bfa1658f6e556cf61' # 200 consolab.ttf  Version 5.22 Consolas Bold
  '18db132c539323badaf0e1c9ceffa497e1996946a8faac26cc5fbe6fc8233314' # 201 consolai.ttf  Version 5.22 Consolas Italic
  'fc9e9f0b6ae6d068b01e1511e475b508e15799529f53679f1e927f5418040c3f' # 202 consolaz.ttf  Version 5.22 Consolas Bold Italic
  '28401ef53647e4e68f2c2bda54856fe90d9afb1cf4072bf4ea9cf6b380c09d4c' # 203 constan.ttf   Version 5.90 Constantia
  '11a7a1c6b1b4028cd7e55f60a9773ecc7d39b66b8f82f5b7c6fbf8a4fdfcf94e' # 204 constanb.ttf  Version 5.90 Constantia Bold
  'be0306e2040aeeed8bf228524071f4b941d28cbdd3ff413a9db07d1da9213ec9' # 205 constani.ttf  Version 5.90 Constantia Italic
  '6bf361ae27d2f67e05d9ad0fa6e0bc4e16c2ada6926d6c24b557e2547f4f242e' # 206 constanz.ttf  Version 5.90 Constantia Bold Italic
  '83f5b36107f7ea50fd5c52b1c3e8d64de3edc5d0f2c2e2e9f634fbbcfd7abd74' # 207 corbel.ttf    Version 5.61 Corbel
  '2d3fb4d471e9669a5ab2bc8aa9b359639e17af321510f3b878bae03bc259b056' # 208 corbelb.ttf   Version 5.61 Corbel Bold
  '7e9cd651666dce6dd3ad37b8199c7798b226b8995d35e6b672b53ce0bbec59cb' # 209 corbeli.ttf   Version 5.61 Corbel Italic
  '9c68522951940ad49354f4fce56b528414a7e83c44474ceea0582a5434693066' # 210 corbelz.ttf   Version 5.61 Corbel Bold Italic
  '4217e96cf586f27ca5dc7e5a2e45826340f6af0f91bdbd2ffc4a694724591736' # 211 segoeui.ttf   Version 5.11 Segoe UI
  '65ceeab23f1bec915558cecb189accdd637d5036e9f7afb635ffef0b1dfa08b3' # 212 segoeuib.ttf  Version 5.11 Segoe UI Bold
  '42ba0659e5b9349fcf0ff299a3a69e5d3ff9b161a18ce41817dd217aeb5bba1e' # 213 segoeuii.ttf  Version 5.11 Segoe UI Italic
  '6c9700922e14f899cf732eded07afa4e5b8e640c762408f96eba76efb88d4989' # 214 segoeuiz.ttf  Version 5.11 Segoe UI Bold Italic

# Fonts from the Windows 7.1 DVD
  '436cb479a8f9eff517016868323bdfbca1a053bba4cc55c8753859b64d041c5c' # 187 calibri.ttf   Version 5.62 Calibri
  'ce7dd6ba37e7b8dff865b6ce334ef773b9ad86d8a9d495c309ced108856bed54' # 188 calibrib.ttf  Version 5.62 Calibri Bold
  'd9f13268dca6e828cb9ed5827dc99d188cf0d7c55349f92802fd6532926bdfbf' # 189 calibrii.ttf  Version 5.62 Calibri Italic
  'b5e3f6b9fcdf4b3a89ed182d4ade810d45cfef17f57b4bbc5cd6be1e83de40ab' # 190 calibriz.ttf  Version 5.62 Calibri Bold Italic
  '38be0d2b58bbd3249f5af9bbe1fa0b38fee587441ab0c1850d1dda1c0766a8c1' # 211 segoeui.ttf   Version 5.01 Segoe UI
  '9878074a1a534929577a388ccef39c852328c692fdd9ca3fef45eb000fe5f591' # 212 segoeuib.ttf  Version 5.01 Segoe UI Bold
  '0d6d0871bdca199fd3e4a8044f710b20357f09d6d14c15b50a12cf0d9aa41fc7' # 213 segoeuii.ttf  Version 5.01 Segoe UI Italic
  'a2658365f60e92a9ee5d3589bd8ed2f5fad222f091a3937c14cab4fb26701d29' # 214 segoeuiz.ttf  Version 5.01 Segoe UI Bold Italic

# Fonts from the Windows 7.0 DVD
  'ba3bef63a5f397f893b27d3e5be020b966bf96b5ed9064241a24805c288ea79e' # 191 cambria.ttc   Version 5.93 Cambria; Cambria Math
  '85377e39b6987b338795ecd08b18ca5077867585cd18c431438854374441e952' # 192 cambriab.ttf  Version 5.90 Cambria Bold
  '6ca040031a8387ad3a7fb815f896fdbd21fa181ad6fe19e5a193a72bf6a7d396' # 193 cambriai.ttf  Version 5.90 Cambria Italic
  '9cbc78f6fe5ffec33ca9240e64f48ae2c5b158cfacb0a1f6a40521e8d06045b6' # 194 cambriaz.ttf  Version 5.90 Cambria Bold Italic

# Copying from Office2007 on Vista will get you these fonts from the Vista DVD.
# It appears that Vista didn't have the multifarious font versions that Windows 7 and 8 do.
  '41b9212abf5fac93dfda4ac485bd72a01ade998eefb12dca6f2a97d884624975' # 187 calibri.ttf   Version 5.00 Calibri
  'aaedcd4eec7529d3131a6475665260ab31bf7a18dd903a983167b65d00197614' # 188 calibrib.ttf  Version 5.00 Calibri Bold
  '294924218fa4cc98bc53cf94d4e25d243a59385f9648b7fe4102f4ae399c0e3d' # 189 calibrii.ttf  Version 5.00 Calibri Italic
  '035fb934945f76f7fe0e39a6051b985697011cd75553d2e260a8a93b32feaf1a' # 190 calibriz.ttf  Version 5.00 Calibri Bold Italic
  'eb46e5cedb7fa508ab5ee15e6d1bd1cb309cc3fcf4f9e1c9b54f687d5dca1f51' # 191 cambria.ttc   Version 5.00 Cambria; Cambria Math
  '565942a8d45e1051570e69635e9fe1fed13f6c0f15ea970c5613a4c67089aeea' # 192 cambriab.ttf  Version 5.00 Cambria Bold
  '1f3c9d2aefa65a763fbbb31f75e02e199462084330b8d5c3ec2d676852315088' # 193 cambriai.ttf  Version 5.00 Cambria Italic
  'b0f0e47c533bca16dc9f3833b36366b08da7afd7bbd1a216bb123d42d96975aa' # 194 cambriaz.ttf  Version 5.00 Cambria Bold Italic
  '1a0560e2f6f319708d3aa6b13e16a19d44806e7fee9f92915d1d8b81aa04a3c6' # 195 candara.ttf   Version 5.00 Candara
  '14833fcb7e251b33891a478e4da4374a74b8bbf4feefeb9437ac49f0638a3ec0' # 196 candarab.ttf  Version 5.00 Candara Bold
  '0c03edba34cea34727bb4e63ec739872c17c7d5e0fdfa94ad1599c80ba7f16a9' # 197 candarai.ttf  Version 5.00 Candara Italic
  '34e04a904656736d9dda588bcd55b46e193cf28277e44ede373c65ed568b8c65' # 198 candaraz.ttf  Version 5.00 Candara Bold Italic
  '2a65227ee5b4eaa896bec8a150d90d770ea4f2f59a2ef240eb6ae614951d3d77' # 199 consola.ttf   Version 5.00 Consolas
  '321298ddbc374e4b3b7e7f1ed27eda8f9bd4c6d4fc2d140e307cae5ac9458bea' # 200 consolab.ttf  Version 5.00 Consolas Bold
  '8f5256134cd1d931038f9fd54c99f311eca41e2e54515a25eda02a6aa5cd5705' # 201 consolai.ttf  Version 5.00 Consolas Italic
  'ea09e71bad202dc0caf0454a833224f8d179aa7a2ad71f82ba3d9677e3e05537' # 202 consolaz.ttf  Version 5.00 Consolas Bold Italic
  '2185f7700506b7cfde4be8059fac20ef5244d5d25f19088bc19621a0c59a2270' # 203 constan.ttf   Version 5.00 Constantia
  '09c7502bcf1d2ce44cc8c91ac43bdedd5aca3fe3d63e461d0d35ceefcb20c41c' # 204 constanb.ttf  Version 5.00 Constantia Bold
  '4907640d1740bff9c1a762ff77c9b1580b791470936b48476bb2e9b95541a5b0' # 205 constani.ttf  Version 5.00 Constantia Italic
  'ac9e6a593ec9203bab7fab049fb368449b08a2254bd11672c2a0b2dc598d173a' # 206 constanz.ttf  Version 5.00 Constantia Bold Italic
  'b03a46f4398072814d5e8b709a493daafa05018c4433822933619837f252c58b' # 207 corbel.ttf    Version 5.00 Corbel
  '43564821511736cd2b27eb1b20cecaeffee0bf689b15a26e04bb250b0ef4b7bd' # 208 corbelb.ttf   Version 5.00 Corbel Bold
  '98923ef251e52d1f3f40a53e720a6239e7e423285e04335ec6eeee901121e09a' # 209 corbeli.ttf   Version 5.00 Corbel Italic
  'ca68aeec2e31945adca55f66abe81003a8545a19f21e070c36e6878a305e873d' # 210 corbelz.ttf   Version 5.00 Corbel Bold Italic
  'f0ba8bd5350f7f552965b0d6a8cd831131eb115224b42835b341dc971f30bf33' # 211 segoeui.ttf   Version 5.00 Segoe UI
  'd9558e4be46ec9bf31d150f5d170ce046c0b0d987b993ef8cbc7445f964ab6b3' # 212 segoeuib.ttf  Version 5.00 Segoe UI Bold
  'b29122a5bddf449f154f2fdb237d27f4b3c736144f7df0321bf7b6f2620ab5c2' # 213 segoeuii.ttf  Version 5.00 Segoe UI Italic
  '6675cd17be1bf753b11aa53ad64629e5b27d4cec7fb2b7099fe2f5e5cd0841d4' # 214 segoeuiz.ttf  Version 5.00 Segoe UI Bold Italic
)
fi

if [ "${_opt_Optimal}" -ne 0 ]; then
  _fnt256sumsx=('x') # The main array has the optimal fonts
fi

# A list is easier than figuring out how to get Font::TTF:Ttc to get us the names and versions of a TTC.
# for _fnt in {batang,gulim}.ttc; do strings "${_fnt}" | grep -i "Copyright HanYang I&C Co.,LTD. 2000"; done
# for _fnt in {cambria,meiryo,meiryob}.ttc; do strings "${_fnt}" | grep -i "All Rights Reserved"; done
# for _fnt in {mingliu,mingliub}.ttc; do strings "${_fnt}" | grep -i "Copyright DynaComware Corp. 2008"; done
# for _fnt in simsun.ttc; do strings "${_fnt}" | grep -i "Copyright ZHONGYI Electronic Co. 2001"; done
declare -gA _ttc_names
_ttc_names['cambria.ttc']='Cambria; Cambria Math'
_ttc_names['batang.ttc']='Batang; BatangChe; Gungsuh; GungsuhChe'
_ttc_names['gulim.ttc']='Gulim; GulimChe; Dotum; DotumChe'
_ttc_names['meiryo.ttc']='Meiryo; Meiryo Italic; Meiryo UI; Meiryo UI Italic'
_ttc_names['meiryob.ttc']='Meiryo Bold; Meiryo Bold Italic; Meiryo UI Bold; Meiryo UI Bold Italic'
_ttc_names['mingliu.ttc']='MingLiU; PMingLiU; MingLiU_HKSCS'
_ttc_names['mingliub.ttc']='MingLiU-ExtB; PMingLiU-ExtB; MingLiU_HKSCS-ExtB'
_ttc_names['msgothic.ttc']='MS Gothic; MS PGothic; MS UI Gothic'
_ttc_names['msmincho.ttc']='MS Mincho; MS PMincho'
_ttc_names['simsun.ttc']='SimSun; NSimSun'

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

REM You can use this to copy fonts from a running Windows to a Samba share
SET MYSHARE=\\\\192.168.1.10\\_INCO\\TTFONTS
REM How about a folder on your desktop
REM SET MYSHARE=%USERPROFILE%\\Desktop\\TTFONTS
REM How about to your flash drive
REM SET MYSHARE=G:\\TTFONTS
MKDIR "%MYSHARE%"
EOF
    local _fnt
    for _fnt in "${_fonts[@]}"; do
      local _fntl="${_fnt,,}"
      if [[ ! "${_fntl}" =~ .tt[fc]$ ]]; then
        echo "Fonts array not a font ${_fnt}"
        rm -f '_COPY.BAT'
        set +u
        false
      fi
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
    cat > 'PKGBUILD.tmp' << EOF
#Copy these sums into PKGBUILD and erase this file
_fnt256sums=(
EOF
    local _fontno=0
    for _fnt in ${_fonts[@]}; do
      _fnt="${_fnt,,}"
      local _vers
      local _fail=1
      if [ "${_opt_GetFontName}" -ne 0 ] && [[ "${_fnt}" =~ .ttf$ ]]; then
        _fail=0
        _vers="$(./FONTVER.pl "${_fnt}")" || _fail=$?
      fi
      if [ "${_fail}" -ne 0 ]; then
        _vers="$(sed -ne 's:^.*\(Version [0-9\.]\+\).*$:\1:p' "${_fnt}" | head -n1)"
        if [[ "${_fnt}" =~ .ttc$ ]]; then
          _vers="${_vers} ${_ttc_names[${_fnt}]}"
        fi
      fi
      _fontno=$((${_fontno}+1))
      printf "  '%s' # %3u %-13s %s\n" "$(sha256sum "${_fnt}" | cut -d' ' -f1)" "${_fontno}" "${_fnt}" "${_vers}" >> 'PKGBUILD.tmp'
    done
    echo ')' >> 'PKGBUILD.tmp'
  fi
}
#_fn_updpkgsums; exit 1

# sum $1 must match sum $2 or be found anywhere in _fnt256sumsx.
# This best preserves the spirit and function of hash checking and eliminates 
# the hassle and security problems of having users update sums with no 
# verification that thier versions are correct (or the author's versions are
# wrong). We're trading the small likelyhood of a TTF containing a virus with 
# the small likelyhood that someone can produce a hacked font with any one of 
# the sums in _fnt256sumsx.
_fn_softmatch() {
  [ -z "$1" ] && return 1 # file not found
  [ "$1" = "$2" ] && return 0
# http://stackoverflow.com/questions/3685970/check-if-an-array-contains-a-value
  local _sum
  for _sum in "${_fnt256sumsx[@]}"; do
    [ "$1" = "${_sum}" ] && return 0
  done
  return 1
}

_fn_fontcheck() {
  # Verify font check sum
  local _notfound=0
  local _notfoundar=()
  local _mismatch=0
  local _mismatchar=()
  local _i
  for ((_i=0;_i<${#_fonts[@]};++_i)); do
    local _fnt="${_fonts[${_i}]}"
    _fnt="${_fnt,,}"
    if [ ! -s "${_fnt}" ]; then
      _notfound=$((${_notfound}+1))
      _notfoundar+=("${_fnt}")
    elif ! _fn_softmatch "$(sha256sum < "${_fnt}" | cut -d' ' -f1)" "${_fnt256sums[${_i}]:-}"; then
      _mismatch=$((${_mismatch}+1))
      _mismatchar+=("${_fnt}")
    else
      ln -sf "../${_fnt}" "${srcdir}/${_fnt}"
    fi
  done
  if [ "${_mismatch}" -gt 0 ]; then
    if [ "${_opt_Optimal}" -eq 0 ]; then
      _fn_updpkgsums
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
  if [ "${_mismatch}" -gt 0 -o "${_notfound}" -gt 0 ]; then
    echo
    echo 'Any missing files must be supplied and editing of the PKGBUILD may be required.'
    echo 'Edit the PKGBUILD for instructions and changes.'
    echo 'The necessity for user intervention makes this PKGBUILD not compatible with'
    echo '1 step package installers like packer.'
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

build() {
  set -u
  local _fontdir="${srcdir}/.."
  cd "${_fontdir}"
  _fn_gencopy
  _fn_fontlower
  _fn_fontpatch
  _fn_fontcheck
  rm -f 'PKGBUILD.tmp'

  # The TTC is now selectable in LibreOffice and XFCE Terminal so no more conversion.
  #cd "${srcdir}"
  #if [ -s 'cambria.ttc' ]; then
  #  # cambria.ttc is a TrueType Collection (TTC) which causes problems with
  #  # LibreOffice (Cambria Regular cannot be selected) so we need to convert
  #  # the TTC into a TrueType Font (TTF).
  #  FONTFORGE_LANGUAGE=ff fontforge -c 'Open("cambria.ttc(Cambria)"); Generate("cambria.ttf")'
  #fi
  set +u
}

package() {
  set -u
  cd "${srcdir}"

  # Prepare destination directory
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"

  # Install fonts and license
  install -Dm644 "license.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/license.rtf"
  local _fnt
  for _fnt in *.[tT][tT][fFcC]; do
    install -m644 "${_fnt}" "${pkgdir}/usr/share/fonts/TTF/${_fnt,,}"
  done
  set +u
}

set +u
# vim: set ts=2 sw=2 ft=sh noet:
