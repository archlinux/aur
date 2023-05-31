# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider-git
_pkgname=oqs-provider
pkgver=r101.2c7a06a
pkgrel=2
pkgdesc="OpenSSL 3 provider containing post-quantum algorithms"
arch=('x86_64')
url="https://openquantumsafe.org/applications/tls.html#oqs-openssl-provider"
license=('MIT')
depends=(
    'liboqs>0.7.2'
    'openssl'
)
makedepends=(
    'cmake'
    'git'
)
provides=('oqsprovider')
conflicts=('oqsprovider')
source=("${pkgname}::git+https://github.com/open-quantum-safe/${_pkgname}")
b2sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    install -D -m0755 "${srcdir}"/build/lib/oqsprovider.so "${pkgdir}"/usr/lib/ossl-modules/oqsprovider.so
    install -D -m0755 "${srcdir}"/build/lib/oqsprovider.so.1 "${pkgdir}"/usr/lib/ossl-modules/oqsprovider.so.1
    install -D -m0755 "${srcdir}"/build/lib/oqsprovider.so.0.5.0-dev "${pkgdir}"/usr/lib/ossl-modules/oqsprovider.so.0.5.0-dev
    install -D -m0644 "${srcdir}"/${pkgname}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
