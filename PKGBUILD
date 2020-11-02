# Maintainer: jakob <grandchild@gmx.net>

pkgname=mingw-w64-libgit2
pkgver=1.1.0
pkgrel=1
pkgdesc="A portable, pure C implementation of the Git core methods (mingw-w64)"
arch=(any)
depends=(mingw-w64-{crt,curl,libssh2,openssl,zlib})
makedepends=(mingw-w64-cmake)
options=(staticlibs !buildflags !strip)
license=(GPL)
url="https://github.com/libgit2/libgit2"
source=("https://github.com/libgit2/libgit2/archive/v${pkgver}.tar.gz")
sha256sums=('41a6d5d740fd608674c7db8685685f45535323e73e784062cf000a633d420d1e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    cd "${srcdir}/libgit2-${pkgver}"
    for _arch in ${_architectures}; do
        mkdir -p build-${_arch} && pushd build-${_arch}
        ${_arch}-cmake -DTHREADSAFE=ON -DBUILD_CLAR=OFF -DSTDCALL=ON ..
        make
        popd
    done
}

package() {
    for _arch in ${_architectures}; do
        cd "${srcdir}/libgit2-${pkgver}/build-${_arch}"
        make DESTDIR="${pkgdir}" install
        find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
        find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    done
    install -D -m644 "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
