# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=liboqs
pkgver=0.10.0
pkgrel=2
epoch=1
pkgdesc="C library for prototyping and experimenting with quantum-resistant cryptography"
arch=(x86_64)
url="https://openquantumsafe.org/liboqs/"
license=(MIT)
depends=(
    gcc-libs
    openssl
)
makedepends=(
    cmake
    doxygen
    ninja
    python # required for generating the docs
)
checkdepends=(
    python-pytest
    python-pytest-xdist
    python-yaml
)
source=($pkgname-$pkgver.tar.gz::https://github.com/open-quantum-safe/$pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('6fda208f669f270b7c361a87c5b4d2bc59e3fac2d49a31c378650bc2b6a36a34e6627bf31785d5bbbb5609cc87ef280ff035c60961dfd3abe620035e88c9a433')

build() {
    cmake -G Ninja -B build -S $pkgname-$pkgver\
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
        -DOQS_ALGS_ENABLED=All \
        -DOQS_BUILD_ONLY_LIB=OFF \
        -DOQS_DIST_BUILD=ON \
        -DOQS_USE_OPENSSL=ON \
        -DOQS_USE_AES_OPENSSL=ON \
        -DOQS_USE_SHA2_OPENSSL=ON \
        -DOQS_USE_SHA3_OPENSSL=ON \
        -DOQS_OPT_TARGET=x86-64 \
        -DOQS_STRICT_WARNINGS=ON \
        -Wno-dev
    ninja -C build
    ninja -C build gen_docs
}

check() {
    ninja -C build run_tests
}

package() {
    ninja -C build install
    install -D -m0644 $pkgname-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -d "$pkgdir"/usr/share/doc/
    cp -r build/docs/html "$pkgdir"/usr/share/doc/$pkgname
}
