# Maintainer: Isaac Arcia <iikz87ii@gmail.com>
pkgname=yawns
pkgver=1.1.1
pkgrel=1
pkgdesc="Your Adaptable Widget Notification System"
arch=('any')
url="https://github.com/ikz87/yawns/tree/main"
license=('GPL-3.0')
depends=(
    'python'
    'python-pyqt5'
    'python-dbus-next'
    'python-pillow'
    'python-cssutils'
    'python-xlib'
    'python-gobject'
)
source=("https://github.com/ikz87/yawns/archive/refs/tags/v$pkgver.zip")
sha256sums=('f6ae0dc8cb1bb64b8ccc0c27f17bd376814b2dfdfed0d40dac069d81ae13b17a')

# Custom variable for configuration files
_configdir="$pkgdir/etc/xdg/$pkgname"

package() {
    # Extract the source directory
    cd "$srcdir/$pkgname-$pkgver"

    # Install the main program
    install -Dm755 "src/app.py" "$pkgdir/usr/share/$pkgname/app.py"  # Correct path

    # Install Python files
    install -Dm644 "src/yawns_manager.py" "$pkgdir/usr/share/$pkgname/yawns_manager.py"
    install -Dm644 "src/yawns_notifications.py" "$pkgdir/usr/share/$pkgname/yawns_notifications.py"
    install -Dm644 "src/gtk_helpers.py" "$pkgdir/usr/share/$pkgname/gtk_helpers.py"

    # Install assets
    install -Dm644 "assets/yawns-logo.png" "$pkgdir/usr/share/$pkgname/assets/yawns-logo.png"
    install -Dm644 "assets/vinyl.png" "$pkgdir/usr/share/$pkgname/assets/vinyl.png"

    # Install configuration and style files to system-wide config directory
    install -Dm644 "src/style.qss" "$pkgdir/usr/share/$pkgname/style.qss"
    install -Dm644 "src/config.ini" "$pkgdir/usr/share/$pkgname/config.ini"

    # Create a wrapper script for first-run setup and execution
    install -Dm755 -d "$pkgdir/usr/bin"  # Ensure the directory exists for the wrapper script
    echo '#!/bin/bash
if [ ! -d "$HOME/.config/yawns" ]; then
    mkdir -p "$HOME/.config/yawns"
    cp -r /usr/share/yawns/* "$HOME/.config/yawns"
fi
exec python3 /usr/share/yawns/app.py "$@"' > "$pkgdir/usr/bin/$pkgname"
    chmod +x "$pkgdir/usr/bin/$pkgname"
}
