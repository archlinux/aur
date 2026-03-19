# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=wolfssl-all
_pkgname=${pkgname%-all}
pkgver=5.9.0
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
sha512sums=('d6553d5cbd4ca11de31afeda6640fe6ff1cb520e68f1d5e975c955ca01ef125ff29065ac1b4f2b5ffa9364713d34545782b3921c8f6c065165a6f4e8b712036b'
            'SKIP')
b2sums=('5a44acdc2bda58d9b2fdebb08cf2cd80f2dfc1a61054bec753ea1456653a1d646b79230f2dcc956c451bf306b8cb80b1e4f9c3c114a8e0a33f8fb49b89bf8da0'
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
