# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="tabaur-git"
_pkgname="TabAUR"
pkgver=0.6.9.r0.4dc1eba
pkgrel=1
pkgdesc="A customizable and lightweight AUR helper, designed to be simple but powerful."
arch=('x86_64' 'aarch64')
url="https://github.com/BurntRanch/TabAUR"
license=('GPL2')
depends=('pacman' 'curl')
makedepends=('base-devel' 'cmake')
optdepends=(
  "sudo: privilege elevation"
  "opendoas: privilege elevation"
  "git: use AUR packages git repos"
  "tar: use AUR packages tarballs"
)
conflicts=('tabaur' 'tabaur-bin')
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
    make install DESTDIR="${pkgdir}" PREFIX="/usr"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
