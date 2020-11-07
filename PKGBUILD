# Maintainer: thynkon <thynkon at protonmail dot com>

pkgname=joplin-appimage
pkgver=1.4.7
pkgrel=1
pkgdesc="The latest pre-released AppImage of Joplin - a cross-platform note taking and to-do app"
arch=('x86_64')
url="https://github.com/laurent22/joplin"
license=('MIT')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
_filename=Joplin-$pkgver.AppImage
source=(
  ${url}/releases/download/v${pkgver}/Joplin-${pkgver}.AppImage
  ${url}/raw/v${pkgver}/LICENSE
)
sha512sums=(
  b532225d16193e52f7459c1e153c97c5a88577ea6580202474f009ef839f7ceb1840d4fd136fd65b413de45cba1295e14a89817a699f4d23dde2fc0bb65e7731
  SKIP
)

package() {
    echo
    echo "     _             _ _       "
    echo "    | | ___  _ __ | (_)_ __  "
    echo " _  | |/ _ \| '_ \| | | '_ \ "
    echo "| |_| | (_) | |_) | | | | | |"
    echo " \___/ \___/| .__/|_|_|_| |_|"
    echo "            |_|              "
    echo

    chmod +x $_filename
    mkdir -p squashfs-root/usr/share/icons/hicolor/{72x72,16x16}/apps
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
