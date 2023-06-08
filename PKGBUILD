# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=liboqs
pkgver=0.8.0
pkgrel=1
epoch=1
pkgdesc="C library for prototyping and experimenting with quantum-resistant cryptography"
arch=('x86_64')
url="https://openquantumsafe.org/liboqs/"
license=('MIT')
depends=(
    'gcc-libs'
    'openssl'
)
makedepends=(
    'cmake'
    'doxygen'
    'ninja'
)
checkdepends=(
    'python-pytest'
    'python-pytest-xdist'
    'python-yaml'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/open-quantum-safe/${pkgname}/archive/refs/tags/${pkgver//_/-}.tar.gz")
b2sums=('f84a290ece4fffe458988e2ddbbcb4efb05f0d2be97ab21d4ccd60720977477d9b36cd2a9c69bad7815c5ed69eaf3526ee8fc65d819c0b3c341d326bd435bc16')

build() {
    cmake -G Ninja -B build -S "${pkgname}-${pkgver//_/-}"\
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
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
    install -D -m0644 "${pkgname}-${pkgver//_/-}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/usr/share/doc/"
    cp -r build/docs/html "${pkgdir}/usr/share/doc/${pkgname}"
}
