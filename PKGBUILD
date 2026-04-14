# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=wolfssl-all
_pkgname=${pkgname%-all}
pkgver=5.9.1
pkgrel=1
pkgdesc="Lightweight, portable, C-language-based SSL/TLS library (built with --enable-all)"
arch=(x86_64)
url="https://www.wolfssl.com/"
license=('GPL-3.0-or-later')
makedepends=(autoconf automake libtool)
provides=(wolfssl libwolfssl.so)
conflicts=(wolfssl)
source=("$_pkgname-$pkgver-stable.tar.gz::https://github.com/$_pkgname/$_pkgname/archive/refs/tags/v$pkgver-stable.tar.gz"
        "https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver-stable/$_pkgname-$pkgver-stable.tar.gz.asc")
sha512sums=('84adcc41fc07dc89467b7f1bda32ab49f61cb15bb7b5ce3f3b5263346534a3af179bcb402c348a438a4de91a2b76b269db26110ad5c3f0e1bd5b8d234dfaf516'
            'SKIP')
b2sums=('ab26467ab745d542ff27f2ac20dc9c667d988a160fe4e775f0583ab70b3c59563a17fd7fef7b83350732bafdefca6ea342dea3c9a67190c1c1cf4cc90cbae835'
        'SKIP')
validpgpkeys=(
    A2A48E7BCB96C5BECB987314EBC80E415CA29677 # wolfSSL <secure@wolfssl.com>
)

build() {
    cd "$_pkgname-$pkgver-stable"
    ./autogen.sh
    ./configure --prefix=/usr --enable-all --enable-reproducible-build
    make
}

check() {
    cd "$_pkgname-$pkgver-stable"
    WOLFSSL_EXTERNAL_TEST=0 make check
}

package() {
    cd "$_pkgname-$pkgver-stable"
    make DESTDIR="$pkgdir/" install
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
