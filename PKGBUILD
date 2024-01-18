# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider
_pkgname=oqs-provider
pkgver=0.5.3
_pkgverliboqs=0.9.2
pkgrel=1
pkgdesc="OpenSSL 3 provider containing post-quantum algorithms"
arch=('x86_64')
url="https://openquantumsafe.org/applications/tls.html#oqs-openssl-provider"
license=('MIT')
depends=(
    'liboqs=1:0.9.2'
    'openssl'
)
makedepends=(
    'cmake'
    'python'
    'python-jinja'
    'python-tabulate'
    'python-yaml'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/open-quantum-safe/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
    "liboqs-${_pkgverliboqs}.tar.gz::https://github.com/open-quantum-safe/liboqs/archive/refs/tags/${_pkgverliboqs}.tar.gz"
)
b2sums=('b8fb24297ccfa7331911ae4de797fd9d1ae4003f2421cbe630f572bea4fb6b8636cbdb7c92288fa641c87783d5a64d981335e291f09edd5f51ad653add2302cf'
        '2a2252532a1fe9ff84152f862195284df7d7f498eae105be91b86f1237ba2f355a9d2d0df6107c9e84f420c314953d5ce16b06b30ca0024e3f7396966dbd0765')

prepare() {
    # Enable additional algorithms supported by liboqs
    # See: https://github.com/open-quantum-safe/oqs-provider/issues/210
    cd "${_pkgname}-${pkgver}"
    sed -i -e "s/enable: false/enable: true/g" oqs-template/generate.yml

    # Some files are needed from the liboqs source code or generate.py will fail
    LIBOQS_SRC_DIR="${srcdir}/liboqs-${_pkgverliboqs}" python oqs-template/generate.py
}

build() {
    cmake -B build -S "${_pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    cd build
    # Running the built-in tests can take a long time (~10-20 mins)
    # Consider passing --nocheck if you don't want to wait that long
    ctest --verbose
}

package() {
    install -D -m0755 "${srcdir}"/build/lib/oqsprovider.so "${pkgdir}"/usr/lib/ossl-modules/oqsprovider.so
    install -D -m0644 "${srcdir}"/${_pkgname}-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
