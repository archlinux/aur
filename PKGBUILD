# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app-appimage
_pkgname=${pkgname%-appimage}
pkgver=0.10.16
pkgrel=1
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
sha256sums=('4931f6c66f6b1da770f1249f2f42c6649c99af3ac52eba9b7564af27321db704'
            '5241eac73fafd6eb4b763ffedeb4d9bb4559ed3fa8fc0c31edd3c6ef62cbc375'
            'e0b3eab49465709ed5053dc1fa4206071ab32657d25bd1f9c01850d696715cff')

package() {
    cd "$srcdir"

    chmod +x "$_pkgname-$pkgver.AppImage"
    "./$_pkgname-$pkgver.AppImage" --appimage-extract "usr/share/applications/Modrinth App.desktop"
    "./$_pkgname-$pkgver.AppImage" --appimage-extract "usr/share/icons/hicolor/128x128/apps/ModrinthApp.png"
    "./$_pkgname-$pkgver.AppImage" --appimage-extract "usr/share/icons/hicolor/256x256@2/apps/ModrinthApp.png"

    pushd "squashfs-root"
    find "./usr/share" -type f -print0 | while read -d $'\0' f; do
        filename=$(basename -- "$f")
        target="modrinth-app.${filename##*.}"
        dir=$(dirname -- "$f")
        install -Dm644 "$f" "$pkgdir/$dir/$target"
    done
    popd
    
    sed -i \
      -e "s/Exec=ModrinthApp/Exec=modrinth-app %u/" \
      -e "s/Icon=ModrinthApp/Icon=modrinth-app/" \
      -e "s/mrpack/x-modrinth-mrpack/" \
      "${pkgdir}/usr/share/applications/modrinth-app.desktop"
    
    install -Dm755 "$_pkgname-$pkgver.AppImage" "$pkgdir/opt/modrinth-app/modrinth-app.AppImage"
    install -Dm755 "modrinth-app" "$pkgdir/usr/bin/modrinth-app"
    install -Dm644 "${srcdir}/modrinth-file-extensions.xml" "${pkgdir}/usr/share/mime/packages/modrinth-file-extensions.xml"
}
