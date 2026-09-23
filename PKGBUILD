# Maintainer: Tanay Pant <tanaypant@protonmail.com>

pkgname=bearbar-git
pkgver=0.1.0.r4.gee6879a
pkgrel=1
pkgdesc="Compact GTK4 desktop bar for Hyprland, Niri, Sway, and KDE Plasma"
arch=('x86_64')
url="https://github.com/tanay1337/bearbar"
license=('MIT')
depends=(
    'glib2'
    'glibc'
    'gtk4>=4.12'
    'gtk4-layer-shell>=1'
    'libgcc'
    'libpulse'
    'upower'
)
makedepends=(
    'git'
    'rust>=1.92'
)
optdepends=(
    'bluez-utils: Bluetooth controls'
    'brightnessctl: brightness controls'
    'cliphist: clipboard history'
    'networkmanager: Wi-Fi controls'
    'pipewire: privacy indicators'
    'playerctl: media controls'
    'power-profiles-daemon: power profile controls'
    'swaync: notification count and panel integration'
    'wl-clipboard: clipboard history restoration'
)
provides=('bearbar')
conflicts=('bearbar')
options=('!debug')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    local _version
    _version=$(sed -n 's/^version = "\([^"]*\)"/\1/p' Cargo.toml | head -n 1)
    printf "%s.r%s.g%s" \
        "$_version" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$pkgname"

    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

check() {
    cd "$pkgname"

    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --all-targets
}

package() {
    cd "$pkgname"

    install -Dm755 target/release/bearbar "$pkgdir/usr/bin/bearbar"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 assets/bearbar-logo.svg \
        "$pkgdir/usr/share/doc/$pkgname/assets/bearbar-logo.svg"
    install -Dm644 examples/config.toml \
        "$pkgdir/usr/share/doc/$pkgname/examples/config.toml"
    install -Dm644 examples/config.apple.toml \
        "$pkgdir/usr/share/doc/$pkgname/examples/config.apple.toml"
    install -Dm644 examples/style.css \
        "$pkgdir/usr/share/doc/$pkgname/examples/style.css"
    install -Dm644 contrib/bearbar.service \
        "$pkgdir/usr/lib/systemd/user/bearbar.service"
    sed -i 's|ExecStart=%h/.local/bin/bearbar|ExecStart=/usr/bin/bearbar|' \
        "$pkgdir/usr/lib/systemd/user/bearbar.service"
}
