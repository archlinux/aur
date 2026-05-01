# Maintainer: viewerofal <joemomanugget@gmail.com>
pkgname=woven-shell-git
pkgver=1.4.0
pkgrel=1
pkgdesc="Complete Wayland shell for Sway — bar, launcher, lock, wallpaper, power menu, control center, config manager, OSD, screenshot, workspace switcher, and session daemon"
arch=('x86_64')
url="https://github.com/viewerofall/woven-shell"
license=('MIT')
depends=('sway' 'wireplumber' 'brightnessctl' 'playerctl' 'swaync' 'pam' 'slurp' 'grim')
makedepends=('rust' 'cargo')
source=("woven-shell-$pkgver.tar.gz::https://github.com/viewerofall/woven-shell/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c16542eae816ed87bdeee79be2b312c094b4577369dbe61f9dc76e58981d0b36')

build() {
    cd "woven-shell-$pkgver"
    cargo build --release
}

package() {
    cd "woven-shell-$pkgver"

    local bins=(woven-bar woven-power woven-cc woven-launch woven-lock woven-wall woven-pick woven-cfg woven-osd woven-screenshot woven-session woven-switch)
    for bin in "${bins[@]}"; do
        install -Dm755 "target/release/$bin" "$pkgdir/usr/bin/$bin"
    done

    install -d "$pkgdir/usr/share/woven-shell/config"
    cp config/*.toml "$pkgdir/usr/share/woven-shell/config/"

    if [ -d "config/themes" ]; then
        install -d "$pkgdir/usr/share/woven-shell/config/themes"
        cp config/themes/*.toml "$pkgdir/usr/share/woven-shell/config/themes/" 2>/dev/null || true
    fi

    install -Dm644 get.sh "$pkgdir/usr/share/woven-shell/get.sh"
    install -Dm644 woven-session.service "$pkgdir/usr/lib/systemd/user/woven-session.service"
}
