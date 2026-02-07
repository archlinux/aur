# Maintainer: Ninso112 <Ninso112@pm.me>
pkgname=rexit-git
pkgver=r20.4e33f53
pkgrel=1
pkgdesc="A rice-ready TUI power menu for Linux with multi-WM support"
arch=('x86_64' 'aarch64')
url="https://github.com/Ninso112/rexit"
license=('GPL-3.0')
depends=('systemd')
optdepends=(
    'hyprland: Hyprland support'
    'hyprlock: Screen locking for Hyprland'
    'swaylock: Screen locking for Sway'
    'i3lock: Screen locking for i3'
    'sway: Sway WM support'
    'i3-wm: i3 WM support'
    'bspwm: BSPWM support'
    'awesome: Awesome WM support'
)
makedepends=('git' 'cargo')
provides=('rexit')
conflicts=('rexit')
source=("$pkgname::git+https://github.com/Ninso112/rexit.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    ( set -o pipefail
      git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "$srcdir/$pkgname"

    # Install binary
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/rexit"

    # Install themes
    install -dm755 "$pkgdir/usr/share/rexit/themes"
    for theme in assets/*.toml; do
        if [ -f "$theme" ]; then
            install -Dm0644 "$theme" "$pkgdir/usr/share/rexit/themes/"
        fi
    done

    # Install man page if it exists
    if [ -f "assets/rexit.1" ]; then
        install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "assets/rexit.1"
    fi

    # Install license
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"

    # Install README
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "README.md"
}
