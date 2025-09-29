# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andre Klitzing <andre () incubo () de>

_model="PX H7000 H9000 Series"
_name="$(echo "${_model}" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')"
pkgname="epson-inkjet-printer-${_name}"
pkgver=1.1.0
pkgrel=1
pkgdesc="Epson inkjet printer driver (PX-H7000, PX-H9000)"
arch=(
  'i686'
  'x86_64'
)
url="https://download.ebz.epson.net/man/linux/escp.html"
license=('custom:Epson End User Software License Agreement')
depends=(
  'epson-inkjet-printer-filter'
  # 'gcc-libs'
  'glibc'
)
makedepends=(
  'curl'
)
provides=(
  "libEpson_${_model// /_}.so"
  # "libEpson_${_model// /_}.MT.so"
)
_pkgsrc="epson-${_name}-${pkgver}"
DLAGENTS=('https::/usr/bin/curl -A "Mozilla" -qgb "" -fLC - --retry 3 --retry-delay 3 -o %o %u')
source=("https://download.ebz.epson.net/dsc/f/01/00/01/78/80/571e61c914a4792d56fa874af5b4da813a3f60b1/${_pkgsrc}-1lsb3.2.src.rpm")
sha256sums=('456c1224d726710c774a6964fbbbaefc1ae99ea55308d64b2f5b421ced21b17a')

case "${CARCH}" in
  i?86)   _bit="" ;;
  x86_64) _bit="64" ;;
  *)      _bit="DUMMY" ;;
esac

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_pkgsrc}.tar.gz"

  cd "${_pkgsrc}"
  find "ppds" -type f -name '*.ppd' -exec \
    sed -E -e 's@(^|[[:space:]]|")/[^"]*/epson_inkjet_printer_filter@\1epson_inkjet_printer_filter@g' \
           -e 's@(^|[[:space:]]|")/[^"]*/watermark@\1/usr/share/epson-inkjet-printer-filter/watermark@g' \
           -i "{}" +
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -dm755 \
    "${pkgdir}/usr/lib" \
    "${pkgdir}/usr/share/cups/model/${pkgname}" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/share/epson-inkjet-printer-filter/resource" \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -va --no-preserve=ownership "lib${_bit}"/lib*.so* -t \
    "${pkgdir}/usr/lib"
  cp -va --no-preserve=ownership "ppds"/*.ppd -t \
    "${pkgdir}/usr/share/cups/model/${pkgname}"
  cp -va --no-preserve=ownership "resource"/*.data -t \
    "${pkgdir}/usr/share/epson-inkjet-printer-filter/resource"
  cp -va --no-preserve=ownership "AUTHORS" "README" *.txt -t \
    "${pkgdir}/usr/share/doc/${pkgname}"
  cp -va --no-preserve=ownership "COPYING.EPSON" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  if [ -d "doc" ]; then
    cp -vaT --no-preserve=ownership "doc" \
      "${pkgdir}/usr/share/doc/${pkgname}/html"
  fi

  cd "${pkgdir}/usr/lib"
  for lib in lib*.so.*; do
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*.[0-9]*}"
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*}"
  done
}
