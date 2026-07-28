# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=cc-clip
pkgver=0.9.1
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
sha256sums=('245a74521f454b8542f838e0a290fc9883c9233d8119c2928371f3056ec6fb14')

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
