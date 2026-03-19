# Maintainer: exerinity <me@exerinity.com>
pkgname=voxity-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="An opinionated, intuitive, lightweight local music player"
arch=('x86_64')
url="https://voxity.dev"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: for tray icon support')
provides=('voxity')
conflicts=('voxity')

source=("https://bin.i.exerinity.com/voxity/Voxity-${pkgver}.AppImage"
        "voxity.desktop")
sha256sums=('e2a205871d8a549a7cff79380565c8b8f848126cc31a0d935bac1f0805e4cd9a'
            '10a078198c360bfcc686c64c9410b33e887f2f07bd8a1eaa201647e2537712ec')

prepare() {
    chmod +x "${srcdir}/Voxity-${pkgver}.AppImage"
    "${srcdir}/Voxity-${pkgver}.AppImage" --appimage-extract > /dev/null
}

package() {
    install -dm755 "${pkgdir}/opt/voxity"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/voxity/"
    
    # Fix permissions
    chmod -R 755 "${pkgdir}/opt/voxity"
    find "${pkgdir}/opt/voxity" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/voxity/voxity"
    chmod 755 "${pkgdir}/opt/voxity/chrome_crashpad_handler"
    chmod 755 "${pkgdir}/opt/voxity/chrome-sandbox"
    chmod 4755 "${pkgdir}/opt/voxity/chrome-sandbox"
    
    rm -f "${pkgdir}/opt/voxity/AppRun"
    rm -f "${pkgdir}/opt/voxity/.DirIcon"
    
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/voxity" << 'INNEREOF'
#!/bin/bash
exec /opt/voxity/voxity "$@"
INNEREOF
    chmod +x "${pkgdir}/usr/bin/voxity"
    
    install -Dm644 "${srcdir}/voxity.desktop" "${pkgdir}/usr/share/applications/voxity.desktop"
    install -Dm644 "${srcdir}/squashfs-root/voxity.png" "${pkgdir}/usr/share/pixmaps/voxity.png"
    
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
