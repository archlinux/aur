# Maintainer: Elias Werberich <elias@werberich.de>

pkgname=docker-ipv6nat
pkgver=0.4.2
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
            '4f0443dc6873fa2ed217309b79d8db362aa2fbcfca81b717edc6ec805bdd24f4')

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
    install -Dm0755 "docker-ipv6nat" "$pkgdir/usr/bin/docker-ipv6nat"
    install -Dm0644 "docker-ipv6nat.service" "$pkgdir/usr/lib/systemd/system/docker-ipv6nat.service"
}
