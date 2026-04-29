# Maintainer: Jaeho Cho <jaehho@github>
pkgname=hypr-wallpaper-git
_pkgname=hypr-wallpaper
_repo=hypr-tools
pkgver=0.0.0
pkgrel=1
pkgdesc='Per-monitor wallpaper manager and ratatui TUI for Hyprland (Rust)'
arch=('x86_64')
url='https://github.com/jaehho/hypr-tools'
license=('MIT')
depends=('hyprland' 'sqlite' 'libnotify')
optdepends=(
    'awww: wayland wallpaper daemon backend'
    'kitty: terminal for the TUI (any terminal works)'
)
makedepends=('git' 'rust' 'cargo')
# rusqlite's bundled sqlite is built via cc-rs; with makepkg's default
# -flto=auto, GCC emits LTO IR-only objects and rust-lld can't consume
# them, producing undefined sqlite3_* at link time.
options=('!lto')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_repo"
    git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$_repo"
    cargo build --release --locked --bin hypr-wallpaper
}

check() {
    cd "$_repo"
    cargo test --release --locked -p hypr-wallpaper -p hypr-ipc
}

package() {
    cd "$_repo"
    install -Dm755 target/release/hypr-wallpaper "$pkgdir/usr/bin/hypr-wallpaper"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 config/hypr-wallpaper.config.toml "$pkgdir/usr/share/$_pkgname/config.toml.default"
    install -Dm644 config/hypr-wallpaper.rules.toml  "$pkgdir/usr/share/$_pkgname/rules.toml.default"
}
