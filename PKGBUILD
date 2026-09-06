# Maintainer: Michael E. Gruen <contact@michaelgruen.com>
pkgname=tailport
pkgver=0.2.5
pkgrel=1
pkgdesc="TUI to expose local ports across your tailnet via tailscale serve"
arch=('x86_64' 'aarch64')
url='https://github.com/gruen/tailport'
license=('MIT')
# glibc: build() links libc dynamically via -linkmode=external, so depend on it
# directly rather than leaning on tailscale to pull it in.
# tailscale is shelled out to for serve/funnel; ss (iproute2) discovers
# listening ports on Linux. lsof is the macOS path only, so not a dep here.
# namcap flags tailscale/iproute2 as "may not be needed" -- a false positive; it
# sees no linkage because both are runtime shell-outs, not linked libraries.
depends=('glibc' 'tailscale' 'iproute2')
# go.mod requires go >= 1.26 (a minor floor, not a patch pin -- tvyh), which
# any current Arch `go` satisfies comfortably.
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gruen/tailport/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a3cc70fd366e24f59da79d3a3c48572179817f9bed0bfcdee874711918d305bf')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o tailport \
    -ldflags "-linkmode=external -X main.version=$pkgver" \
    ./cmd/tailport
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 tailport "$pkgdir/usr/bin/tailport"
  # Arch requires the MIT text be shipped per-package.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
