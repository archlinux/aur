# Maintainer: David Anderson <dave@natulte.net>

pkgname="tailscale"
_version="1.2.10"
pkgver="1.2.10"
pkgrel="1"
pkgdesc="A mesh VPN that makes it easy to connect your devices, wherever they are."
arch=("x86_64")
url="https://tailscale.com"
license=("MIT")
makedepends=("git" "go")
depends=("glibc")
backup=("etc/default/tailscaled")
source=("$pkgname::git+https://github.com/tailscale/tailscale.git#tag=v$pkgver")
sha256sums=('SKIP')
install="tailscale.install"

prepare() {
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$srcdir/tailscale"
    go mod vendor
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$srcdir/tailscale"
    eval "$(./version/version.sh)"
    GO_LDFLAGS="\
        -X tailscale.com/version.Long=${VERSION_LONG} \
        -X tailscale.com/version.Short=${VERSION_SHORT} \
        -X tailscale.com/version.GitCommit=${VERSION_GIT_HASH}"
    go build -v -tags xversion -ldflags "$GO_LDFLAGS" ./cmd/tailscale
    go build -v -tags xversion -ldflags "$GO_LDFLAGS" ./cmd/tailscaled
}

package() {
    cd "$srcdir/tailscale"
    install -Dm755 tailscale tailscaled -t "$pkgdir/usr/bin"
    install -Dm644 cmd/tailscaled/tailscaled.defaults "$pkgdir/etc/default/tailscaled"
    install -Dm644 cmd/tailscaled/tailscaled.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
