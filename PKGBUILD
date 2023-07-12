# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: David Runge <dvzrv@archlinux.org>
_pkgname=wolfssl
pkgname=wolfssl-liboqs
pkgver=5.6.3
pkgrel=2
pkgdesc="Lightweight, portable, C-language-based SSL/TLS library (with post-quantum cryptography)"
arch=(x86_64)
url="https://www.wolfssl.com/"
license=(GPL2)
depends=(glibc liboqs)
makedepends=(cmake git)
provides=(libwolfssl.so)
conflicts=(wolfssl)
source=(
    $_pkgname-$pkgver-stable.tar.gz::https://github.com/$_pkgname/$_pkgname/archive/refs/tags/v$pkgver-stable.tar.gz
    https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver-stable/$_pkgname-$pkgver-stable.tar.gz.asc
    "liboqs-1.8.patch"::https://patch-diff.githubusercontent.com/raw/$_pkgname/$_pkgname/pull/6576.patch
)
sha512sums=('7c3b5c06ade7826031db089d50ec45c36970555499b6be94d1939b3002369fc98e503418128c6b2e253df7e92f86a71647d37f2cd27d57ac201e5aba32b879dc'
            'SKIP'
            '991f5f54477819743e1d19375996b7d7cd889f84a999c009ed0d589565f3a93be432aacdeee2f9c305947fe350dadafbcac4dee9954164dcb6193b2b6e5c7f5e')
b2sums=('b53f5d4c5457372564636b4b9edae1116889d5033ee111f2d8eed05469e9372b4ac286ce1fa4c872f14b2a74ab1715e6726b09940068fc3219f8dbac68a5e020'
        'SKIP'
        '6e620ed6c15c0c62d58343acf0830f74a3b82b08e5d7a4e8df3b821069379de759898823182a177dd5f51b1aae592ad2fab715f8969c877af05c31d8beffb035')
validpgpkeys=(
    A2A48E7BCB96C5BECB987314EBC80E415CA29677  # wolfSSL <secure@wolfssl.com>
)

prepare() {
    # git needed because patch does not support binary diffs
    git apply --directory="$_pkgname-$pkgver-stable" "${srcdir}/liboqs-1.8.patch"
}

build() {
    local cmake_options=(
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_BUILD_TYPE=None
        -DWOLFSSL_CURVE25519=ON
        -DWOLFSSL_CURVE448=ON
        -DWOLFSSL_ED25519=ON
        -DWOLFSSL_ED448=ON
        -DWOLFSSL_REPRODUCIBLE_BUILD=ON
        -DWOLFSSL_OQS=ON
        -DWOLFSSL_EXAMPLES=ON
        -DWOLFSSL_CRYPT_TESTS=ON
        -DWARNING_C_FLAGS="$CFLAGS"
        -Wno-dev
        -B build
        -S $_pkgname-$pkgver-stable
    )

    cmake "${cmake_options[@]}"
    cmake --build build --verbose
}

check () {
    cd build
    ./wolfcrypt/test/testwolfcrypt
    ./wolfcrypt/benchmark/benchmark
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -vDm 644 $_pkgname-$pkgver-stable/{README,ChangeLog}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
