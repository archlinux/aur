# vim: ft=bash
# Maintainer: Jef Roosens

pkgname='vieter'
pkgver='0.5.0'
pkgrel=1
pkgdesc='Lightweight Pacman repository server & package build system'
depends=('glibc' 'openssl' 'libarchive' 'sqlite')
makedepends=('vlang')
arch=('x86_64' 'aarch64')
url='https://git.rustybever.be/vieter-v/vieter'
license=('AGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://git.rustybever.be/vieter-v/vieter/archive/${pkgver}.tar.gz")
sha256sums=('bb836feb26c7049c763ea02968cfd253b0089acef2c19fa21167434928d1f5f6')

prepare() {
    export VMODULES="${srcdir}/.vmodules"

    cd "${pkgname}/src" && v install
}

build() {
    export VMODULES="${srcdir}/.vmodules"

    cd "${pkgname}"

    make prod

    # The default CFLAGS for some reason causes vieter to segfault if used
    # inside the PKGBUILD. As a workaround, we use tcc to build a debug build
    # that does work, so we can generate the manpages.
    CFLAGS= LDFLAGS= make man
}

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "${pkgname}/pvieter" "${pkgdir}/usr/bin/vieter"

    install -dm755 "${pkgdir}/usr/share/man/man1"
    install -Dm644 "${pkgname}/man"/*.1 "${pkgdir}/usr/share/man/man1"
}
