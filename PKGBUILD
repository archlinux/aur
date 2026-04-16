# Maintainer: Matthew Cushing <cushing.matt@gmail.com>
pkgname=qml-language-server-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Language Server Protocol implementation for QML (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/cushycush/qml-language-server"
license=('MIT')
makedepends=('go')
provides=('qml-language-server')
conflicts=('qml-language-server' 'qml-language-server-bin')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    export CGO_ENABLED=0
    local _version
    _version="$(git describe --tags --always --dirty 2>/dev/null || echo "dev")"
    go build -ldflags="-s -w -X main.version=${_version}" -o qml-language-server .
}

package() {
    cd "${pkgname}"
    install -Dm755 qml-language-server "${pkgdir}/usr/bin/qml-language-server"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
