# Maintainer: command-z-z <zyj18395965717@gmail.com>
pkgname=widgex-git
pkgver=r13.90d5620
pkgrel=1
pkgdesc="Modern widget runtime for Wayland/Hyprland, inspired by Eww, AGS and Quickshell"
arch=('x86_64')
url="https://github.com/command-z-z/widgex"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'gtk-layer-shell'
)
makedepends=(
    'git'
    'rust'
    'cargo'
    'nodejs'
    'npm'
)
optdepends=(
    'python: for Python-based data sources'
    'jq: for JSON shell sources'
)
provides=('widgex')
conflicts=('widgex')
source=("$pkgname::git+https://github.com/command-z-z/widgex.git"
        "widgex.service")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # Build the SolidJS renderer bundle first — rust-embed embeds it at compile time
    cd apps/renderer
    npm ci
    npm run build
    cd ../..

    cargo build --frozen --release
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --workspace
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/widgex"  "$pkgdir/usr/bin/widgex"
    install -Dm755 "target/release/widgexd" "$pkgdir/usr/bin/widgexd"

    install -Dm644 "LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "ISSUE.md"  "$pkgdir/usr/share/doc/$pkgname/ISSUE.md"

    # systemd user service
    install -Dm644 "$srcdir/widgex.service" \
        "$pkgdir/usr/lib/systemd/user/widgex.service"
}
