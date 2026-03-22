# Maintainer: Vinay Yadav <vinayydv343@gmail.com>
pkgname=tsubasaflow-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Modern desktop BitTorrent client with cloud debrid integration (binary release)"
arch=('x86_64')
url="https://github.com/vinayydv3695/Tsubasa-"
license=('MIT')
depends=('fuse2' 'gtk3' 'webkit2gtk' 'libayatana-appindicator')
provides=('tsubasaflow')
conflicts=('tsubasaflow')
source=("https://github.com/vinayydv3695/Tsubasa-/releases/download/v${pkgver}/Tsubasa_${pkgver}_amd64.AppImage"
        "tsubasaflow.desktop"
        "tsubasaflow.sh")
sha256sums=('b60983b6b007fcc72b7692ed9d6357bf633fbe1e67364bdb92791f6ab8ca82a4'
            '4de2b9cb5232a08400af1dc0de533a76eb6f26a5d5efe1667a5c137e12f2b2d4'
            '4deb4fad64e0164bb132bfb27997eddbbadb2d4252c1f8f581672a86fcbc8025')

prepare() {
    chmod +x "${srcdir}/Tsubasa_${pkgver}_amd64.AppImage"
    
    "${srcdir}/Tsubasa_${pkgver}_amd64.AppImage" --appimage-extract >/dev/null 2>&1 || true
}

package() {
    cd "${srcdir}/squashfs-root"
    
    # Install main binary
    install -Dm755 usr/bin/tsubasa "${pkgdir}/usr/lib/tsubasaflow/tsubasa"
    
    # Install all library dependencies and resources
    cp -a usr/lib/* "${pkgdir}/usr/lib/tsubasaflow/" 2>/dev/null || true
    
    # Install launcher wrapper
    install -Dm755 "${srcdir}/tsubasaflow.sh" "${pkgdir}/usr/bin/tsubasaflow"
    
    # Install icons
    for size in 32x32 128x128 256x256; do
        if [ -f "usr/share/icons/hicolor/${size}/apps/"*.png ]; then
            install -Dm644 usr/share/icons/hicolor/${size}/apps/*.png \
                "${pkgdir}/usr/share/icons/hicolor/${size}/apps/tsubasaflow.png"
        fi
    done
    
    # Install desktop file
    install -Dm644 "${srcdir}/tsubasaflow.desktop" \
        "${pkgdir}/usr/share/applications/tsubasaflow.desktop"
}
