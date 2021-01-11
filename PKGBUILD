# Maintainer:  matt-hires arch att matt-hires dot at

# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-ts5055-complete
# Scanner icon source: http://openiconlibrary.sourceforge.net/gallery2/open_icon_library-full/icons/png/64x64/devices/scanner-3.png
# The icon source URL isn't alive anymore

# Model list from canon-europe.com
# CANON PIXMA E3340
# CANON PIXMA G5040
# CANON PIXMA G5050
# CANON PIXMA G6040
# CANON PIXMA G6050
# CANON PIXMA GM2050
# CANON PIXMA TS3340
# CANON PIXMA TS3350
#
# CANON PIXMA TS3351
# CANON PIXMA TS3352
# CANON PIXMA TS3355
# CANON PIXMA TS5340
# CANON PIXMA TS5350
# CANON PIXMA TS5351
# CANON PIXMA TS5352
# CANON PIXMA TS5353
#
# CANON PIXMA TS6340
# CANON PIXMA TS6350
# CANON PIXMA TS6351
# CANON PIXMA TS8340
# CANON PIXMA TS8350
# CANON PIXMA TS8351
# CANON PIXMA TS8352

set -u
pkgname='canon-pixma-g6000-complete'
pkgver='5.90'
_pkgversg='3.90'
pkgrel='1'
pkgdesc='Print Scan for Canon PIXMA series E3340 G5040 G5050 G6040 G6050 GM2050 TS3340 TS3350 TS3351 TS3352 TS3355 TS5340 TS5350 TS5351 TS5352 TS5353 TS6340 TS6350 TS6351 TS8340 TS8350 TS8351 TS8352'
arch=('i686' 'x86_64')
url='https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_g_series/pixma-g6050.html?type=drivers'
license=('custom')
depends=('popt' 'libusb-compat' 'gtk2')
depends_x86_64=('libpng12' 'libtiff' 'libxml2')
depends_i686=("${depends_x86_64[@]/#/lib32-}")
conflicts=(
  'canon-pixma-mg3000-complete'
  'canon-pixma-mg5700-complete'
  'canon-pixma-mx495-printer'
  'canon-pixma-ts5055-printer'
)
options=('!strip')
install="${pkgname}.install"
_printDrvSrc="cnijfilter2-${pkgver}-1-deb"
_scanDrvSrc="scangearmp2-${_pkgversg}-1-deb"
source=(
  "https://gdlp01.c-wss.com/gds/2/0100010482/01/${_printDrvSrc}.tar.gz"
  "https://gdlp01.c-wss.com/gds/5/0100010485/01/${_scanDrvSrc}.tar.gz"
  "${pkgname}-scangear.desktop"
  "${pkgname}-scangear-icon.png"
)
md5sums=('368cf7466336eb77d4f8661e01be5da3'
         '2076a830e774283223c44fca42f18c15'
         'bd78d16ffb2b40f96f811b30e42b16bf'
         '3feefd413092d7152f47b7451ba79efe')
sha256sums=('0e59ca1781c046c0dc10876011d554ecb1744bdc50dd2209eccffa8a25507d85'
            'a4653e636d7894d880574da09589cfac1dbecc7594075824aac307bf01692159'
            'c437966f4c12c22b7ef2700f24f10a24c4091a97dd368fd570ec5e1264cf0f8e'
            '29dbc682d3f22d79f580bda54801d1f4ef261d857c756eaf4db29e1313406bcc')

_prb="cnijfilter2_${pkgver}-1"
_scb="scangearmp2_${_pkgversg}-1"
_prf="${_prb/_/-}-deb/packages"
_scf="${_scb/_/-}-deb/packages"

prepare() {
  set -u

  # Unpack debian installer files

  declare -A _cax=([i686]='i386' [x86_64]='amd64')

  cd "${srcdir}/${_prf}"
  bsdtar -xf "${_prb}_${_cax[${CARCH}]}.deb"

  cd "${srcdir}/${_scf}"
  bsdtar -xf "${_scb}_${_cax[${CARCH}]}.deb"

  set +u
}

package() {
  set -u
  cd "${pkgdir}"

  bsdtar --no-same-owner -xf "${srcdir}/${_prf}/data.tar.gz"
  bsdtar --no-same-owner -xf "${srcdir}/${_scf}/data.tar.gz"

  # Move ppd file to where cups expects

  install -d 'usr/share/cups/'
  mv 'usr/share/ppd' 'usr/share/cups/model'

  # Install license files

  find 'usr/share/doc/' -name 'LICENSE*' -execdir install -Dpm644 '{}' -t "${pkgdir}/usr/share/licenses/${pkgname}/" ';'

  # Install entry in application menu, including icon

  install -Dpm644 "${srcdir}/${pkgname}-scangear.desktop" -t 'usr/share/applications/'
  install -Dpm644 "${srcdir}/${pkgname}-scangear-icon.png" -t 'usr/share/pixmaps/'

  # Mark shared libs executable

  find 'usr/lib' -name '*.so*' -exec chmod 755 '{}' '+'

  set +u
}
set +u
