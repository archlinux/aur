# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=liboqs
pkgver=0.11.0
pkgrel=1
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
source=(
    $pkgname-$pkgver.tar.gz::https://github.com/open-quantum-safe/$pkgname/archive/refs/tags/$pkgver.tar.gz
    fix-test.patch::https://patch-diff.githubusercontent.com/raw/open-quantum-safe/liboqs/pull/1938.patch
)
b2sums=('3a6202a9973de9322cbe0a6d3973f70a29943db006309e167a6a1504856bd680df5f8d0386ec39645bfdf291b4b9c3aa08c1d0048739920f2d2a4bd80326fb44'
        'a49116e9ec03da542aef7424d3a2961431be55e2e621a5898d50b799467b8037fd4c30b52ed7eec03793da11d0047072c2e364346908c8100692e9042ff9f769')

prepare() {
    cd $pkgname-$pkgver
    # https://github.com/open-quantum-safe/liboqs/issues/1937
    patch -Np1 -i ../fix-test.patch
}

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
        -DOQS_ENABLE_SIG_STFL_XMSS=ON \
        -DOQS_ENABLE_SIG_STFL_LMS=ON \
        -DOQS_HAZARDOUS_EXPERIMENTAL_ENABLE_SIG_STFL_KEY_SIG_GEN=ON \
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
