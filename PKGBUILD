# Maintainer: Julian Corbet <julian.corbet@gmail.com>
pkgname=dotkeeper-git
_gitname=dotkeeper
pkgver=0.3.0
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
      # Strip leading 'v', convert git describe output to an AUR-legal version.
      # Example: v0.3.0-5-gabc123 -> 0.3.0.r5.gabc123
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${_gitname}"
    # noassets: dotkeeper uses Syncthing's REST API only, not its web GUI
    make build
}

package() {
    cd "${srcdir}/${_gitname}"
    install -Dm755 dotkeeper "${pkgdir}/usr/bin/dotkeeper"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 dotkeeper.toml.example "${pkgdir}/usr/share/doc/${pkgname}/dotkeeper.toml.example"
}
