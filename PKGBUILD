# Maintainer: Marcelo Marfil <https://github.com/mmarfil>
pkgname=magic-trackpad-battery-git
pkgver=r3.4caed81
pkgrel=1
pkgdesc="Battery monitor daemon for Apple Magic Trackpad over Bluetooth"
arch=('any')
url="https://github.com/mmarfil/magic-trackpad-battery"
license=('MIT')
depends=('python' 'libnotify' 'bash')
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
    install -Dm644 99-magic-trackpad.rules "$pkgdir/usr/lib/udev/rules.d/99-magic-trackpad.rules"

    # Patch service ExecStart for packaged path
    sed 's|%h/.local/bin/magic-trackpad-battery|/usr/bin/magic-trackpad-battery|' \
        magic-trackpad-battery.service | \
        install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/magic-trackpad-battery.service"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
