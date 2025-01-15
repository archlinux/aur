# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_model="stylus-pro-7700-9700-series"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.0
pkgrel=2
pkgdesc="Epson inkjet printer driver (Stylus Pro 7700, 7710, 9700, 9710)"
arch=('i686' 'x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('epson-inkjet-printer-filter' 'gcc-libs' 'glibc')
_pkgsrc="epson-${_model}-${pkgver}"
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("https://download.ebz.epson.net/dsc/f/01/00/01/58/25/1de036d7908a5b0ed2866c2d133b62fd54a53f53/${_pkgsrc}-1lsb3.2.src.rpm")
md5sums=('c727e4ab5b5324055090cd92d6b8d9d5')
sha256sums=('267fc2a87ceb6f79a113800c42d4334548bd4b316219c39390d995ddd55c5128')

case "${CARCH}" in
  x86_64)
    _bit="64"
    ;;
  i686)
    _bit=""
    ;;
esac

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
  install -vDm644 "README"        "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  find . -maxdepth 1 -type f -name '*.txt' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
  
  find "resource" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/epson-inkjet-printer-filter/{}" \;

  cd "${srcdir}/${_pkgsrc}/ppds"
  find . -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;

  cd "${srcdir}/${_pkgsrc}/lib${_bit}"
  find . -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/lib/{}" \;

  cd "${pkgdir}/usr/lib"
  for lib in *".so.${pkgver}"; do
    base="${lib%.${pkgver}}"
    ln -vsf "${lib}" "${base}"
    ln -vsf "${lib}" "${base}.${pkgver%%.*}"
  done
}
