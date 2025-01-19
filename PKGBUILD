# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Arnas Udovičius <zordsdavini at gmail dot com>
# Contributor: Andre Klitzing <andre () incubo () de>

_model="201601w"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.1
pkgrel=1
# pkgdesc="Epson inkjet printer driver (L130, L132, L220, L222, L310, L312, L360, L362, L365, L366, L455, L456)"
pkgdesc="Epson inkjet printer driver (L380, L382)"
arch=('x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('epson-inkjet-printer-filter' 'gcc-libs' 'glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("https://download3.ebz.epson.net/dsc/f/03/00/15/66/51/1046e0a9f8d8ec892806a8d4921335cf6f5fd1ea/${_pkgsrc}-1.src.rpm")
sha256sums=('048d72dd4dc4bd5aaa15f43b6274318ae21bcba189e41d13082da3407d54a2cd')

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
