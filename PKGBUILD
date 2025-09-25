# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor Nicole Watterson <poisonimy at protonmail dot com>
_pkgname=liboqs
pkgname=$_pkgname-git
pkgver=0.14.0.r37.gdd942d4
pkgrel=1
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
    git
    ninja
    python # required for generating the docs
)
checkdepends=(
    python-pytest
    python-pytest-xdist
    python-yaml
)
provides=(liboqs)
conflicts=(liboqs)
source=($_pkgname::git+https://github.com/open-quantum-safe/$_pkgname.git)
b2sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -G Ninja -B build -S $_pkgname\
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
    install -D -m0644 $_pkgname/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -d "$pkgdir"/usr/share/doc/
    cp -r build/docs/html "$pkgdir"/usr/share/doc/$pkgname
}
