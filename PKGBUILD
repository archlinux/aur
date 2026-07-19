# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

pkgname="matio"
pkgver=1.5.30
pkgrel=1
pkgdesc="C library for reading and writing MATLAB MAT files"
arch=(
  'i686'
  'x86_64'
)
url="https://sourceforge.net/projects/${pkgname}/"
license=(
  'BSD-2-Clause'
)
depends=(
  'glibc'
  'hdf5>=1.8'
  'zlib>=1.2.3'
)
makedepends=(
  'cmake>=3.7'
)
provides=(
  "lib${pkgname}.so"
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${_pkgsrc}.tar.gz"
)
md5sums=('47c8a541f8555e68715c79c84871af5f')
sha1sums=('2860cb49038587945d390fe968d8a5e076b38e63')
sha256sums=('8bd3b9477042ecc00dd71c04762fa58468e14cccc32fd8c6826c2da1e8bc3107')

# prepare() {
#   cd "${srcdir}/${_pkgsrc}"
#   cp -v "${pkgname}.pc.in" "${pkgname}.pc"
#   sed -e "s|@prefix@|/usr|g" \
#       -e "s|@exec_prefix@|\${prefix}|g" \
#       -e "s|@libdir@|\${exec_prefix}/lib|g" \
#       -e "s|@includedir@|\${prefix}/include|g" \
#       -e "s|@VERSION@|${pkgver}|g" \
#       -e "s|@HDF5_REQUIRES_PRIVATE@|hdf5 >= 1.8|g" \
#       -e "s|@ZLIB_REQUIRES_PRIVATE@|zlib >= 1.2.3|g" \
#       -i "${pkgname}.pc"
# }

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-author
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
  )
  local configure_options=(
    --prefix='/usr'
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"

  # generate "${pkgname}.pc"
  cd "${_pkgsrc}"
  ./autogen.sh
  ./configure "${configure_options[@]}"
}

check() {
  local ctest_exclude_regex=""
  local ctest_options=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${ctest_exclude_regex}"
  )

  cd "${srcdir}"
  ctest "${ctest_options[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "${pkgname}.pc" -t "${pkgdir}/usr/lib/pkgconfig"
  install -vDm644 "NEWS" "README" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -vDm644 "COPYING" -t "${pkgdir}/usr/share/licenses/${pkgbase}"
}
