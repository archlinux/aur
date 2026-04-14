# Maintainer: Jaeho Cho <jaehho@github>
pkgname=hypr-monitor-git
_pkgname=hypr-monitor
_repo=hypr-tools
pkgver=0.0.0
pkgrel=1
pkgdesc='Monitor layout + workspace daemon and ratatui TUI for Hyprland (Rust)'
arch=('x86_64')
url='https://github.com/jaehho/hypr-tools'
license=('MIT')
depends=('hyprland' 'libnotify')
makedepends=('git' 'rust' 'cargo')
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
    cargo build --release --locked --bin hypr-monitor
}

check() {
    cd "$_repo"
    cargo test --release --locked -p hypr-monitor -p hypr-ipc
}

package() {
    cd "$_repo"
    install -Dm755 target/release/hypr-monitor "$pkgdir/usr/bin/hypr-monitor"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 config/hypr-monitor.config.toml "$pkgdir/usr/share/$_pkgname/config.toml.default"
    install -Dm644 systemd/hypr-monitor.service    "$pkgdir/usr/lib/systemd/user/hypr-monitor.service"
}
