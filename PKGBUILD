pkgname=plaster
pkgver=0.1.0_beta2
pkgrel=1
pkgdesc="Dynamic wallpaper and ambient theme manager for GNOME"
arch=('any')
url="https://github.com/sanoguel/plaster"
license=('GPL3')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-pywal' 'python-pystray')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sanoguel/plaster/archive/refs/tags/v0.1.0-beta2.tar.gz")
sha256sums=('431db61ea3468877b112bf21f4017f67dad1374e613a493ab7bf6819b9b1ffb2')

package() {
    cd "plaster-0.1.0-beta2"

    # 1. Install project files and assets to system-wide share directory
    install -d "$pkgdir/usr/share/plaster"
    cp -r plaster assets pyproject.toml requirements.txt "$pkgdir/usr/share/plaster/"

    # 2. Create the system-wide launch script dynamically
    install -d "$pkgdir/usr/bin"
    cat << EOF > "$pkgdir/usr/bin/plaster"
#!/usr/bin/env bash
cd "/usr/share/plaster"
exec python3 -m plaster.main
EOF
    chmod +x "$pkgdir/usr/bin/plaster"

    # 3. Install the .desktop shortcut system-wide
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/plaster.desktop" << EOF
[Desktop Entry]
Type=Application
Name=Plaster
Comment=Dynamic Wallpaper Manager
Exec=/usr/bin/plaster
Icon=plaster
Terminal=false
Categories=Utility;
EOF

    # 4. Install the scalable icon
    if [ -f "assets/plaster.svg" ]; then
        install -Dm644 assets/plaster.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/plaster.svg"
    elif [ -f "assets/plaster.png" ]; then
        install -Dm644 assets/plaster.png "$pkgdir/usr/share/icons/hicolor/scalable/apps/plaster.png"
    fi
}
