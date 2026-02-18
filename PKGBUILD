# Maintainer: Cyberlete <support@cyberlete.com>
pkgname=cyberlete-bin
pkgver=0.1.27
pkgrel=1
pkgdesc="Anti-cheat desktop client with Cyberlete Cloud node support"
arch=('x86_64')
url="https://cyberlete.com"
license=('LicenseRef-Cyberlete-Proprietary')
depends=('java-runtime>=17')
optdepends=('libappindicator-gtk3: system tray support')
provides=('cyberlete')
conflicts=('cyberlete')
options=('!strip' '!debug')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/Cyberlete/cyberlete-releases/releases/download/v${pkgver}/Cyberlete_${pkgver}_amd64.AppImage"
        "cyberlete.desktop")
sha256sums=('39a52b2fd2380ad06e90d72123c118e1ff1ef418147b556eb963f469830f12d6'
            '25f99e380f634a176c7dc938b9c7a9f67918788c8273f191ac8cd47aa0ce7ec5')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/opt/cyberlete"
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/cyberlete/"

    # Remove broken AppImage-internal symlink
    rm -f "${pkgdir}/opt/cyberlete/.DirIcon"

    # Ensure correct permissions
    find "${pkgdir}/opt/cyberlete" -type d -exec chmod 755 {} +
    chmod 755 "${pkgdir}/opt/cyberlete/AppRun"
    chmod 755 "${pkgdir}/opt/cyberlete/AppRun.wrapped"
    find "${pkgdir}/opt/cyberlete" -name '*.sh' -exec chmod 755 {} +

    # Symlink binary
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/cyberlete/AppRun "${pkgdir}/usr/bin/cyberlete"

    # Desktop entry
    install -Dm644 "${srcdir}/cyberlete.desktop" \
        "${pkgdir}/usr/share/applications/cyberlete.desktop"

    # Icons
    for _size in 32x32 128x128; do
        if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_size}/apps/cyberlete-desktop-app.png" ]; then
            install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_size}/apps/cyberlete-desktop-app.png" \
                "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/cyberlete.png"
        fi
    done
    # 256x256@2 → install as standard 256x256
    if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256@2/apps/cyberlete-desktop-app.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256@2/apps/cyberlete-desktop-app.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cyberlete.png"
    fi
}
