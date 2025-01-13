# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andre Klitzing <andre () incubo () de>

_model="201204w"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.1
pkgrel=1
pkgdesc="Epson inkjet printer driver (XP-100, XP-101, XP-104, XP-200, XP-201, XP-204, ME-301)"
arch=('x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('epson-inkjet-printer-filter' 'gcc-libs' 'glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("https://download3.ebz.epson.net/dsc/f/03/00/15/69/66/6d7410844cbb6768fd83d9ca212125b0972b65a1/${_pkgsrc}-1.src.rpm")
sha256sums=('57ecc0757b8ca2a542247b1a0e1076f506ab16c3bfe36d5dac54c78ac6f1970c')

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_pkgsrc}.tar.gz"
}

build() {
  cd "${srcdir}/${_pkgsrc}/ppds"
  find . -type f -name '*.ppd' -exec \
    sed -i "s|/home/epson/projects/PrinterDriver/P2/_rpmbuild/SOURCES/${_pkgsrc}|/usr/share/epson-inkjet-printer-filter|g" "{}" +
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "AUTHORS"       "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "Manual.txt"    "${pkgdir}/usr/share/doc/${pkgname}/MANUAL"
  install -vDm644 "README"        "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  find "resource" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/epson-inkjet-printer-filter/{}" \;

  cd "${srcdir}/${_pkgsrc}/ppds"
  find . -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;

  cd "${srcdir}/${_pkgsrc}/lib64"
  find . -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/lib/{}" \;

  cd "${pkgdir}/usr/lib"
  for lib in *".so.${pkgver}"; do
    base="${lib%.${pkgver}}"
    ln -vsf "${lib}" "${base}"
    ln -vsf "${lib}" "${base}.${pkgver%%.*}"
  done
}
