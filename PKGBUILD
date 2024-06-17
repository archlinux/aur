# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider
_pkgname=oqs-provider
pkgver=0.6.1
_pkgverliboqs=0.10.1
pkgrel=2
pkgdesc="OpenSSL 3 provider containing post-quantum algorithms"
arch=(x86_64)
url=https://openquantumsafe.org/applications/tls.html#oqs-openssl-provider
license=(MIT)
depends=(
    liboqs
    openssl
)
makedepends=(
    cmake
    python
    python-jinja
    python-tabulate
    python-yaml
)
provides=(oqsprovider.so)
install=$pkgname.install
source=(
    $pkgname-$pkgver.tar.gz::https://github.com/open-quantum-safe/$_pkgname/archive/refs/tags/$pkgver.tar.gz
    liboqs-$_pkgverliboqs.tar.gz::https://github.com/open-quantum-safe/liboqs/archive/refs/tags/$_pkgverliboqs.tar.gz
)
b2sums=('8b6d7852bc460c95ed1701673f4af538844ee38881c868caf2c753480e02d7855bc539c16edb5e28384abd63866b8d38b983651fb4d40e34657778e5b6481dde'
        '7f5f59641734d9827323b116822bf0204c7390abcf3e899b638c9f2ee7acc2c79511bb53b91e8c5d1f6bf4c8b63191f8df8fef0054020d3a38f7af3ddf33c424')

prepare() {
    cd $_pkgname-$pkgver
    # Enable all sig algs
    sed -i -e 's/enable: false/enable: true/g' oqs-template/generate.yml
    # Some files are needed from the liboqs source code or generate.py will fail
    LIBOQS_SRC_DIR="$srcdir"/liboqs-$_pkgverliboqs python oqs-template/generate.py
}

build() {
    cmake -B build -S $_pkgname-$pkgver \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

check() {
    cd build
    # Running the built-in tests can take a long time (+30 mins)
    # Uncomment the following line if you want to run them
    #ctest --verbose
}

package() {
    install -D -m0755 build/lib/oqsprovider.so "$pkgdir"/usr/lib/ossl-modules/oqsprovider.so
    install -D -m0644 $_pkgname-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
