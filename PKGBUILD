# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=liboqs
pkgver=0.7.2
pkgrel=4
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
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/open-quantum-safe/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
    "fix-sha3.patch::https://patch-diff.githubusercontent.com/raw/open-quantum-safe/${pkgname}/pull/1339.patch"
)
b2sums=(
    'd0ebef728cf5dbf40ef9644e58dfe32bf609770e61ffc9de19d919f5bdf2b157e406be3ee577e9b5a8036de8e758297ae33fe193f873349af180bb591924857b'
    'b0b7a92acfb4e826ca89a82f7cd64eed206fd5ddf20a558beb2caa992345557d61f14d510814eca3d0b4b016751642e21411f2340e1d096745eff91ec0f0c938'
)

prepare() {
    # See https://github.com/open-quantum-safe/liboqs/issues/1338
    patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/fix-sha3.patch"
    sed -i -e 's/OUTPUT_DIRECTORY       = build\/docs/OUTPUT_DIRECTORY       = ..\/build\/docs/' \
        "$pkgname-$pkgver/docs/.Doxyfile"
}

build() {
    cmake -G Ninja -B build -S "${pkgname}-${pkgver}"\
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
        -DOQS_BUILD_ONLY_LIB=OFF \
        -DOQS_DIST_BUILD=ON \
        -DOQS_USE_AES_OPENSSL=ON \
        -DOQS_USE_SHA2_OPENSSL=ON \
        -DOQS_USE_SHA3_OPENSSL=ON \
        -DOQS_OPT_TARGET=x86-64 \
        -Wno-dev
    ninja -C build
    ninja -C build gen_docs
}

check() {
    ninja -C build run_tests
}

package() {
    ninja -C build install
    install -D -m0644 "${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/usr/share/doc/"
    cp -r build/docs/html "${pkgdir}/usr/share/doc/${pkgname}"
}
