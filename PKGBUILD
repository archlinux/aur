# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=mingw-w64-highway
_pkgname=highway
pkgver=1.0.5
pkgrel=1
pkgdesc='A C++ library for SIMD (Single Instruction, Multiple Data) (mingw-w64)'
arch=('any')
url='https://github.com/google/highway/'
license=('Apache')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
#makedepends=('mingw-w64-cmake' 'mingw-w64-gtest' 'mingw-w64-gcc')
makedepends=('mingw-w64-cmake' 'mingw-w64-gcc')
source=("https://github.com/google/highway/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('99b7dad98b8fa088673b720151458fae698ae5df9154016e39de4afdc23bb927')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
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
}
