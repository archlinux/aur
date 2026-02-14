# Maintainer: Your Name <your.email@example.com>
# Contributor: Maxnights

pkgname=simple-linux-wallpaperengine-gui-git
pkgver=r10.456549c  # This will be automatically updated by pkgver()
pkgrel=2
pkgdesc="A modern, universal GUI for linux-wallpaperengine"
arch=('any')
url="https://github.com/Maxnights/simple-linux-wallpaperengine-gui"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-pillow' 'python-watchdog' 'linux-wallpaperengine')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname%-git}"

    # Install main script and locales
    install -d "$pkgdir/usr/lib/${pkgname%-git}"
    install -m755 wallpaper_gui.py "$pkgdir/usr/lib/${pkgname%-git}/wallpaper_gui.py"
    cp -r locales "$pkgdir/usr/lib/${pkgname%-git}/"

    # Create launcher script in /usr/bin
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/simple-wallpaper-engine" <<EOF
#!/bin/sh
exec /usr/bin/python3 /usr/lib/${pkgname%-git}/wallpaper_gui.py "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/simple-wallpaper-engine"

    # Install desktop entry
    install -Dm644 simple-wallpaper-engine.desktop "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}
