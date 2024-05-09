# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider-git
_pkgname=oqs-provider
pkgver=r208.6ae3eca
_pkgverliboqs=0.10.0
pkgrel=1
pkgdesc="OpenSSL 3 provider containing post-quantum algorithms"
arch=(x86_64)
url=https://openquantumsafe.org/applications/tls.html#oqs-openssl-provider
license=(MIT)
depends=(
    'liboqs>=0.10.0'
    'openssl'
)
makedepends=(
    cmake
    git
    python
    python-jinja
    python-tabulate
    python-yaml
)
provides=(oqsprovider.so)
conflicts=(oqsprovider)
source=(
    $pkgname::git+https://github.com/open-quantum-safe/$_pkgname
    liboqs-$_pkgverliboqs.tar.gz::https://github.com/open-quantum-safe/liboqs/archive/refs/tags/$_pkgverliboqs.tar.gz
)
install=$pkgname.install
b2sums=('SKIP'
        '6fda208f669f270b7c361a87c5b4d2bc59e3fac2d49a31c378650bc2b6a36a34e6627bf31785d5bbbb5609cc87ef280ff035c60961dfd3abe620035e88c9a433')

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd $pkgname
    # Enable all sig algs
    sed -i -e 's/enable: false/enable: true/g' oqs-template/generate.yml
    # Some files are needed from the liboqs source code or generate.py will fail
    LIBOQS_SRC_DIR="$srcdir"/liboqs-$_pkgverliboqs python oqs-template/generate.py
}

build() {
    cmake -B build -S $pkgname \
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
    install -D -m0644 $pkgname/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
