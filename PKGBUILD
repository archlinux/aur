# vim: ft=bash
# Maintainer: Jef Roosens

pkgname='vieter-git'
pkgver=0.5.0.r25.ge10b450
pkgrel=1
pkgdesc='Lightweight Pacman repository server & package build system (development version)'
depends=('glibc' 'openssl' 'libarchive' 'sqlite')
makedepends=('git' 'vlang')
arch=('x86_64' 'aarch64')
url='https://git.rustybever.be/vieter-v/vieter'
license=('AGPL3')
source=(
    "${pkgname}::git+https://git.rustybever.be/vieter-v/vieter#branch=dev"
    "libvieter::git+https://git.rustybever.be/vieter-v/libvieter"
)
md5sums=('SKIP' 'SKIP')
conflicts=('vieter')
provides=('vieter')

pkgver() {
    git -C "${pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"

    # Add the libvieter submodule
    git submodule init
    git config submodules.src/libvieter.url "${srcdir}/libvieter"
    git -c protocol.file.allow=always submodule update

    export VMODULES="${srcdir}/.vmodules"

    cd src && v install
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
