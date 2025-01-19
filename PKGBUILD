# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# TODO: Wrong pkgdesc?

_model="sc-p20k10k-ww"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.1
pkgrel=1
# pkgdesc="Epson inkjet printer driver (SC-T3200, SC-T3270, SC-T3280, SC-T5200, SC-T5270, SC-T5280, SC-T7200, SC-T7270, SC-T7280, SC-T5200D, SC-T5270D, SC-T5280D, SC-T7200D, SC-T7270D, SC-T7280D)"
pkgdesc="Epson inkjet printer driver (SC-P10000, SC-P20000)"
arch=('x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('epson-inkjet-printer-filter' 'gcc-libs' 'glibc')
_pkgsrc="epson-${_model}-${pkgver}"
source=("https://download3.ebz.epson.net/dsc/f/03/00/15/52/57/e45bcd620b3c56979b85a8c50a08bd99958893d7/${_pkgsrc}-1.src.rpm")
sha256sums=('2f3c2cb9eb003f7be81ce74e557dda97bf00ebd68b40435b3ee7c657c0e7d397')

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_pkgsrc}.tar.gz"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  find "ppds" -type f -name '*.ppd' -exec \
    sed -e "s|/home/epson/projects/PrinterDriver/P2/_rpmbuild/SOURCES/${_pkgsrc}/watermark|/usr/share/epson-inkjet-printer-filter/watermark|g" \
        -e "s|/opt/${pkgname}/watermark|/usr/share/epson-inkjet-printer-filter/watermark|g" \
        -e "s|/opt/${pkgname}/cups/lib/filter/epson_inkjet_printer_filter|/usr/lib/cups/filter/epson_inkjet_printer_filter|g" \
        -e "s|/opt/epson-${_model}/cups/lib/filter/epson_inkjet_printer_filter|/usr/lib/cups/filter/epson_inkjet_printer_filter|g" \
        -i "{}" +
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "AUTHORS"       "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "README"        "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  find . -maxdepth 1 -type f -name '*.txt' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/{}" \;

  find "doc"      -type f -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/html/{}" \;
  find "lib64"    -type f -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/lib/{}" \;
  find "ppds"     -type f -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;
  find "resource" -type f -exec    \
    install -vDm644 "{}" "${pkgdir}/usr/share/epson-inkjet-printer-filter/{}" \;

  cd "${pkgdir}/usr/lib"
  for lib in *.so.*; do
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*.[0-9]*}"
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*}"
  done
}
