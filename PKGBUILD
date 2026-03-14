# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_name="aom"
pkgname="lib32-${_name}"
pkgver=3.13.1
pkgrel=1
pkgdesc="Alliance for Open Media video codec (32-bit)"
arch=(
  'x86_64'
)
url="https://aomedia.org"
license=(
  'BSD-3-Clause'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
)
makedepends=(
  'cmake'
  'yasm'
)
provides=(
  "lib${_name}.so"
)
_pkgsrc="lib${_name}-${pkgver}"
source=(
  "https://storage.googleapis.com/aom-releases/${_pkgsrc}.tar.gz"
  "https://storage.googleapis.com/aom-releases/${_pkgsrc}.tar.gz.asc"
)
b2sums=('6b72e4f6155bff1a31c99cf13da11517efc90b9997dace5e3036920c0198237de39339530ca555e0a23c5029fe7d928855fe4bcb9018de7adf79738584565d55'
        'SKIP')
validpgpkeys=(
  'B002F08B74A148DAA01F7123A48E86DB0B830498' # AOMedia release signing key <av1-discuss@aomedia.org>
)

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # Don't require static library
  sed -i 's/aom aom_static/aom/' build/cmake/aom_install.cmake
}

build() {
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=0} -m32"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=0} -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_arguments=(
    -G 'Unix Makefiles'
    -W no-dev
    # Upstream would like Release, adding -O3 and removing assertions
    # https://gitlab.archlinux.org/archlinux/packaging/packages/aom/-/issues/1
    -D CMAKE_BUILD_TYPE:STRING='Release'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR:PATH='lib32'
    -D BUILD_SHARED_LIBS:BOOL=ON
    -D ENABLE_EXAMPLES:BOOL=OFF
    -D ENABLE_TOOLS:BOOL=OFF
    -D ENABLE_TESTS:BOOL=OFF
    -D ENABLE_DOCS:BOOL=OFF
  )
  
  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build-makepkg" -S "${_pkgsrc}" "${cmake_arguments[@]}"
  cmake --build "${_pkgsrc}/build-makepkg"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build-makepkg"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
