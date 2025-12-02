# Maintainer: ComputerElite <ComputerElite.dev@gmail.com>
pkgname=shock-alarm
pkgver=0.4.2
pkgrel=1
pkgdesc="A flutter app for controlling OpenShock devices"
arch=('x86_64')
url="https://github.com/ComputerElite/ShockAlarmApp"
license=('GPL3')
depends=(
    'gtk3'
    'libnotify'
    'libsystemd'
    'xdg-utils'
)
source=("https://github.com/ComputerElite/ShockAlarmApp/releases/download/${pkgver}/shock_alarm_linux_x64_refs.tags.${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    # Create installation directories
    install -d "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/usr/bin"

    # Extract and copy release files
    tar -xzf "$srcdir/shock_alarm_linux_x64_refs.tags.${pkgver}.tar.gz" -C "$pkgdir/opt/$pkgname"

    # Create symlink for binary
    ln -s "/opt/$pkgname/shock_alarm" "$pkgdir/usr/bin/shock-alarm"

    # Desktop file handling (create if not included in release)
    install -d "$pkgdir/usr/share/applications"
    cat << EOF > "$pkgdir/usr/share/applications/shock-alarm.desktop"
[Desktop Entry]
Name=Shock Alarm
Comment=${pkgdesc}
Exec=/usr/bin/shock-alarm
Icon=shock-alarm
Terminal=false
Type=Application
Categories=Utility;
EOF

    # Icon handling (create if not included in release)
    install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    cp "$pkgdir/opt/$pkgname/data/flutter_assets/icon.png" \
       "$pkgdir/usr/share/icons/hicolor/512x512/apps/shock-alarm.png"

    # License file (if included in release)
    if [ -f "$pkgdir/opt/$pkgname/LICENSE" ]; then
        install -Dm644 "$pkgdir/opt/$pkgname/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}