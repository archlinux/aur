# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app-appimage
_pkgname=${pkgname%-appimage}
pkgver=0.8.7
pkgrel=2
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL-3.0-only')
depends=(
    'fuse2'
)
provides=('modrinth-app')
conflicts=('modrinth-app')
source=(
    "$_pkgname-$pkgver.AppImage::https://launcher-files.modrinth.com/versions/${pkgver}/linux/Modrinth%20App_${pkgver}_amd64.AppImage"
    "modrinth-app"
    "modrinth-file-extensions.xml"
)
options=(!strip !debug)
noextract=("Modrinth%20App_${pkgver}_amd64.AppImage")
sha256sums=('7c874ec6c972478fc0a02abcdda64a7292f9c4777bb8e02cc5496237b9044670'
            '891da8d3927841954ee771c80fe6018b90553902dcfc9f1e945a2c52a80874bc'
            'e0b3eab49465709ed5053dc1fa4206071ab32657d25bd1f9c01850d696715cff')

package() {
    cd "$srcdir"

    chmod +x "$_pkgname-$pkgver.AppImage"
    "./$_pkgname-$pkgver.AppImage" --appimage-extract "usr/share/applications/modrinth-app.desktop"
    "./$_pkgname-$pkgver.AppImage" --appimage-extract "usr/share/icons/hicolor/128x128/apps/modrinth-app.png"
    "./$_pkgname-$pkgver.AppImage" --appimage-extract "usr/share/icons/hicolor/256x256@2/apps/modrinth-app.png"

    cp -r "squashfs-root/usr/" "${pkgdir}"

    install -Dm644 "squashfs-root/usr/share/applications/modrinth-app.desktop" "$pkgdir/usr/share/applications/modrinth-app.desktop"
    sed -i \
      -e "s/Exec=modrinth-app/Exec=modrinth-app %u/" \
      -e "s/mrpack/x-modrinth-mrpack/" \
      "${pkgdir}/usr/share/applications/modrinth-app.desktop"
    
    install -Dm755 "$_pkgname-$pkgver.AppImage" "$pkgdir/opt/modrinth-app/modrinth-app.AppImage"
    install -Dm755 "modrinth-app" "$pkgdir/usr/bin/modrinth-app"
    install -Dm644 "${srcdir}/modrinth-file-extensions.xml" "${pkgdir}/usr/share/mime/packages/modrinth-file-extensions.xml"
}
