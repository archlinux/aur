# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: David Runge <dvzrv@archlinux.org>
_pkgname=wolfssl
pkgname=wolfssl-liboqs
pkgver=5.7.2
pkgrel=1
pkgdesc="Lightweight, portable, C-language-based SSL/TLS library (with post-quantum cryptography)"
arch=(x86_64)
url=https://www.wolfssl.com/
license=(GPL-2.0-or-later)
depends=(
    glibc
    liboqs
)
makedepends=(
    cmake
    git
)
provides=(libwolfssl.so)
conflicts=(wolfssl)
source=(
    $_pkgname-$pkgver-stable.tar.gz::https://github.com/$_pkgname/$_pkgname/archive/refs/tags/v$pkgver-stable.tar.gz
    https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver-stable/$_pkgname-$pkgver-stable.tar.gz.asc
)
b2sums=('52bbabfd91fb5fdb1ef78dfafa7de86afaae821da14b9336bdf52b057444ac63f7afb4cc99d80ec8040adadbd4e8e07eb186499c12398b625aee4824e2dc503c'
        'SKIP')
validpgpkeys=(
    A2A48E7BCB96C5BECB987314EBC80E415CA29677  # wolfSSL <secure@wolfssl.com>
)

prepare() {
    cd $_pkgname-$pkgver-stable
    ./autogen.sh
}

build() {
    cd $_pkgname-$pkgver-stable
    ./configure --prefix=/usr \
        --build=x86_64-linux \
        --host=x86_64-linux \
        --target=x86_64-linux \
        --enable-experimental \
        --enable-reproducible-build \
        --enable-benchmark \
        --enable-curve25519 \
        --enable-ed25519 \
        --enable-curve448 \
        --enable-ed448 \
        --enable-examples \
        --enable-crypttests \
        --enable-kyber \
        --enable-dual-alg-certs \
        --with-liboqs=/usr/include
    make

    #local cmake_options=(
    #    -DCMAKE_INSTALL_PREFIX=/usr
    #    -DCMAKE_BUILD_TYPE=None
    #    -DWOLFSSL_CURVE25519=ON
    #    -DWOLFSSL_CURVE448=ON
    #    -DWOLFSSL_ED25519=ON
    #    -DWOLFSSL_ED448=ON
    #    -DWOLFSSL_REPRODUCIBLE_BUILD=ON
    #    -DWOLFSSL_EXPERIMENTAL=ON
    #    #-DWOLFSSL_KYBER=ON
    #    -DWOLFSSL_OQS=ON
    #    -DWOLFSSL_EXAMPLES=ON
    #    -DWOLFSSL_CRYPT_TESTS=ON
    #    -DWARNING_C_FLAGS="$CFLAGS"
    #    -Wno-dev
    #    -B build
    #    -S $_pkgname-$pkgver-stable
    #)
    #cmake "${cmake_options[@]}"
    #cmake --build build --verbose

}

check () {
    cd $_pkgname-$pkgver-stable
    #cd build
    ./wolfcrypt/test/testwolfcrypt
    ./wolfcrypt/benchmark/benchmark
}

package() {
    cd $_pkgname-$pkgver-stable
    make DESTDIR="$pkgdir" install
    #DESTDIR="$pkgdir" cmake --install build
    install -vDm 644 {README,ChangeLog}.md -t "$pkgdir"/usr/share/doc/$pkgname/
}
