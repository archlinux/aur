# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="tabaur-git"
_pkgname="TabAUR"
pkgver=0.6.4.r73.4977236
pkgrel=1
pkgdesc="A customizable and lightweight AUR helper, designed to be simple but powerful."
arch=('x86_64' 'aarch64')
url="https://github.com/BurntRanch/TabAUR"
license=('GPL3')
depends=('pacman' 'curl')
makedepends=('base-devel')
optdepends=(
  "sudo: privilege elevation"
  "doas: privilege elevation"
  "git: for using the AUR git repo"
  "tar: for using the AUR tarball repo"
)
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule init
    git submodule update --init --recursive
}

build() {
    make -C "${srcdir}/${_pkgname}" DEBUG=0
}

package() {
    cd "${srcdir}/${_pkgname}"
    make install PREFIX="${pkgdir}/usr"
    install -v -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
