# Maintainer: Elias Werberich <elias@werberich.de>

pkgname=docker-ipv6nat
pkgver=0.4.4
pkgrel=1
epoch=0
pkgdesc="Extend Docker with IPv6 NAT, similar to IPv4"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
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
    case $CARCH in
        "x86_64")
            _GOARCH="amd64"
            ;;
        "aarch64")
            _GOARCH="arm64"
            ;;
        "armv7h")
            _GOARCH="arm"
            _GOARM="7"
            ;;
        "armv6h")
            _GOARCH="arm"
            _GOARM="6"
            ;;
        *)
            echo "Selected architecture is unsupported."
            exit 1
            ;;
    esac
}

build() {
    GOOS=linux \
    GOARCH=${_GOARCH} \
    GOARM=${_GOARM} \
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
