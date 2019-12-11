# Maintainer: jakob <grandchild@gmx.net>

pkgname=mingw-w64-libgit2
pkgver=0.28.4
pkgrel=1
pkgdesc="A portable, pure C implementation of the Git core methods (mingw-w64)"
arch=(i686 x86_64)
depends=(mingw-w64-{crt,curl,libssh2,openssl,zlib})
makedepends=(mingw-w64-cmake gcc-libs)
conflicts=(mingw-w64-libgit2)
provides=(mingw-w64-libgit2)
options=(staticlibs !buildflags !strip)
license=(GPL)
url="https://github.com/libgit2/libgit2"
source=(
    "https://github.com/libgit2/libgit2/archive/v${pkgver}.tar.gz"
    aclapi-include-case.patch
)
sha256sums=(
    '30f3877469d09f2e4a21be933b4e2800560d16646028dd800744dc5f7fb0c749'
    'e9dcef212732027605e8720e76c6f9fa731a528f131feaa86a137c56e906ea25'
)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    cd "${srcdir}/libgit2-${pkgver}"

    patch -Rsfp1 --dry-run < "$srcdir/aclapi-include-case.patch" \
        || patch -p1 < "$srcdir/aclapi-include-case.patch"

    # unset LDFLAGS
    for _arch in ${_architectures}; do
        mkdir -p build-${_arch} && pushd build-${_arch}
        ${_arch}-cmake -DTHREADSAFE=ON -DBUILD_CLAR=OFF -DSTDCALL=ON ..
        ${_arch}-cmake -DTHREADSAFE=ON -DBUILD_CLAR=OFF -DSTDCALL=ON --build .
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
