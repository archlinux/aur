# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider
_pkgname=oqs-provider
_pkgverliboqs=0.8.0
pkgver=0.5.0
pkgrel=2
pkgdesc="OpenSSL 3 provider containing post-quantum algorithms"
arch=('x86_64')
url="https://openquantumsafe.org/applications/tls.html#oqs-openssl-provider"
license=('MIT')
depends=(
    'liboqs'
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
    "enable-algs.patch"
)
b2sums=(
    '93a3ae7d2043728f2eca90b3d111b94c75c46f27f3323da1f79ca6dc32357f27099f7f76c7ba6cf6357b0b1636789379ffc7363b369febdca7af69fb01a4abd5'
    'f84a290ece4fffe458988e2ddbbcb4efb05f0d2be97ab21d4ccd60720977477d9b36cd2a9c69bad7815c5ed69eaf3526ee8fc65d819c0b3c341d326bd435bc16'
    '71286fda50b1830ee70e3cc23b647499f812348c3303c518147f2ec62c300bca346147e6bdf540748a5ca6400c6134607ffd47f6166b3b6661c53aabb8035af2'
)

prepare() {
    # Enable additional algorithms supported by liboqs
    # See: https://github.com/open-quantum-safe/oqs-provider/issues/210
    patch --directory="${_pkgname}-${pkgver}" --forward --strip=1 --input="${srcdir}/enable-algs.patch"

    # Some files are needed from the liboqs source code or generate.py will fail
    cd "${_pkgname}-${pkgver}"
    LIBOQS_SRC_DIR="${srcdir}/liboqs-${_pkgverliboqs}" python oqs-template/generate.py
}

build() {
    cmake -B build -S "${_pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    install -D -m0755 "${srcdir}"/build/lib/oqsprovider.so "${pkgdir}"/usr/lib/ossl-modules/oqsprovider.so
    install -D -m0755 "${srcdir}"/build/lib/oqsprovider.so.1 "${pkgdir}"/usr/lib/ossl-modules/oqsprovider.so.1
    install -D -m0755 "${srcdir}"/build/lib/oqsprovider.so.0.5.0 "${pkgdir}"/usr/lib/ossl-modules/oqsprovider.so.0.5.0
    install -D -m0644 "${srcdir}"/${_pkgname}-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
