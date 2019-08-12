# Maintainer: Elias Werberich <elias@werberich.de>

pkgname=docker-ipv6nat
pkgver=0.3.8
pkgrel=1
epoch=0
pkgdesc="Extend Docker with IPv6 NAT, similar to IPv4"
arch=('x86_64')
url="https://github.com/robbertkl/docker-ipv6nat"
license=('MIT')
depends=('docker' 'iptables')
makedepends=('go')
conflicts=()
source=("git+https://github.com/robbertkl/docker-ipv6nat.git#tag=v$pkgver"
        "docker-ipv6nat.service")
sha256sums=('SKIP'
            'a8e15a8d9a37be69d84bc60b63d7446e67a380cdf8e121f0fb5ea9db64a9e1b8')

prepare() {
    mkdir -p "src/github.com/robbertkl"
    mv "docker-ipv6nat" "src/github.com/robbertkl/"
    cd "src/github.com/robbertkl/docker-ipv6nat"
    git submodule init
    git submodule update
}

build() {
    GOOS=linux \
    GOARCH=amd64 \
    CGO_ENABLED=0 \
    GOPATH="$srcdir" \
    go build \
        -o "docker-ipv6nat" \
        -gcflags "all=-trimpath=${PWD}" \
        -asmflags "all=-trimpath=${PWD}" \
        -ldflags "-extldflags ${LDFLAGS} -X main.buildVersion=v$pkgver" \
        "github.com/robbertkl/docker-ipv6nat/cmd/docker-ipv6nat"
}

package() {
    mkdir -p "$pkgdir/usr/sbin/"
    mkdir -p "$pkgdir/lib/systemd/system/"
    chmod 0755 "docker-ipv6nat"
    mv "docker-ipv6nat" "$pkgdir/usr/sbin/"
    chmod 0644 "docker-ipv6nat.service"
    mv "docker-ipv6nat.service" "$pkgdir/lib/systemd/system/"
}
