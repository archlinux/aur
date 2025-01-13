# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andre Klitzing <andre () incubo () de>

_model="201211w"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.1
pkgrel=1
pkgdesc="Epson inkjet printer driver (WF-2010, WF-2510, WF-2520, WF-2521, WF-2528, WF-2530, WF-2531, WF-2532, WF-2538, WF-2540, WF-2541, WF-2548)"
arch=('x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('epson-inkjet-printer-filter' 'gcc-libs' 'glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("https://download3.ebz.epson.net/dsc/f/03/00/15/69/60/2cad8d0db8d552bec202f055b0b9a9ef7a4609ba/${_pkgsrc}-1.src.rpm")
sha256sums=('2be69ad9ccca5e97b4bfd5d1a26d7f3d5c191792e57ccadf7fa3df7ff7b5ef76')

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
