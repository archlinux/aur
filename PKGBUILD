# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname="epson-inkjet-printer-201207w"
pkgver=1.0.1
pkgrel=4
pkgdesc="Epson inkjet printer driver (L110, L111, L210, L211, L300, L301, L303, L350, L351, L353, L355, L356, L550, L551, L555)"
arch=('x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('epson-inkjet-printer-filter' 'gcc-libs' 'glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("https://download3.ebz.epson.net/dsc/f/03/00/15/64/87/25d34a13841e5e95d80266e6fd8dfcdf67c95634/${_pkgsrc}-1.src.rpm")
sha256sums=('ac757bb6d392b6662779228e518bb3e9b4de02d275235c4afd41465447d38b45')

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_pkgsrc}.tar.gz"
}

build() {
  cd "${srcdir}/${_pkgsrc}/ppds"
  find . -type f -name '*.ppd' -exec \
    sed -i "s|/home/epson/projects/PrinterDriver/P2/_rpmbuild/SOURCES/${_pkgsrc}|/opt/${pkgname}|g" "{}" +
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "AUTHORS"       "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "Manual.txt"    "${pkgdir}/usr/share/doc/${pkgname}/MANUAL"
  install -vDm644 "README"        "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  find "lib64" "resource" "watermark" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;

  cd "${srcdir}/${_pkgsrc}/ppds"
  find . -type f -exec install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;

  install -d "${pkgdir}/opt/${pkgname}/usr/lib/cups/filter"
  cd "${pkgdir}/opt/${pkgname}/usr/lib/cups/filter"
  ln -s '/usr/lib/cups/filter/epson_inkjet_printer_filter' 'epson_inkjet_printer_filter'
}