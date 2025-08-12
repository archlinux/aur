# Maintainer: Arthur <git@arthur404.dev>
pkgname=heimdall-cli
pkgver=0.3.0
pkgrel=1
pkgdesc="A powerful CLI tool for managing dotfiles, color schemes, wallpapers, and system theming"
arch=('x86_64' 'aarch64')
url="https://github.com/arthur404dev/heimdall-cli"
license=('MIT')
depends=('grim' 'slurp' 'wl-clipboard' 'fuzzel')
optdepends=(
  'swappy: screenshot editing support'
  'wl-screenrec: screen recording support'
  'cliphist: clipboard history support'
  'dunstify: enhanced notification support'
  'dart-sass: Sass compilation support'
  'libnotify: desktop notifications'
  'hyprland: window manager integration'
  'swww: wallpaper daemon'
  'imagemagick: wallpaper processing'
)
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arthur404dev/heimdall-cli/archive/v$pkgver.tar.gz")
sha256sums=('d7aa1a2e74d30149ffba8eb19a0e276884b66ad3291999637dff89f3cc966e99')

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

  # Install documentation if files exist
  [ -f README.md ] && install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  [ -f CHANGELOG.md ] && install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  
  # Install configuration documentation if they exist
  [ -f docs/CONFIGURATION.md ] && install -Dm644 docs/CONFIGURATION.md "$pkgdir/usr/share/doc/$pkgname/CONFIGURATION.md"
  [ -f docs/CONFIG_QUICK_REFERENCE.md ] && install -Dm644 docs/CONFIG_QUICK_REFERENCE.md "$pkgdir/usr/share/doc/$pkgname/CONFIG_QUICK_REFERENCE.md"
  
  # Install example configuration if it exists
  [ -f config-example.json ] && install -Dm644 config-example.json "$pkgdir/usr/share/doc/$pkgname/config-example.json"

  # Install license if it exists
  [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

