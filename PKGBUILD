# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_model="px-f8000-f10000-series"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Epson inkjet printer driver (PX-F8000, PX-F10000)"
arch=('x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('epson-inkjet-printer-filter' 'gcc-libs' 'glibc')
_pkgsrc="epson-${_model}-${pkgver}"
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("https://download.ebz.epson.net/dsc/f/01/00/01/58/22/0db89d5da282bd9c16914b95aa1dd202e9822e89/${_pkgsrc}-1lsb3.2.src.rpm")
sha256sums=('05e6333a4ba72f0450255fa6c388a74066e0c4b857e2622ab0e574088c18c29b')

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_pkgsrc}.tar.gz"
}

build() {
  cd "${srcdir}/${_pkgsrc}/ppds"
  find . -type f -name '*.ppd' -exec \
    sed -e "s|/home/epson/projects/PrinterDriver/P2/_rpmbuild/SOURCES/${_pkgsrc}|/usr/share/epson-inkjet-printer-filter|g" \
        -e "s|/opt/${pkgname}/watermark|/usr/share/epson-inkjet-printer-filter/watermark|g" \
        -e "s|/opt/epson-${_model}/cups/lib/filter/epson_inkjet_printer_filter|/usr/lib/cups/filter/epson_inkjet_printer_filter|g" \
        -i "{}" +
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
