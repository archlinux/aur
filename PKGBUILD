# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andre Klitzing <andre () incubo () de>

_model="201305j"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.1
pkgrel=1
pkgdesc="Epson inkjet printer driver (EP-976A3)"
arch=('x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('epson-inkjet-printer-filter' 'gcc-libs' 'glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("https://download3.ebz.epson.net/dsc/f/03/00/15/65/32/59375026e2dbe20c1b54cb1a7b12ed1863d6dae7/${_pkgsrc}-1.src.rpm")
sha256sums=('5b5f82e57b1b38802a5fe0f06d09b5cc4c4a428329f4a4cbd6684ef73c91a2e8')

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
