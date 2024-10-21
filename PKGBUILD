# Maintainer: jakob <grandchild@gmx.net>

pkgname=mingw-w64-libgit2
pkgver=1.8.1
pkgrel=1
pkgdesc="A portable, pure C implementation of the Git core methods (mingw-w64)"
arch=(any)
depends=(mingw-w64-{crt,curl,libssh2,openssl,zlib})
makedepends=(mingw-w64-cmake)
options=(staticlibs !buildflags !strip)
license=(GPL)
url="https://github.com/libgit2/libgit2"
source=("https://github.com/libgit2/libgit2/archive/v${pkgver}.tar.gz")
sha256sums=('8c1eaf0cf07cba0e9021920bfba9502140220786ed5d8a8ec6c7ad9174522f8e')


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    cd "${srcdir}/libgit2-${pkgver}"
    for _arch in ${_architectures}; do
        ${_arch}-cmake \
            -DUSE_THREADS=ON \
            -DBUILD_TESTS=OFF \
            -DUSE_SSH=ON \
            -B build-${_arch}
        cmake --build build-${_arch} --verbose
    done
}

package() {
    for _arch in ${_architectures}; do
        cd "${srcdir}/libgit2-${pkgver}/build-${_arch}"
        make DESTDIR="${pkgdir}" install
        find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
        find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    done
    install -D -m644 \
        "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}/COPYING \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
