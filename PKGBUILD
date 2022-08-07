# vim: ft=bash
# Maintainer: Jef Roosens

pkgname='vieter'
pkgver='0.3.0'
pkgrel=2
pkgdesc='Archlinux repository server & package build system, written in V.'
depends=('glibc' 'openssl' 'libarchive' 'sqlite')
makedepends=('vlang')
arch=('x86_64' 'aarch64')
url='https://git.rustybever.be/vieter-v/vieter'
license=('AGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://git.rustybever.be/vieter-v/vieter/archive/${pkgver}.tar.gz")
sha256sums=('829c2f5a755c64b21b7b30df20848f679b1e05af5b446a67a75ae0e0c3279fac')

build() {
    cd "${pkgname}"

    make prod

    # The default CFLAGS for some reason causes vieter to segfault if used
    # inside the PKGBUILD. As a workaround, we use tcc to build a debug build
    # that does work, so we can generate the manpages.
    CFLAGS= LDFLAGS= make man
}

package() {
    cd "${pkgname}"

    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 'pvieter' "${pkgdir}/usr/bin/vieter"

    install -dm755 "${pkgdir}/usr/share/man/man1"
    install -Dm644 man/*.1 "${pkgdir}/usr/share/man/man1"
}
