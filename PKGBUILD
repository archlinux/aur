# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider
_pkgname=oqs-provider
pkgver=0.6.0
_pkgverliboqs=0.10.0
pkgrel=2
pkgdesc="OpenSSL 3 provider containing post-quantum algorithms"
arch=(x86_64)
url=https://openquantumsafe.org/applications/tls.html#oqs-openssl-provider
license=(MIT)
depends=(
    'liboqs=1:0.10.0'
    'openssl'
)
makedepends=(
    cmake
    python
    python-jinja
    python-tabulate
    python-yaml
)
provides=(oqsprovider.so)
source=(
    $pkgname-$pkgver.tar.gz::https://github.com/open-quantum-safe/$_pkgname/archive/refs/tags/$pkgver.tar.gz
    liboqs-$_pkgverliboqs.tar.gz::https://github.com/open-quantum-safe/liboqs/archive/refs/tags/$_pkgverliboqs.tar.gz
)
b2sums=('0426042cad8c1e039c16f673b2411e5dc2ee487c65b295c230cc697e2fd98c175a9158e4ef407440d8fd7b4a10ce607576afc3903d5da268d2dcae7046e8ec76'
        '6fda208f669f270b7c361a87c5b4d2bc59e3fac2d49a31c378650bc2b6a36a34e6627bf31785d5bbbb5609cc87ef280ff035c60961dfd3abe620035e88c9a433')

prepare() {
    cd $_pkgname-$pkgver

    # Enable only some sig algorithms supported by liboqs
    # Enabling more than 40 algs can cause some TLS issues (check tests below)
    # See: https://github.com/open-quantum-safe/oqs-provider/issues/210
    #      https://github.com/open-quantum-safe/oqs-provider/issues/399

    # Disable all sig algs
    sed -i -e 's/enable: true/enable: false/g' oqs-template/generate.yml
    # Enable CRYSTALS-Dilithium
    sed -i -e '460,551s/enable: false/enable: true/g' oqs-template/generate.yml
    # Enable ML-DSA
    sed -i -e '552,660s/enable: false/enable: true/g' oqs-template/generate.yml
    # Enable Falcon
    sed -i -e '661,763s/enable: false/enable: true/g' oqs-template/generate.yml
    # Enable SPHINCS-Haraka
    #sed -i -e '764,962s/enable: false/enable: true/g' oqs-template/generate.yml
    # Enable SPHINCS-SHA2
    #sed -i -e '963,1217s/enable: false/enable: true/g' oqs-template/generate.yml
    # Enable SPHINCS-SHAKE
    #sed -i -e '1218,1471s/enable: false/enable: true/g' oqs-template/generate.yml

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
    # Running the built-in tests can take a long time (~30 mins)
    # Consider passing --nocheck if you don't want to wait that long
    ctest --verbose

    # Check TLS handshake with two known problematic servers
    # See: https://github.com/open-quantum-safe/oqs-provider/issues/399
    export OPENSSL_MODULES=lib
    echo Q | openssl s_client -provider default -provider oqsprovider -connect fwupd.org:443
    echo Q | openssl s_client -provider default -provider oqsprovider -connect index.crates.io:443
}

package() {
    install -D -m0755 build/lib/oqsprovider.so "$pkgdir"/usr/lib/ossl-modules/oqsprovider.so
    install -D -m0644 $_pkgname-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
