# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider
_pkgname=oqs-provider
pkgver=0.7.0
_pkgverliboqs=0.11.0
pkgrel=1
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
b2sums=('25237c0f9f297906879fb6a9d2d7ec0a5e3bb2d595f1d966dd2a1f876861962b571cece663bea870d7cec08f15a9114755827b5c4e50ac4ffb1186128f56d48d'
        '3a6202a9973de9322cbe0a6d3973f70a29943db006309e167a6a1504856bd680df5f8d0386ec39645bfdf291b4b9c3aa08c1d0048739920f2d2a4bd80326fb44')

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
    ctest --verbose
}

package() {
    install -D -m0755 build/lib/oqsprovider.so "$pkgdir"/usr/lib/ossl-modules/oqsprovider.so
    install -D -m0644 $_pkgname-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
