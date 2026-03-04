# Maintainer: OMNIDROID2995 <basti29kuehn@googlemail.com>
pkgname=gnome-aur-manager
pkgver=2.0.0
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
    'vte4'
    'yay'
    'pacman'
)
optdepends=(
    'gnome-console: Required for AppStream PackageKit one-click setup in disclaimer'
    'gnome-software-packagekit-plugin: Integration with GNOME Software Center'
)
makedepends=()
provides=("${pkgname}")
conflicts=()
backup=()

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OMNIDROID2995/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d08df50e2a9bbd487c1258bca610c8bc3675e1a3f35f0cff679ca95f15336d0')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Install Python source files
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 src/*.py "${pkgdir}/usr/lib/${pkgname}/"
    
    # Install translation strings
    install -dm755 "${pkgdir}/usr/lib/${pkgname}/strings"
    install -Dm644 src/strings/*.txt "${pkgdir}/usr/lib/${pkgname}/strings/"
    
    # Install disclaimer files (all languages)
    install -Dm644 src/disclaimer-*.txt "${pkgdir}/usr/lib/${pkgname}/"
    
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
