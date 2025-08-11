# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider
_pkgname=oqs-provider
pkgver=0.10.0
_pkgverliboqs=0.14.0
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
b2sums=('d21d19853fadb809ec448e5869bc67ce1b4e2cdb2188551c70f4a31153a337225026b21a4a381c658408788c4d2ac26dc482b7015d882adf76a76e5e8f3d1bfd'
        'a673a05b922f415b2abb2a6c85a1ecf922bcd7cd016c1b2ba5afdf7c9b6b9149e88cbd4f38c8d4e8c70c836868c1f1da93b44ae835d8a7fcb28cf4d703301efc')

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
