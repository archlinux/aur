# Maintainer: Strykar <strykar@hotmail.com>

pkgname=infnoise-openssl-git
pkgver=r22.d161bfd
pkgrel=3
pkgdesc="OpenSSL Engine for random number generation using the Infnoise hardware TRNG"
arch=('x86_64')
url="https://github.com/tinskip/infnoise-openssl"
license=('LGPL-3.0-only')
depends=('openssl' 'libftdi' 'libinfnoise')
makedepends=('git')
source=("git+https://github.com/tinskip/infnoise-openssl.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    make CFLAGS="${CFLAGS} -fPIC -Wall -Wextra -O2 -I/usr/include/libftdi1 -I/usr/include" \
         LDFLAGS="${LDFLAGS} -shared -lcrypto -linfnoise -L/usr/lib" 
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 "infnoise-openssl.so" "${pkgdir}/usr/lib/engines-3/infnoise-openssl.so"
    install -Dm644 "infnoise-openssl.cnf" "${pkgdir}/etc/ssl/infnoise-openssl.cnf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
