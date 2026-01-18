# Maintainer: BigmenPixel <bigmen dot pixel at tuta dot io>

pkgname=tun2socks
pkgver=2.6.0
pkgrel=1
pkgdesc="tun2socks - powered by gVisor TCP/IP stack"
arch=('x86_64')
url="https://github.com/xjasonlyu/tun2socks"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
makedepends=("go")
b2sums=('fda41de6ad301e84cae06059cfc518bfcff37ce544ab6ea239af257b15e22911fad91c3b63d01a04121a92b8c21e59713cda14b91051fb5f985b1a0051ebd736')

prepare() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="${srcdir}"
    mkdir -p build/
    # go mod download -modcacherw
}

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        -o build .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 build/tun2socks "${pkgdir}"/usr/bin/tun2socks
}
