# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=liboqs
pkgver=0.12.0
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
source=(
    $pkgname-$pkgver.tar.gz::https://github.com/open-quantum-safe/$pkgname/archive/refs/tags/$pkgver.tar.gz
    fix-tests.patch::https://patch-diff.githubusercontent.com/raw/open-quantum-safe/liboqs/pull/2019.patch
)
b2sums=('e3dfc1056f4d8a0356a80eec5fd7d946b9cf72f3a59a1c75b7d22bff8c500376cbaace53ce2e60506ccc918811dbf506863f386d9a34ea93be0cd79622064c3d'
        '7d601cbc9a219a6b44e1af6d3904675b9d368b9c91444a9386258733003fcedef53a2c55b063f5b13cefe3e6a13f9e67fae42bf4bcb83909aa632445fa01d039')

prepare() {
    cd $pkgname-$pkgver
    # https://github.com/open-quantum-safe/liboqs/issues/2018
    patch -Np1 -i ../fix-tests.patch
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
