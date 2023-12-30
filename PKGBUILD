# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=liboqs
pkgver=0.9.1
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
b2sums=('9036a1b1794a27036941abfa6bfcd8242686ce983e78e559cabf2e82d4c6a281d455981317a6b46de05c131f6497c385c5ac018c5afc927afc3b7470c51bb511')

prepare() {
    # Fixes issue with Doxygen trying to resolve reference that makes ninja gen_docs fail
    sed -i 's/\[documented in CONFIGURE.md\](CONFIGURE.md)/[documented in CONFIGURE.md](CONFIGURE.md#options-for-configuring-liboqs-builds)/g' "${pkgname}-${pkgver//_/-}"/README.md
}

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
