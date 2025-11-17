# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider
_pkgname=oqs-provider
pkgver=0.11.0_rc1
_pkgverliboqs=0.15.0
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
    git
    python
    python-jinja
    python-tabulate
    python-yaml
)
provides=(oqsprovider.so)
install=$pkgname.install
source=(
    $pkgname::git+https://github.com/open-quantum-safe/$_pkgname.git#tag=${pkgver/_/-}
    liboqs::git+https://github.com/open-quantum-safe/liboqs.git#tag=$_pkgverliboqs
)
b2sums=('5d072ade012bbcf1e52fcf229e9df69439eaf44cf16820ae7ec88323e363514c7d687e9d58aad0dc101146926fbb644907ef765c5e26aa454970a0f493d552d6'
        '919a66cd10b01fb4c87bbd601fa9d128303ebbbc6ca182e7b7e616c317ef2bf23e1a7e4e55282cee325eb5546ec7d76b6c6b4d20afe13e30879f630d849f2dfd')

prepare() {
    cd $pkgname
    # Enable all sig algs
    sed -i -e 's/enable: false/enable: true/g' oqs-template/generate.yml
    # Some files are needed from the liboqs source code or generate.py will fail
    LIBOQS_SRC_DIR="$srcdir"/liboqs python oqs-template/generate.py
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
    ctest --verbose
}

package() {
    install -D -m0755 build/lib/oqsprovider.so "$pkgdir"/usr/lib/ossl-modules/oqsprovider.so
    install -D -m0644 $pkgname/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
