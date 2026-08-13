# Maintainer: Julian Corbet <julian-corbet@users.noreply.github.com>
pkgname=dotkeeper-git
_gitname=dotkeeper
pkgver=1.2.8
pkgrel=1
pkgdesc="P2P file sync with git history — embedded Syncthing + staggered git auto-backup (bleeding-edge, builds from main)"
arch=('x86_64' 'aarch64')
url="https://dotkeeper.corbet.ch"
license=('AGPL-3.0-only')
depends=('git')
makedepends=('go' 'git')
provides=('dotkeeper')
conflicts=('dotkeeper' 'dotkeeper-bin')
source=("${_gitname}::git+https://github.com/julian-corbet/dotkeeper.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${_gitname}"
    make build
}

package() {
    cd "${srcdir}/${_gitname}"
    install -Dm755 dotkeeper "${pkgdir}/usr/bin/dotkeeper"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 repo-config.toml "${pkgdir}/usr/share/doc/${pkgname}/repo-config.toml"
    install -Dm644 home-manager-denylist.nix "${pkgdir}/usr/share/doc/${pkgname}/home-manager-denylist.nix"
}
