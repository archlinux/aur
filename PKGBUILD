# Maintainer: Vasu Jain <vasujain275@gmail.com>

pkgname=coursefin
pkgver=0.5.0
pkgrel=1
pkgdesc='Desktop application for managing and watching offline course content'
arch=('x86_64')
url='https://github.com/vasujain275/coursefin'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav')
makedepends=('go>=1.24' 'pnpm' 'nodejs' 'pkgconf' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vasujain275/coursefin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Set up isolated Go module cache to avoid polluting the system
    export GOPATH="$srcdir/gopath"
    export PATH="$GOPATH/bin:$PATH"

    # Install Wails CLI (not in official Arch repos — must install via go install)
    go install github.com/wailsapp/wails/v2/cmd/wails@latest

    # Install sqlc CLI (required to generate Go code from SQL queries before build)
    go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest

    # Install frontend dependencies (frozen lockfile ensures reproducibility)
    pnpm --dir frontend install --frozen-lockfile
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export GOPATH="$srcdir/gopath"
    export PATH="$GOPATH/bin:$PATH"

    # Respect system compiler flags for hardening / optimisation
    export CGO_CFLAGS="${CFLAGS:-}"
    export CGO_CXXFLAGS="${CXXFLAGS:-}"
    export CGO_LDFLAGS="${LDFLAGS:-}"

    # Build as position-independent executable (security best practice)
    export GOFLAGS="-buildmode=pie"

    # Generate type-safe Go code from SQL queries — MUST run before wails build
    sqlc generate

    # Build the Wails application
    # -tags webkit2_41  required for webkit2gtk-4.1 (linker errors without it)
    # -trimpath         strips build paths for reproducibility (AUR best practice)
    wails build \
        -platform linux/amd64 \
        -clean \
        -o coursefin \
        -ldflags "-X main.version=$pkgver" \
        -tags webkit2_41 \
        -trimpath
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Main binary
    install -Dm755 build/bin/coursefin "$pkgdir/usr/bin/coursefin"

    # Desktop entry
    install -Dm644 packaging/coursefin.desktop "$pkgdir/usr/share/applications/coursefin.desktop"

    # Application icon (512×512 PNG)
    install -Dm644 build/appicon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/coursefin.png"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Clean up Go module cache to avoid bloating the package build directory
    go clean -modcache
}
