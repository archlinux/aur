# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: David Runge <dvzrv@archlinux.org>
_pkgname=wolfssl
pkgname=wolfssl-liboqs
pkgver=5.6.6
pkgrel=1
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
)
sha512sums=('d664ab1cd84d7c33d1b34eb934843292b7ffc07b922b4c483b45deeeeda5c425b673640e3049f731bfff364bd7e7c0c14e236afce36622a7d03242d3be0c7382'
            'SKIP')
b2sums=('05113b3a9a6c4b664f6c200b8ae5359615e056da74cc8dd06185f281319b4d027faa8613dc641236cd46d8ddd6169773ed23132ff17467eeb5cee7a910e7b382'
        'SKIP')
validpgpkeys=(
    A2A48E7BCB96C5BECB987314EBC80E415CA29677  # wolfSSL <secure@wolfssl.com>
)

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
