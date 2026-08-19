# Maintainer: ekoputrapratama <ekoputrapratama@github.com>
pkgname=webkit-wallpaper
pkgver=0.1.0
pkgrel=1
pkgdesc="Linux desktop wallpaper powered by a webview - use any web page or WebGL shader as your background"
arch=('any')
url="https://github.com/ekoputrapratama/webkit_wallpaper"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk3'
    'webkit2gtk-4.1'
)
makedepends=(
    'python-setuptools'
)
optdepends=(
    'gtk-layer-shell: Wayland layer shell support (Sway, Hyprland, COSMIC, KDE)'
    'libayatana-appindicator: System tray icon'
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/webkit_wallpaper-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/webkit_wallpaper-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    # Install desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=WebKit Wallpaper
Comment=Web-based desktop wallpaper
Exec=webkit_wallpaper
Icon=preferences-desktop-wallpaper
Terminal=false
StartupNotify=false
Categories=Utility;
EOF

    # Install icon
    install -Dm644 "webkit_wallpaper/assets/webkit-wallpaper.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
