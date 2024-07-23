# Maintainer: Charles Dong <chardon_cs@proton.me>
# Contributor: suliman altassan <suliman.p2019@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: jinzhongjia <mail@nvimer.org>

pkgname=webui-stable
_pkgname=webui
pkgver=2.4.2
pkgrel=2
pkgdesc="Use any web browser as GUI, with your preferred language in the backend and HTML5 in the frontend, all in a lightweight portable lib. (stable version)"
arch=('x86_64')
url="https://webui.me/"
license=('MIT')
depends=("openssl" "glibc")
makedepends=("git" "make" "gcc")
provides=("webui")
conflicts=('webui' 'webui-nossl')
_commit=ac4ea8cd7b11daf3d96c65db03e6c02e1e0bd6d2
source=("git+https://github.com/webui-dev/webui.git#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --tags --exclude nightly | sed 's/^v//;s/-/+/g'
}

build() {
    cd "$srcdir/$_pkgname"
    # TLS edition
    make WEBUI_USE_TLS=1
    # NoTLS edition
    make
}

package() {
    cd "$srcdir/$_pkgname"
    # install header file
    install -Dm644 "include/webui.h" "$pkgdir/usr/include/webui.h"
    install -Dm644 "include/webui.hpp" "$pkgdir/usr/include/webui.hpp"
    # install library
    install -Dm644 "dist/libwebui-2-secure-static.a" -t "$pkgdir/usr/lib/"
    install -Dm755 "dist/webui-2-secure.so" "$pkgdir/usr/lib/libwebui-2-secure.so"

    install -Dm644 "dist/libwebui-2-static.a" -t "$pkgdir/usr/lib/"
    install -Dm755 "dist/webui-2.so" "$pkgdir/usr/lib/libwebui-2.so"

    ln -s /usr/lib/libwebui-2-secure.so $pkgdir/usr/lib/libwebui.so

    # install license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
