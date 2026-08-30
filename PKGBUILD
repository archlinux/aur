# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=cc-clip
pkgver=0.11.0
pkgrel=1
pkgdesc="Clipboard bridge for pasting images into AI coding agents over SSH"
arch=('x86_64' 'aarch64')
url="https://github.com/ShunmeiCho/cc-clip"
license=('MIT')
depends=('openssh')
makedepends=('go')
optdepends=('xclip: X11 clipboard support'
            'wl-clipboard: Wayland clipboard support'
            'xorg-server-xvfb: Codex CLI clipboard support on remote hosts')
conflicts=('cc-clip-bin')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ShunmeiCho/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('daf633d9e6692aed3e363ec01dde8ddf12a7e08d3a322a84da4af1aac9f3e214')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go mod download
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
  export CGO_ENABLED=0
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
