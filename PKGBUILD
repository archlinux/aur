# Maintainer: kirillz kzasorin@gmail.com

pkgname=joplin-appimage
pkgver=1.0.220
pkgrel=1
pkgdesc="The latest released AppImage of Joplin - a cross-platform note taking and to-do app"
arch=('x86_64')
url="https://github.com/laurent22/joplin"
license=('MIT')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
sha512sums=('7001d93db289bd47afe634285775d4acccba4732cb620051e34d6f284d2ea12e43ebe8bfae4a57236b17fbdb5bc4bb395fa0b5163d588626e37943337d88fbed')
_filename=Joplin-$pkgver-x86_64.AppImage
source() {
    ${url}/releases/download/v${pkgver}/Joplin-${pkgver}.AppImage
    joplin.desktop
}

package() {
    chmod +x $_filename
    mkdir -p squashfs-root/usr/share/icons/hicolor/{72x72,16x16,128x128}/apps
    ./$_filename --appimage-extract "usr/share/icons/hicolor/*/apps/joplin.png" > /dev/null 2>&1
    ./$_filename --appimage-extract joplin.desktop > /dev/null 2>&1
    INSTALL_PATH="/opt/appimages/Joplin.AppImage"
    sed -i -E "s|Exec=AppRun|Exec=${INSTALL_PATH}|" squashfs-root/joplin.desktop

    # install icons
    install -dm755 "$pkgdir/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "$pkgdir/usr/share"
    chmod -R 755 "$pkgdir/usr/share/icons"
    find "$pkgdir/usr/share/icons" -type f -name "joplin.png" -exec chmod 644 {} \;

    # install .desktop file and image file
    install -Dm644 "squashfs-root/joplin.desktop" "$pkgdir/usr/share/applications/joplin.desktop"
    install -Dm755 "$_filename" "$pkgdir$INSTALL_PATH"

    # disable AppImage integration prompt
    # https://github.com/electron-userland/electron-builder/issues/1962
    install -dm755 "$pkgdir/usr/share/appimagekit"
    touch "$pkgdir/usr/share/appimagekit/no_desktopintegration"
    chmod 644 "$pkgdir/usr/share/appimagekit/no_desktopintegration"
}
