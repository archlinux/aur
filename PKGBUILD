# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_model="stylus-pro-7890-9890-series"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.1.0
pkgrel=2
pkgdesc="Epson inkjet printer driver (Stylus Pro 7890, 7908, 9890, 9908)"
arch=('i686' 'x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('epson-inkjet-printer-filter' 'gcc-libs' 'glibc')
_pkgsrc="epson-${_model}-${pkgver}"
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("https://download.ebz.epson.net/dsc/f/01/00/01/78/81/93325244c86bb1f7510265599bb9faa8d1fbccec/${_pkgsrc}-1lsb3.2.src.rpm")
md5sums=('acf925a01aa08b1790b5b55ea463e554')
sha256sums=('5c7704fb3f42014cb38db70013132056be33dad3831f1dfcc385f1fcb24f2e61')

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
  
  find "lib${_bit}" -type f -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/lib/{}" \;
  find "ppds"       -type f -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;
  find "resource"   -type f -exec    \
    install -vDm644 "{}" "${pkgdir}/usr/share/epson-inkjet-printer-filter/{}" \;

  cd "${pkgdir}/usr/lib"
  for lib in *.so.*; do
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*.[0-9]*}"
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*}"
  done
}
