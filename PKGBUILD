# Maintainer: Arthur <git@arthur404.dev>
pkgname=heimdall-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="A powerful CLI tool for managing dotfiles, color schemes, wallpapers, and system theming"
arch=('x86_64' 'aarch64')
url="https://github.com/arthur404dev/heimdall-cli"
license=('MIT')
depends=('grim' 'slurp' 'swappy' 'wl-clipboard' 'wl-screenrec' 'cliphist' 'fuzzel' 'dart-sass' 'libnotify')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arthur404dev/heimdall-cli/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/heimdall-cli-$pkgver"
  mkdir -p build
}

build() {
  cd "$srcdir/heimdall-cli-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # Build the binary with version information
  go build \
    -ldflags "-X 'github.com/arthur404dev/heimdall-cli/internal/commands.Version=$pkgver' \
                  -X 'github.com/arthur404dev/heimdall-cli/internal/commands.Date=$(date -u '+%Y-%m-%d')' \
                  -s -w" \
    -o build/heimdall \
    ./cmd/heimdall
}

check() {
  cd "$srcdir/heimdall-cli-$pkgver"
  go test ./...
}

package() {
  cd "$srcdir/heimdall-cli-$pkgver"

  # Install binary
  install -Dm755 build/heimdall "$pkgdir/usr/bin/heimdall"

  # Install documentation if it exists
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi

  # Install license if it exists
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}

