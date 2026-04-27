# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=mingw-w64-highway
_pkgname=highway
pkgver=1.4.0
pkgrel=1
pkgdesc='A C++ library that provides portable SIMD/vector intrinsics (mingw-w64)'
arch=('any')
url='https://github.com/google/highway/'
license=('Apache-2.0 AND BSD-3-Clause')
depends=(
    'mingw-w64-crt'
)
options=(!strip !buildflags staticlibs !debug)
makedepends=(
    'mingw-w64-cmake'
#    'mingw-w64-gtest'
    'mingw-w64-gcc'
)
source=("https://github.com/google/highway/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e72241ac9524bb653ae52ced768b508045d4438726a303f10181a38f764a453c')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    if [ "${_arch}" == "i686-w64-mingw32" ]
    then
      SSE2_OPTION="-DHWY_CMAKE_SSE2:BOOL='ON'"
    else
      unset SSE2_OPTION
    fi

    # static
    ${_arch}-cmake -B build-${_arch}-static -S "${_pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DHWY_SYSTEM_GTEST:BOOL='ON' \
        -DBUILD_SHARED_LIBS:BOOL='OFF' \
        -DHWY_ENABLE_CONTRIB='ON' \
        -DHWY_ENABLE_EXAMPLES='OFF' \
        -DHWY_ENABLE_INSTALL='ON' \
        -DHWY_ENABLE_TESTS='OFF' \
        $SSE2_OPTION \
        -Wno-dev
    cmake --build build-${_arch}-static

    # shared
    ${_arch}-cmake -B build-${_arch} -S "${_pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DHWY_SYSTEM_GTEST:BOOL='ON' \
        -DHWY_ENABLE_CONTRIB='ON' \
        -DHWY_ENABLE_EXAMPLES='OFF' \
        -DHWY_ENABLE_INSTALL='ON' \
        -DHWY_ENABLE_TESTS='OFF' \
        $SSE2_OPTION \
        -Wno-dev
    cmake --build build-${_arch}
  done
}

#TODO: Add gtest and enable checks
#check() {
#  for _arch in ${_architectures}; do
#    ctest --test-dir build-${_arch} --output-on-failure
#  done
#}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}-static
    DESTDIR="$pkgdir" cmake --install build-${_arch}
  done

  install -D -m644 "${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
