# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=liboqs
pkgver=0.7.2
pkgrel=1
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
    'ninja'
)
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/open-quantum-safe/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('d0ebef728cf5dbf40ef9644e58dfe32bf609770e61ffc9de19d919f5bdf2b157e406be3ee577e9b5a8036de8e758297ae33fe193f873349af180bb591924857b')

build() {
    cmake -G Ninja -B build -S "${pkgname}-${pkgver}"\
        -DBUILD_SHARED_LIBS='ON' \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
        -DOQS_BUILD_ONLY_LIB='OFF' \
        -DOQS_DIST_BUILD='ON' \
        -DOQS_USE_AES_OPENSSL='ON' \
        -DOQS_USE_SHA2_OPENSSL='ON' \
        -DOQS_USE_SHA3_OPENSSL='ON' \
        -DOQS_OPT_TARGET='generic' \
        -Wno-dev
    ninja -C build
}

package() {
    ninja -C build install
    install -D -m0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
