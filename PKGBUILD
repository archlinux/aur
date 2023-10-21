# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider
_pkgname=oqs-provider
_pkgverliboqs=0.9.0
pkgver=0.5.2
pkgrel=1
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
b2sums=('537b8dbdddc21c4516d1a27ea61b210714871c494afacc7c66b7becf6e8269bdbf5272e0c210683f13ef4e885a4d0de9be5e590a8528d3bbe585f8584b811759'
        '5a8c3ccf570ded1dd66e420a22400f1c3320ba385e09a2edb41323e994597dcd812e1742986d34300c76bed54c2a0baf24587d2eaef00e7f03265f3dc632ddda'
        '71286fda50b1830ee70e3cc23b647499f812348c3303c518147f2ec62c300bca346147e6bdf540748a5ca6400c6134607ffd47f6166b3b6661c53aabb8035af2')

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
    install -D -m0644 "${srcdir}"/${_pkgname}-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
