# Maintainer: Matt Warner<mattwarner001@gmail.com>
pkgname=webcam-toggle
pkgver=1.0.0
pkgrel=1
pkgdesc="Toggle the webcam via USB bind/unbind with a tray indicator, keyboard shortcut support, and desktop notifications"
arch=('any')
license=('MIT')
depends=(
    'bash'
    'python'
    'gtk3'
    'xapp'
    'libnotify'
    'sudo'
    'systemd'
)
backup=(
    'etc/sudoers.d/webcam-toggle'
    'etc/xdg/autostart/webcam-toggle-indicator.desktop'
)
install=webcam-toggle.install
source=(
    'webcam-toggle'
    'webcam-toggle-restore'
    'webcam-toggle-restore.service'
    'webcam-toggle-setup'
    'webcam-toggle-shortcut'
    'webcam-toggle-indicator'
    'webcam-toggle-indicator.desktop'
    'webcam-toggle-sudoers'
)
sha256sums=('9151293f8b0e4a2e624883d00f6db40d29474ec62c54eaaf11fa41a59d996f89'
            'd6d9926fa08d1c6e1723e7b286a7d3d3f40926c44a5bfa848825d5f3d0816b85'
            '889a6caef4479a208ccedee80e9f4a99e9560c99c5eb9c1155e08a1b96c4ebc1'
            '8a99795757d53ce51b33117e4e592b7b1360105e85665f4fb5670a97bbb10334'
            '57c713ceb3241842f3837ffca77a88d045967f7536157839fa49cab03fed3719'
            '701374f4fd61bd5a8aef9e1ad4a7e7dbafa69521b14566cfdf625f89545393ea'
            '509cb03b43d99512f2ae764cd2e2b336c4b8d5e264dd5ccd381246dc120d0e0a'
            'f8ae9f105df24b1832328b00118b2c76fe0d13c76db5eab0ccb7d7812af94769')

package() {
    # Core toggle script (runs as root via sudo, passwordless)
    install -Dm755 "$srcdir/webcam-toggle" \
        "$pkgdir/usr/bin/webcam-toggle"

    # Boot-time state restore script
    install -Dm755 "$srcdir/webcam-toggle-restore" \
        "$pkgdir/usr/bin/webcam-toggle-restore"

    # Interactive setup script (runs as root via sudo, password required)
    install -Dm755 "$srcdir/webcam-toggle-setup" \
        "$pkgdir/usr/bin/webcam-toggle-setup"

    # Keyboard-shortcut wrapper (runs as user)
    install -Dm755 "$srcdir/webcam-toggle-shortcut" \
        "$pkgdir/usr/bin/webcam-toggle-shortcut"

    # Tray indicator (runs as user)
    install -Dm755 "$srcdir/webcam-toggle-indicator" \
        "$pkgdir/usr/bin/webcam-toggle-indicator"

    # sudoers drop-in — directory must be 0750 to match the sudo package,
    # and the file itself must be 0440 or sudo ignores it.
    install -dm750 "$pkgdir/etc/sudoers.d"
    install -m440 "$srcdir/webcam-toggle-sudoers" \
        "$pkgdir/etc/sudoers.d/webcam-toggle"

    # systemd service to restore webcam state at boot
    install -Dm644 "$srcdir/webcam-toggle-restore.service" \
        "$pkgdir/usr/lib/systemd/system/webcam-toggle-restore.service"

    # Autostart desktop entry
    install -Dm644 "$srcdir/webcam-toggle-indicator.desktop" \
        "$pkgdir/etc/xdg/autostart/webcam-toggle-indicator.desktop"

    # State directory — world-readable so the indicator can check the marker
    install -dm755 "$pkgdir/var/lib/webcam-toggle"
}
