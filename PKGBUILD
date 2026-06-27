# Maintainer: Chau Van Loc <chauvanloc01 at gmail dot com>

pkgname=hyprmon
pkgver=1.1.1
pkgrel=1
pkgdesc="TUI for Hyprland monitor configuration"
arch=('x86_64')
url="https://github.com/ChauVanLoc01/hyprmon"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Hyprmon
Comment=TUI for Hyprland monitor configuration
Exec=hyprmon
Icon=preferences-desktop-display
Terminal=true
Type=Application
Categories=Settings;HardwareSettings;
Keywords=monitor;display;screen;hyprland;
EOF
}
