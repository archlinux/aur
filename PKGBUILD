# Maintainer: AndroidHyper <iuseopensusebtw@gmail.com>
pkgname=superinstall
pkgver=1.5
pkgrel=1
pkgdesc="A security-focused package manager alternative to paru and yay (Built from source)"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/AndroidHyperOfficial/superinstall-aur-helper"
license=('GPL-3.0')
depends=('pacman' 'git' 'curl' 'gnupg' 'glibc')
makedepends=('go')
provides=('superinstall')
conflicts=('superinstall-bin')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AndroidHyperOfficial/superinstall-aur-helper/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "superinstall-aur-helper-${pkgver}"
    mkdir -p build
}

build() {
    cd "superinstall-aur-helper-${pkgver}"
    
    local _goarch
    case "$CARCH" in
        x86_64)  _goarch="amd64" ;;
        aarch64) _goarch="arm64" ;;
        i686)    _goarch="386" ;;
        *)       echo "Unsupported architecture: $CARCH"; exit 1 ;;
    esac

    export CGO_ENABLED=0
    export GOOS=linux
    export GOARCH=$_goarch
    
    go build -o build/superinstall -ldflags="-s -w" .
}

package() {
    cd "superinstall-aur-helper-${pkgver}"
    install -Dm755 build/superinstall "${pkgdir}/usr/bin/superinstall"
}
