# Maintainer: Andrew Gunnerson <andrewgunnerson@gmail.com>
# Original maintainer: Dan McGee <dan@archlinux.org>

pkgname=mingw-w64-libarchive
pkgver=3.3.1
pkgrel=1
pkgdesc="library that can create and read several streaming archive formats (mingw-w64)"
arch=(any)
url="http://www.libarchive.org/"
license=(BSD)
depends=(mingw-w64-crt mingw-w64-bzip2 mingw-w64-expat mingw-w64-lz4 mingw-w64-openssl mingw-w64-xz mingw-w64-zlib)
makedepends=(mingw-w64-cmake ninja)
options=(!strip !buildflags staticlibs)
source=("libarchive-${pkgver}.tar.gz::https://github.com/libarchive/libarchive/archive/v${pkgver}.tar.gz")
sha256sums=('ff138120fe7fca1bd02bed6f06d6869c7497658904a2f8916947f9a3f3257377')

_architectures=(i686-w64-mingw32 x86_64-w64-mingw32)

build() {
    local arch
    unset LDFLAGS

    cd "libarchive-${pkgver}"
    for arch in "${_architectures[@]}"; do
        mkdir -p build-${arch} && pushd build-${arch}
        ${arch}-cmake \
            -GNinja \
            -DCMAKE_BUILD_TYPE=Release \
            -DENABLE_TEST=OFF \
            ..
        ninja
        popd
    done
}

package() {
    local arch

    for arch in "${_architectures[@]}"; do
        pushd "libarchive-${pkgver}/build-${arch}"
        DESTDIR="${pkgdir}" ninja install
        ${arch}-strip --strip-unneeded "${pkgdir}"/usr/${arch}/bin/*.dll
        ${arch}-strip -g "${pkgdir}"/usr/${arch}/lib/*.a
        popd
    done
}
