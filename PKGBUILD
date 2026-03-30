# Maintainer: Meliodas8 <marticolelmolina@gmail.com>
pkgname=gametracker
pkgver=1.0.29
pkgrel=1
pkgdesc="GameTracker - Gestiona y sigue tu colección de videojuegos"
arch=('x86_64')
url="https://github.com/Meliodas8/GameTracker"
license=('MIT')
depends=('fuse2' 'java-runtime>=21')
source=("GameTracker-${pkgver}-x86_64.AppImage::https://github.com/Meliodas8/GameTracker/releases/download/v${pkgver}/GameTracker-x86_64.AppImage")
sha256sums=('c0e00a33bdd149577faf306da0feb36b3a54bdd0cf185ec88969879cd6b2ffc5')
options=('!strip')

prepare() {
    chmod +x "${srcdir}/GameTracker-${pkgver}-x86_64.AppImage"
    "${srcdir}/GameTracker-${pkgver}-x86_64.AppImage" --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/opt/gametracker"
    cp -r "${srcdir}/squashfs-root/." "${pkgdir}/opt/gametracker/"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${srcdir}/gametracker-launcher" << 'EOF'
#!/bin/bash
exec /opt/gametracker/AppRun "$@"
EOF
    install -Dm755 "${srcdir}/gametracker-launcher" "${pkgdir}/usr/bin/gametracker"

    install -Dm644 "${srcdir}/squashfs-root/gametracker.desktop" "${pkgdir}/usr/share/applications/gametracker.desktop"
    install -Dm644 "${srcdir}/squashfs-root/gametracker.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gametracker.png"
}
