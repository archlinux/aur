# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=speedtest-go-git
pkgver=1.3.1.r9.ge55185e
pkgrel=1
pkgdesc="Command Line Interface and pure Go API for speedtest.net"
arch=('x86_64')
license=('MIT')
depends=()
makedepends=('go')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/showwin/speedtest-go.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    mkdir -p "${srcdir}/go/src/github.com/showwin"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/showwin/speedtest-go"
}

build() {
    cd "${srcdir}/go/src/github.com/showwin/speedtest-go"

    mkdir -p build

    export GOPATH="${srcdir}/go" GO111MODULE="auto"

    go build \
        -trimpath -modcacherw -ldflags "-s -w" \
        -o build/speedtest-go .
}

package() {
    cd "${srcdir}/go/src/github.com/showwin/speedtest-go"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 build/speedtest-go "${pkgdir}/usr/bin/speedtest-go"
}
