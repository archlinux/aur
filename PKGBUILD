# Maintainer: Christopher Dorrell <dorrellkc@gmail.com>
pkgname=tux-assistant
pkgver=1.0.2
pkgrel=1
pkgdesc="GTK4/Libadwaita Linux system configuration tool - simplifies post-installation setup"
arch=('any')
url="https://github.com/dorrellkc/Tux-Assistant"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'python-requests'
    'polkit'
    'python-dbus'
    'webkit2gtk-4.1'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'hicolor-icon-theme'
)
optdepends=(
    'speedtest-cli: for network speed tests'
    'samba: for network file sharing'
    'gnome-shell: for GNOME extension management'
    'gst-plugins-ugly: for additional audio format support'
    'gst-plugins-bad: for additional audio format support'
)
install=tux-assistant.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/dorrellkc/Tux-Assistant/archive/refs/tags/v$pkgver.tar.gz"
        "tux-assistant.install")
sha256sums=('00fc1b9854257d1f1cdd73606104c84a7cf4b417f7708d66270642b6fc3e7f86'
            'SKIP')

package() {
    cd "$srcdir/Tux-Assistant-$pkgver"
    
    # Install to /opt/tux-assistant
    install -dm755 "$pkgdir/opt/tux-assistant"
    cp -r tux "$pkgdir/opt/tux-assistant/"
    cp -r assets "$pkgdir/opt/tux-assistant/"
    cp -r data "$pkgdir/opt/tux-assistant/"
    cp -r scripts "$pkgdir/opt/tux-assistant/"
    install -Dm755 tux-assistant.py "$pkgdir/opt/tux-assistant/"
    install -Dm755 tux-helper "$pkgdir/opt/tux-assistant/"
    install -Dm644 VERSION "$pkgdir/opt/tux-assistant/"
    
    # Install Tux Assistant launcher script
    install -dm755 "$pkgdir/usr/bin"
    echo '#!/bin/bash' > "$pkgdir/usr/bin/tux-assistant"
    echo 'cd /opt/tux-assistant && python tux-assistant.py "$@"' >> "$pkgdir/usr/bin/tux-assistant"
    chmod 755 "$pkgdir/usr/bin/tux-assistant"
    
    # Install Tux Tunes launcher script
    echo '#!/bin/bash' > "$pkgdir/usr/bin/tux-tunes"
    echo 'python /opt/tux-assistant/tux/apps/tux_tunes/tux-tunes.py "$@"' >> "$pkgdir/usr/bin/tux-tunes"
    chmod 755 "$pkgdir/usr/bin/tux-tunes"
    
    # Install tux-helper to /usr/bin
    install -Dm755 tux-helper "$pkgdir/usr/bin/tux-helper"
    
    # Install desktop files
    install -Dm644 data/com.tuxassistant.app.desktop "$pkgdir/usr/share/applications/com.tuxassistant.app.desktop"
    install -Dm644 data/com.tuxassistant.tuxtunes.desktop "$pkgdir/usr/share/applications/com.tuxassistant.tuxtunes.desktop"
    
    # Install icons
    install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tux-assistant.svg"
    install -Dm644 assets/tux-tunes.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tux-tunes.svg"
    
    # Install polkit policy
    install -Dm644 data/com.tuxassistant.helper.policy "$pkgdir/usr/share/polkit-1/actions/com.tuxassistant.helper.policy"
}
