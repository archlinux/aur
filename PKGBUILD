# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider-git
_pkgname=oqs-provider
pkgver=r108.0c91d09
pkgrel=1
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
    cd "${srcdir}"/build/lib/

    for library in *; do
        install -D -m0755 "${library}" "${pkgdir}"/usr/lib/ossl-modules/${library}
    done

    install -D -m0644 "${srcdir}"/${pkgname}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
