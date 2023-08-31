# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=mingw-w64-highway
_pkgname=highway
pkgver=1.0.7
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
sha256sums=('5434488108186c170a5e2fca5e3c9b6ef59a1caa4d520b008a9b8be6b8abe6c5')
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
}
