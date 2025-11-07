# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="epson-pc-fax"
pkgver=1.1.2_1
pkgrel=3
pkgdesc="Epson PC-FAX driver used with CUPS"
arch=(
  # 'i686'
  'x86_64'
)
url="https://download.ebz.epson.net/man/linux/pc-fax_e.html"
license=(
  # 'custom:Epson End User Software License Agreement' # precompiled .a archives
  'LGPL-2.1-or-later' # CUPS driver
  'MIT' # .ppd file
)
depends=(
  'cups'
  'gcc-libs'
  'ghostscript'
  'glibc'
  # 'icu55'
  'libcups'
  'opencflite'
  # 'util-linux-libs'
)
# makedepends=(
#   'curl'
# )
_pkgsrc="${pkgname}-${pkgver%_*}"
# DLAGENTS+=(
#   'https::/usr/bin/curl -A "Mozilla" -qgb "" -fLC - --retry 3 --retry-delay 3 -o %o %u'
# )
source=(
  "https://download3.ebz.epson.net/dsc/f/03/00/16/72/92/465165eb827848c10080bfda6e9980dcdbea518f/${pkgname}-${pkgver//_/-}.src.rpm"
  "${pkgname}_cups_deprecated_ppd_api.patch"
  "${pkgname}_system_shared_libraries.patch"
)
sha256sums=('5a939770c44d91b14b7aa55f3ba4a6edc89be7018ecfdcd8dfe40efd09c933ed'
            '97bea9de793faed5607ff660ea5647d89d1d5d588772b5380d74e824a6613c39'
            '93b1a9cc223d941bbaa50651b17181bb6ac586bbaf96cf66bd1ba793a8779ad2')

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_pkgsrc}.tar.gz"

  cd "${_pkgsrc}"
  # https://www.cups.org/doc/api-ppd.html
  patch -Np1 -i "${srcdir}/${pkgname}_cups_deprecated_ppd_api.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_system_shared_libraries.patch"

  find "ppd" -type f -name '*.ppd' -exec \
    sed -i "s|/opt/${pkgname}/cups/lib/filter/pcfax_filter|pcfax_filter|g" "{}" +
}

build() {
  export CFLAGS+=" -Wno-error=implicit-function-declaration \
                   -Wno-error=incompatible-pointer-types \
                   -Wno-error=return-mismatch"
  # export LDFLAGS+=" -no-pie"
  local configure_options=(
    --prefix='/usr'
    # --prefix="/opt/${pkgname}"
  )

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS"       "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  # install -vDm644 "ChangeLog"     "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "NEWS"          "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README"        "${pkgdir}/usr/share/doc/${pkgname}/README"
  # install -vDm644 "APPLE_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.APPLE"
  # install -vDm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON"
  install -vDm644 "COPYING.LIB"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LIB"

  find "ppd" -type f -name '*.ppd' \
    -execdir install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;

  cd "${pkgdir}/usr/lib"
  install -vDm755 "epfax" "${pkgdir}/usr/bin/epfax"

  find . -maxdepth 1 -type f,l -delete
}
