# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=wolfssl-all
_pkgname=${pkgname%-all}
pkgver=5.9.2
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
sha512sums=('ed0f6bff353b1a835e1f1c15e1863eda9e04030962211be64d7c764f8373b016778e04ea9538ca6cf2f58d55d0f855c2af1739d776f9697b2f4a13a5e489d85f'
            'SKIP')
b2sums=('4e47fb590a0420231e4219ace3095ba2e0f8d188da19ae6e984eb80825bcc90211bed56e931920dbad5cf797655aeb63c7b3cda0924569a41096e590f60be1d9'
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
