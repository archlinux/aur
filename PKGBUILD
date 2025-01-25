# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# TODO: LoginID?
# TODO: Wrong pkgdesc?

_model="sc-t7700d" # -ww
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.8
pkgrel=2
# pkgdesc="Epson inkjet printer driver (SC-T7700D)"
pkgdesc="Epson inkjet printer driver (SC-T3700D, SC-T5700D, SC-T5700DM, SC-T7700D, SC-T7700DL, SC-T7700DM)"
arch=('x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('epson-inkjet-printer-filter' 'gcc-libs' 'glibc')
_pkgsrc="epson-${_model}-ww-${pkgver}"
source=("https://download3.ebz.epson.net/dsc/f/03/00/16/03/73/24d138fd6c643aae839e48b999e5a702ca387225/${_pkgsrc}-1.src.rpm")
sha256sums=('d69b299aaa6f11221b03135f039d02a1f9870190a00e7f6eee05cf13d79c8906')

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
