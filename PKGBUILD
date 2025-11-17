# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=liboqs
pkgver=0.15.0
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
    gcc
    git
    ninja
    python # required for generating the docs
)
checkdepends=(
    python-pytest
    python-pytest-xdist
    python-yaml
)
source=($pkgname::git+https://github.com/open-quantum-safe/$pkgname.git#tag=$pkgver)
b2sums=('919a66cd10b01fb4c87bbd601fa9d128303ebbbc6ca182e7b7e616c317ef2bf23e1a7e4e55282cee325eb5546ec7d76b6c6b4d20afe13e30879f630d849f2dfd')

build() {
    cmake -G Ninja -B build -S $pkgname\
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
        -DOQS_ALGS_ENABLED=All \
        -DOQS_BUILD_ONLY_LIB=OFF \
        -DOQS_DIST_BUILD=ON \
        -DOQS_USE_OPENSSL=ON \
        -DOQS_DLOPEN_OPENSSL=OFF \
        -DOQS_USE_AES_OPENSSL=ON \
        -DOQS_USE_SHA2_OPENSSL=ON \
        -DOQS_USE_SHA3_OPENSSL=ON \
        -DOQS_ENABLE_SIG_STFL_XMSS=ON \
        -DOQS_ENABLE_SIG_STFL_LMS=ON \
        -DOQS_HAZARDOUS_EXPERIMENTAL_ENABLE_SIG_STFL_KEY_SIG_GEN=ON \
        -DOQS_LIBJADE_BUILD=ON \
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
    install -D -m0644 $pkgname/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -d "$pkgdir"/usr/share/doc/
    cp -r build/docs/html "$pkgdir"/usr/share/doc/$pkgname
}
