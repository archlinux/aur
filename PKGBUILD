# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=wolfssl-all
_pkgname=${pkgname%-all}
pkgver=5.9.4
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
sha512sums=('a37624080dabb789f1f78acce758e9bdbbfad278bc73ab9ff3cdcd24d4aa9633daea1b82002bdf756219cd1d30da8083bdf1dfdc0c00d32565578ae288eb7e69'
            'SKIP')
b2sums=('bcb9db2aa6334c348207cf27698c9318dbe7751eac0769c1359b0008667755c4052cfaf12f2f1daa4fe849746218a46d20e222770d3ff0a337e3cea08c157c70'
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
