# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andre Klitzing <andre () incubo () de>

_model="201206w"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.1
pkgrel=1
pkgdesc="Epson inkjet printer driver (ME-10, ME-101)"
arch=('x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('epson-inkjet-printer-filter' 'gcc-libs' 'glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("https://download3.ebz.epson.net/dsc/f/03/00/15/65/09/ed76378325239781cd1da54828e8ca7e32dbd322/${_pkgsrc}-1.src.rpm")
sha256sums=('5640d3d0af6551f164d97ecdc14dd3601992f2cff63e95cd654b2e79f24bf0bd')

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
  install -vDm644 "Manual.txt"    "${pkgdir}/usr/share/doc/${pkgname}/MANUAL"
  install -vDm644 "README"        "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

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
