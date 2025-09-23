# Maintainer: lone-cloud <hoboman313@proton.me>
pkgname=gerbil
pkgver=1.5.0
pkgrel=1
pkgdesc="Run Large Language Models locally"
arch=('x86_64')
url="https://github.com/lone-cloud/gerbil"
license=('AGPL-3.0-or-later')
depends=('gtk3' 'nss')
optdepends=('alsa-lib: Audio support for sound effects'
           'libxss: Screen saver detection support')
provides=('gerbil')
conflicts=('gerbil-git')
source=("gerbil-${pkgver}.AppImage::https://github.com/lone-cloud/gerbil/releases/download/v1.5.0/Gerbil-1.5.0.AppImage"
        "gerbil.desktop::https://raw.githubusercontent.com/lone-cloud/gerbil/v1.5.0/assets/gerbil.desktop")
sha256sums=('a42ccf0765a5450936da20820f98cd03b00d4fe7b0c1ebda36d4cacb108675df'
            'da139b72a1d0965c1fe7749cb93c2ef50c00d551f7b884ed9296db3114283893')

prepare() {
    chmod +x "gerbil-${pkgver}.AppImage"
    "./gerbil-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install the application
    install -dm755 "${pkgdir}/opt/gerbil"
    cp -r squashfs-root/* "${pkgdir}/opt/gerbil/"
    
    # Fix permissions on extracted files
    chmod -R 755 "${pkgdir}/opt/gerbil/"
    
    # Create executable wrapper
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/gerbil" << 'WRAPPER'
#!/bin/bash
exec "/opt/gerbil/Gerbil" "$@"
WRAPPER
    chmod +x "${pkgdir}/usr/bin/gerbil"
    
    # Install desktop file from assets
    install -dm755 "${pkgdir}/usr/share/applications"
    cp "${srcdir}/gerbil.desktop" "${pkgdir}/usr/share/applications/"
    
    # Install icon to hicolor theme directory and pixmaps as fallback
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "${pkgdir}/usr/share/pixmaps"

    if [ -f "${pkgdir}/opt/gerbil/usr/share/icons/hicolor/512x512/apps/Gerbil.png" ]; then
        cp "${pkgdir}/opt/gerbil/usr/share/icons/hicolor/512x512/apps/Gerbil.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gerbil.png"
        cp "${pkgdir}/opt/gerbil/usr/share/icons/hicolor/512x512/apps/Gerbil.png" "${pkgdir}/usr/share/pixmaps/gerbil.png"
    else
        echo "Warning: Could not find Gerbil.png in expected locations"
        find "${pkgdir}/opt/gerbil" -name "*erbil*.png" -type f | head -1 | while read icon_file; do
            if [ -n "$icon_file" ]; then
                echo "Found icon at: $icon_file"
                cp "$icon_file" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gerbil.png"
                cp "$icon_file" "${pkgdir}/usr/share/pixmaps/gerbil.png"
            fi
        done
    fi
}
