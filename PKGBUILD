# Maintainer: Marcelo Marfil <https://github.com/mmarfil>
pkgname=magic-trackpad-battery-git
pkgver=r8.4a78665
pkgrel=1
pkgdesc="Battery monitor and auto-connect for Apple Magic Trackpad over Bluetooth"
arch=('any')
url="https://github.com/mmarfil/magic-trackpad-battery"
license=('MIT')
depends=('python' 'libnotify' 'bash' 'bluez-utils')
makedepends=('git')
provides=('magic-trackpad-battery')
conflicts=('magic-trackpad-battery')
source=("git+https://github.com/mmarfil/magic-trackpad-battery.git")
sha256sums=('SKIP')

pkgver() {
    cd magic-trackpad-battery
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd magic-trackpad-battery

    install -Dm755 magic-trackpad-battery "$pkgdir/usr/bin/magic-trackpad-battery"
    install -Dm755 magic-trackpad-battery-waybar "$pkgdir/usr/bin/magic-trackpad-battery-waybar"
    install -Dm755 magic-trackpad-connect "$pkgdir/usr/bin/magic-trackpad-connect"
    install -Dm644 99-magic-trackpad.rules "$pkgdir/usr/lib/udev/rules.d/99-magic-trackpad.rules"

    # Patch service ExecStart paths for packaged install
    for unit in magic-trackpad-battery.service magic-trackpad-autoconnect.service; do
        sed 's|%h/.local/bin/|/usr/bin/|' "$unit" > "$unit.pkg"
        install -Dm644 "$unit.pkg" "$pkgdir/usr/lib/systemd/user/$unit"
    done
    install -Dm644 magic-trackpad-autoconnect.timer "$pkgdir/usr/lib/systemd/user/magic-trackpad-autoconnect.timer"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
