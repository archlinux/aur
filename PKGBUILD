# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="epson-pc-fax"
pkgname="${_pkgname}-bin"
pkgver=1.1.2_1
_pkgver="${pkgver//_/-}"
pkgrel=3
pkgdesc="Epson PC-FAX driver used with CUPS"
arch=(
  'x86_64'
)
url="https://download.ebz.epson.net/man/linux/pc-fax_e.html"
license=(
  'custom:Epson End User Software License Agreement' # precompiled .a archives
  'LGPL-2.1-or-later' # CUPS driver
  'MIT' # .ppd file
)
depends=(
  'cups'
  'ghostscript'
  'glibc'
  'libcups'
  'libgcc'
  'libstdc++'
)
makedepends=(
  # 'curl'
  'gzip'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_x86_64=(
  "https://download3.ebz.epson.net/dsc/f/03/00/16/72/91/2f2b533c9f2d7b83d863d45f5d15fdf66dac8b79/${_pkgname}_${_pkgver}_amd64.deb"
)
noextract=(
  "${source_x86_64[@]##*/}"
)
sha256sums_x86_64=('c68e5e3cd6e4800212df329326a4f524f2d7c1a61a253be4030e7d25431a2a26')
# DLAGENTS+=(
#   'https::/usr/bin/curl -A "Mozilla" -qgb "" -fLC - --retry 3 --retry-delay 3 -o %o %u'
# )

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  mkdir -p "${source_artifact%.deb}"
  bsdtar -xf "${source_artifact}" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${source_artifact%.deb}"
  rm -f data.tar.*

  cd "${source_artifact%.deb}"
  find . -type f -name '*.gz' -exec \
    gzip -fd "{}" \;

  cd "opt/${_pkgname}"
  find "ppds" -type f -name '*.ppd' -exec \
    sed -i "s|/opt/${_pkgname}/cups/lib/filter/pcfax_filter|pcfax_filter|g" "{}" +
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}/${source_artifact%.deb}/opt/${_pkgname}"
  find "bin" -type f -exec \
    install -vDm755 "{}" "${pkgdir}/usr/{}" \;

  install -vd "${pkgdir}/usr/lib/cups"
  cp -vaT --no-preserve=ownership "cups/lib" "${pkgdir}/usr/lib/cups"

  find "ppds" -type f -name '*.ppd' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${_pkgname}/{}" \;

  cd "doc"
  install -vDm644 "AUTHORS"       "${pkgdir}/usr/share/doc/${_pkgname}/AUTHORS"
  # install -vDm644 "ChangeLog"     "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG"
  install -vDm644 "NEWS"          "${pkgdir}/usr/share/doc/${_pkgname}/NEWS"
  install -vDm644 "README"        "${pkgdir}/usr/share/doc/${_pkgname}/README"
  # install -vDm644 "APPLE_LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.APPLE"
  install -vDm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.EPSON"
  install -vDm644 "COPYING.LIB"   "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.LIB"
}
