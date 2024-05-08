# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: David Runge <dvzrv@archlinux.org>
_pkgname=wolfssl
pkgname=wolfssl-liboqs
pkgver=5.7.0
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
    fix-cmake.patch::https://github.com/wolfSSL/wolfssl/pull/7480.patch
)
b2sums=('a85342264022d9f1ab3cd49bd282cbd9f2ef4fa90eda69ebd145a412f1557ed6d0ca5620f5a916fe1bf8c546c1d3ef0d01c80ec90722d49059683620ccbcdf1b'
        'SKIP'
        '4dfd34cf8051a684306d37b3364de7ab1bd9d2515ddd570eb76677d62b7a7a5c19ac12b6d7aaea7b7cbbd395a1c8f48bf38a7cb932cd44e820aaac0fdd471a7c')
validpgpkeys=(
    A2A48E7BCB96C5BECB987314EBC80E415CA29677  # wolfSSL <secure@wolfssl.com>
)

prepare() {
    cd $_pkgname-$pkgver-stable
    #./autogen.sh

    # Fix cmake building
    patch -N -p1 -i ../fix-cmake.patch
}

build() {
    #cd $_pkgname-$pkgver-stable
    #./configure --prefix=/usr \
    #    --build=x86_64-linux \
    #    --host=x86_64-linux \
    #    --target=x86_64-linux \
    #    --enable-experimental \
    #    --enable-reproducible-build \
    #    --enable-benchmark \
    #    --enable-curve25519 \
    #    --enable-ed25519 \
    #    --enable-curve448 \
    #    --enable-ed448 \
    #    --enable-examples \
    #    --enable-crypttests \
    #    --enable-kyber \
    #    --enable-dual-alg-certs \
    #    --with-liboqs=/usr/include
    #make

    local cmake_options=(
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_BUILD_TYPE=None
        -DWOLFSSL_CURVE25519=ON
        -DWOLFSSL_CURVE448=ON
        -DWOLFSSL_ED25519=ON
        -DWOLFSSL_ED448=ON
        -DWOLFSSL_REPRODUCIBLE_BUILD=ON
        -DWOLFSSL_EXPERIMENTAL=ON
        #-DWOLFSSL_KYBER=ON
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
    #cd $_pkgname-$pkgver-stable
    cd build
    ./wolfcrypt/test/testwolfcrypt
    ./wolfcrypt/benchmark/benchmark
}

package() {
    #cd $_pkgname-$pkgver-stable
    #make DESTDIR="$pkgdir" install
    DESTDIR="$pkgdir" cmake --install build
    install -vDm 644 $_pkgname-$pkgver-stable/{README,ChangeLog}.md -t "$pkgdir"/usr/share/doc/$pkgname/
}
