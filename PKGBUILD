# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname="epson-inkjet-printer-201207w"
_pkgname_filter="epson-inkjet-printer-filter"
pkgver=1.0.1
_filter_ver=1.0.2
pkgrel=1
pkgdesc="Epson printer driver (L110, L210, L300, L350, L355, L550, L555)"
arch=('x86_64' 'i686')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('LGPL-2.1-or-later' 'custom:Epson Licence Agreement')
depends=('glibc' 'gcc-libs' 'cups' 'libcups' 'ghostscript' 'libjpeg-turbo')
_pkgsrc="${pkgname}-${pkgver}"
_filter_src="${_pkgname_filter}-${_filter_ver}"
source=("${_pkgsrc}.src.rpm::https://download3.ebz.epson.net/dsc/f/03/00/15/64/87/25d34a13841e5e95d80266e6fd8dfcdf67c95634/${_pkgsrc}-1.src.rpm")
sha256sums=('ac757bb6d392b6662779228e518bb3e9b4de02d275235c4afd41465447d38b45')

case "${CARCH}" in
  x86_64)
    _bit="64"
    ;;
  i686)
    _bit=""
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_pkgsrc}.tar.gz"
  bsdtar -xzf "${_filter_src}.tar.gz"
}

build() {
  cd "${srcdir}/${_filter_src}"
  libtoolize
  autoreconf -vfi
  autoupdate -f
  # if you have runtime problems: add "--enable-debug" and look into /tmp/epson-inkjet-printer-filter.txt
  ./configure LDFLAGS="${LDFLAGS} -Wl,--no-as-needed" --prefix="/opt/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm644 "README"     "${pkgdir}/usr/share/doc/${pkgname}/README-driver"
  install -Dm644 "Manual.txt" "${pkgdir}/usr/share/doc/${pkgname}/MANUAL"

  install -d "${pkgdir}/opt/${pkgname}"
  cp -a --no-preserve=mode "lib${_bit}" "${pkgdir}/opt/${pkgname}"
  cp -a --no-preserve=mode "resource"   "${pkgdir}/opt/${pkgname}"
  if [ -e "watermark" ]; then
    cp -a --no-preserve=mode "watermark" "${pkgdir}/opt/${pkgname}"
  fi
  install -d "${pkgdir}/usr/share/cups/model/${pkgname}"
  install -m 644 "ppds"/* "${pkgdir}/usr/share/cups/model/${pkgname}"

  cd "${srcdir}/${_filter_src}"
  install -Dm644 "README"      "${pkgdir}/usr/share/doc/${pkgname}/README-filter"
  # install -Dm644 "NEWS"        "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  # install -Dm644 "CHANGELOG"   "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON"
  install -Dm644 "COPYING.LIB"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LIB"
  install -Dm644 "AUTHORS"       "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"

  cd "src"
  install -Dm755 "epson_inkjet_printer_filter" "${pkgdir}/opt/${pkgname}/cups/lib/filter/epson_inkjet_printer_filter"
  install -Dm755 "epson_inkjet_printer_filter" "${pkgdir}/usr/lib/cups/filter/epson_inkjet_printer_filter"
}