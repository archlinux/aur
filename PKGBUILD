# Maintainer: Your Name <your.email@example.com>
pkgname=gnome-aur-manager
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern GNOME application to browse and manage AUR packages with GTK4 and Libadwaita"
arch=('any')
url="https://github.com/OMNIDROID2995/gnome-aur-manager"
license=('GPL-3.0-or-later')
depends=(
    'python>=3.10'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'yay'
    'gnome-console'
    'pacman'
)
optdepends=(
    'gnome-software-packagekit-plugin: Integration with GNOME Software Center'
)
makedepends=()
provides=("${pkgname}")
conflicts=()
backup=()

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OMNIDROID2995/gnome-aur-manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('24a25b240346649c5cf57eda3a44a7f0b72d4a2469fca45474127265321c4fd9')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Install Python source files
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 src/*.py "${pkgdir}/usr/lib/${pkgname}/"
    
    # Install translation strings
    install -dm755 "${pkgdir}/usr/lib/${pkgname}/strings"
    install -Dm644 src/strings/*.txt "${pkgdir}/usr/lib/${pkgname}/strings/"
    
    # Install icon
    install -Dm644 src/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

    # Install disclaimer files (all languages)
    install -Dm644 src/disclaimer-*.txt "${pkgdir}/usr/lib/${pkgname}/"
    
    # Install widgets (if they exist)
    # Note: widgets directory exists but is empty in current version
    # if [ -d "src/widgets" ]; then
    #     install -dm755 "${pkgdir}/usr/lib/${pkgname}/widgets"
    #     install -Dm644 src/widgets/*.py "${pkgdir}/usr/lib/${pkgname}/widgets/" 2>/dev/null || true
    # fi
    
    # Install .desktop file
    install -Dm644 gnome-aur-manager.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    # Install documentation
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/"
    
    # Create executable wrapper
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/bash
cd /usr/lib/gnome-aur-manager
exec python main.py "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
