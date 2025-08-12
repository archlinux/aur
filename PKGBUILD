# Maintainer: Your Name <your.email@example.com>
pkgname=heimdall-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="A powerful CLI tool for managing dotfiles, color schemes, wallpapers, and system theming"
arch=('x86_64' 'aarch64')
url="https://github.com/heimdall-cli/heimdall"
license=('MIT')
depends=('grim' 'slurp' 'swappy' 'wl-clipboard' 'wl-screenrec' 'cliphist' 'fuzzel' 'dart-sass' 'libnotify')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/heimdall-cli/heimdall/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/heimdall-$pkgver"
    mkdir -p build
}

build() {
    cd "$srcdir/heimdall-$pkgver"
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    # Build the binary with version information
    go build \
        -ldflags "-X 'github.com/heimdall-cli/heimdall/internal/commands.Version=$pkgver' \
                  -X 'github.com/heimdall-cli/heimdall/internal/commands.Date=$(date -u '+%Y-%m-%d')' \
                  -s -w" \
        -o build/heimdall \
        ./cmd/heimdall
}

check() {
    cd "$srcdir/heimdall-$pkgver"
    go test ./...
}

package() {
    cd "$srcdir/heimdall-$pkgver"
    
    # Install binary
    install -Dm755 build/heimdall "$pkgdir/usr/bin/heimdall"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}