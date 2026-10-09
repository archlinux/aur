# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider
_pkgname=oqs-provider
pkgver=0.12.0
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
)
provides=(oqsprovider.so)
install=$pkgname.install
source=($pkgname::git+https://github.com/open-quantum-safe/$_pkgname.git#tag=refs/tags/${pkgver/_/-})
b2sums=('96b5959d64da8c406ff59c5ee48b7d992221dcdda26a3f83482bb654fb967c696f08e5143ec20efd18f23b2c3de01403ec0feb78dbfb2bbc66b6c5d3d08a3af1')

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
