# Maintainer: André LECLERCQ <andre.leclercq.io@protonmail.com>
pkgname=mattermost-desktop-bin
pkgver=6.0.2
pkgrel=1
pkgdesc="Mattermost Desktop application (precompiled binary)"
arch=('x86_64')
url="https://mattermost.com/"
license=('Apache-2.0')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'at-spi2-core' 'libcups' 'libxrandr')
provides=('mattermost-desktop')
conflicts=('mattermost-desktop')
source=("mattermost-desktop-${pkgver}-linux-x64.tar.gz::https://releases.mattermost.com/desktop/${pkgver}/mattermost-desktop-${pkgver}-linux-x64.tar.gz")
sha256sums=('339d79bf1285bb9a3eb9fad5c4c6210365a0600243fae8c68defdee6ee6fbdfb')
options=('!strip')

package() {
    cd "${srcdir}/mattermost-desktop-${pkgver}-linux-x64"
    
    # Installation des fichiers dans /opt
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r * "${pkgdir}/opt/${pkgname}/"
    
    # Lien symbolique pour l'exécutable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/mattermost-desktop" "${pkgdir}/usr/bin/mattermost-desktop"
    
    # Fichier .desktop
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/mattermost-desktop.desktop" << EOF
[Desktop Entry]
Name=Mattermost
Comment=Mattermost Desktop
Exec=mattermost-desktop
Icon=mattermost-desktop
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
StartupNotify=true
StartupWMClass=Mattermost
EOF
    
    # Icône
    install -Dm644 "app_icon.png" "${pkgdir}/usr/share/pixmaps/mattermost-desktop.png"
    
    # Licences
    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "NOTICE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
