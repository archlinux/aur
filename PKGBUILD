# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=darktile-git
pkgver=0.0.11.r1.g159932f
pkgrel=1
pkgdesc="A GPU-rendered terminal emulator designed for tiling window managers"
arch=('x86_64')
url="https://github.com/liamg/darktile"
license=('MIT')
depends=('libgl' 'libx11' 'libxcursor' 'libxinerama' 'xorg-xinput')
makedepends=('go' 'git')
provides=('darktile')
conflicts=('darktile')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    install -m755 -d "${srcdir}/go/src/github.com/liamg/"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/liamg/darktile"
}

build() {
    cd "${srcdir}/go/src/github.com/liamg/darktile"

    _version="github.com/liamg/darktile/internal/app/darktile/version.Version=${pkgver}"

    export GOPATH="${srcdir}/go"
    go build -trimpath -modcacherw \
        -ldflags="-s -w -linkmode=external -X ${_version}" \
        -o darktile ./cmd/darktile
}

check() {
    cd "${srcdir}/go/src/github.com/liamg/darktile"

    export GOPATH="${srcdir}/go"
    go test ./...
}

package() {
    cd "${srcdir}/go/src/github.com/liamg/darktile"

    install -Dm 755 darktile -t "${pkgdir}/usr/bin/"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
