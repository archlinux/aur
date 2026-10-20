# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=cc-clip
pkgver=0.13.1
pkgrel=2
pkgdesc="Clipboard bridge for pasting images into AI coding agents over SSH"
arch=('x86_64' 'aarch64')
url="https://github.com/ShunmeiCho/cc-clip"
license=('MIT')
depends=('glibc' 'openssh')
makedepends=('go')
optdepends=('xclip: X11 clipboard support'
            'wl-clipboard: Wayland clipboard support'
            'xorg-server-xvfb: Codex CLI clipboard support on remote hosts')
conflicts=('cc-clip-bin')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ShunmeiCho/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('aa06022eb029b2e0e57ef6160c10f7addbf57689ea2280535eb93166888ad686')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOPATH="$srcdir/gopath"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-X main.version=$pkgver" -o "$pkgname" ./cmd/cc-clip
}

check() {
  cd "$pkgname-$pkgver"
  # The shim tests run a nested `go test -race`: the race detector needs cgo
  # and refuses -buildmode=pie.
  export CGO_ENABLED=1
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  export GOPATH="$srcdir/gopath"
  local test_args=()
  # This upstream test appends the host PATH while asserting that xclip is
  # absent, so it cannot pass when the optional xclip dependency is installed.
  if command -v xclip >/dev/null; then
    test_args+=(-skip '^TestXclipShimFallbackFailsClearlyWhenRealBinaryIsMissing$')
  fi
  go test ./... "${test_args[@]}"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
