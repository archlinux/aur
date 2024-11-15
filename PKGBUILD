# Maintainer: Ariadna Ardere arxofari@proton.me
pkgname=openshockclock-git
pkgver=r13.78f1e56
pkgrel=1
pkgdesc="GTK4/Libadwaita alarm clock application for OpenShock devices"
arch=('any')
url="https://github.com/arxari/openshockclock-gtk"
license=('GPL3')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'python-requests'
    'python-dotenv'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/arxari/openshockclock-gtk.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/openshockclock-gtk"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/openshockclock-gtk"
    
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/${pkgname%-git}"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    
    install -Dm755 openshockclock-gtk.py "$pkgdir/usr/share/${pkgname%-git}/"
    
    install -Dm644 icons/openshockclock.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
    
    cat > "$pkgdir/usr/share/applications/${pkgname%-git}.desktop" << EOF
[Desktop Entry]
Name=OpenShockClock
Comment=Alarm clock application for OpenShock devices
Exec=/usr/bin/openshockclock
Icon=${pkgname%-git}
Terminal=false
Type=Application
Categories=Utility;
EOF

    chmod 644 "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"

    cat > "$pkgdir/usr/bin/openshockclock" << EOF
#!/bin/sh
exec python /usr/share/${pkgname%-git}/openshockclock-gtk.py "\$@"
EOF

    chmod 755 "$pkgdir/usr/bin/openshockclock"
}

