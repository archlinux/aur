# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: David Runge <dvzrv@archlinux.org>
_pkgname=wolfssl
pkgname=wolfssl-liboqs
pkgver=5.6.4
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
sha512sums=('12d9dd264e005f04854d71ded629b20b9563a42b04bfbfd2879c4e3b121902edf2ac4349de27498cddd75d4d9fd742e8f78b82cd319c240485f69b4828e2c80c'
            'SKIP')
b2sums=('c745abe2ea7533b1d8f3604b485fbabc3665852b968df0fca9bfc3d4c71e97d654dfacfc136a00a05cc1b9edc01f9de792dbe6316eca5a05805751b718b5ef8a'
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
