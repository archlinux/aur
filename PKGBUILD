# vim: ft=bash
# Maintainer: Jef Roosens

pkgname='vieter-git'
pkgver=0.3.0.r42.g8a2b121
pkgrel=1
pkgdesc='Archlinux repository server & package build system, written in V (development version)'
depends=('glibc' 'openssl' 'libarchive' 'sqlite')
makedepends=('git' 'vlang')
arch=('x86_64' 'aarch64')
url='https://git.rustybever.be/vieter-v/vieter'
license=('AGPL3')
source=("${pkgname}::git+https://git.rustybever.be/vieter-v/vieter#branch=dev")
md5sums=('SKIP')
conflicts=('vieter')
provides=('vieter')

pkgver() {
    git -C "${pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
