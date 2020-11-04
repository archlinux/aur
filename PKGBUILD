# Contributor: Federico Di Pierro <nierro92@gmail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>
pkgname=libulfius
_gitname=ulfius
pkgver=2.6.9
pkgrel=2
pkgdesc="HTTP Framework for REST API in C, using JSON, with websockets and streaming data"
arch=(x86_64)
url="https://github.com/babelouest/${_gitname}"
license=(GPL)
depends=('libmicrohttpd' 'jansson' 'curl' 'gnutls' 'libgcrypt' 'libyder')
makedepends=('git' 'cmake')
source=("git+https://github.com/babelouest/ulfius.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${_gitname}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${_gitname}"
    cmake -B build \
        -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release"
    make -C build
}

package() {
    cd "${srcdir}/${_gitname}"
    make -C build DESTDIR="$pkgdir" install
    
    # Remove conficts
    rm -rf "$pkgdir"/usr/include/{orcania.h,orcania-cfg.h,yder-cfg.h,yder.h}
    rm -rf "$pkgdir"/usr/lib/{liborcania.so*,liborcania.so.*,libyder.so*,libyder.so.*,pkgconfig/{liborcania.pc,libyder.pc}}

}
