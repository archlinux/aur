# Maintainer: Jaeho Cho <jaehho@github>
pkgname=hypr-wallpaper-git
_pkgname=hypr-wallpaper
pkgver=1.0.0
pkgrel=1
pkgdesc='SQLite-backed, quality-gated, time-aware wallpaper manager and TUI for Hyprland'
arch=('any')
url='https://github.com/jaehho/hypr-wallpaper'
license=('MIT')
depends=('hyprland' 'python' 'jq' 'sqlite' 'curl' 'socat' 'libnotify' 'xdg-utils')
optdepends=(
    'swww: wallpaper setter daemon'
    'rofi: GUI menu mode'
)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd "$_pkgname"
    git submodule update --init --recursive
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install-bin
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 config/config     "$pkgdir/usr/share/$_pkgname/config.default"
    install -Dm644 config/rules.toml "$pkgdir/usr/share/$_pkgname/rules.toml.default"
}
