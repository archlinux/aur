# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider
_pkgname=oqs-provider
pkgver=0.11.0
_pkgverliboqs=0.15.0
pkgrel=1
epoch=1
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
    $pkgname::git+https://github.com/open-quantum-safe/$_pkgname.git#tag=refs/tags/$pkgver
    liboqs::git+https://github.com/open-quantum-safe/liboqs.git#tag=$_pkgverliboqs
    enable-algs-tls.patch
)
b2sums=('df5b81c3c4852de30878d4ea2fa0d9cec6d64a7527bd82523e1196d2df3952c05981d334f7472a369ab52f240f0321fb95130320de030d6c5846133fc49c76de'
        '919a66cd10b01fb4c87bbd601fa9d128303ebbbc6ca182e7b7e616c317ef2bf23e1a7e4e55282cee325eb5546ec7d76b6c6b4d20afe13e30879f630d849f2dfd'
        'f52bb2995ae63be98a4eb28d47389a61dbce62f7d46e918f031f825229465e8188a4c65cc7f15d7aa2ffd21db887f933b67e60b3c3827dedb173508ca1c68404')

prepare() {
    cd $pkgname
    patch -Np1 < ../enable-algs-tls.patch
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
