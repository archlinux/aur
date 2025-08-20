# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=mingw-w64-highway
_pkgname=highway
pkgver=1.3.0
pkgrel=1
pkgdesc='A C++ library that provides portable SIMD/vector intrinsics (mingw-w64)'
arch=('any')
url='https://github.com/google/highway/'
license=('Apache-2.0 AND BSD-3-Clause')
depends=(
    'mingw-w64-crt'
)
options=(!strip !buildflags staticlibs)
makedepends=(
    'mingw-w64-cmake'
#    'mingw-w64-gtest'
    'mingw-w64-gcc'
)
source=("https://github.com/google/highway/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('07b3c1ba2c1096878a85a31a5b9b3757427af963b1141ca904db2f9f4afe0bc2')
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
    install -D -m644 "${_pkgname}-${pkgver}/LICENSE-BSD3" -t "${pkgdir}/usr/${_arch}/share/licenses/${pkgname}"
  done
}
