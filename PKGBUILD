# Maintainer: wwxiaoqi <tahicoing@gmail.com>

pkgname=hexhub-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="database, docker, ssh, sftp. all in one"
arch=('x86_64')
url='https://www.hexhub.cn/'
license=('GPL')
depends=()
conflicts=()
options=("!strip" "!debug")
source=('https://oss.hexhub.cn/plugin/HexHub-amd64-appimage-1.2.2.AppImage')
sha256sums=('92bb5ec914e4ddf0e061afc6bad4ec0d952de8204c9fcdd05aa502e05ca86382')

_pkgname=HexHub-amd64-appimage-1.2.2.AppImage
noextract=("$_pkgname")

prepare() {
    chmod +x "$_pkgname"
    ./"$_pkgname" --appimage-extract > /dev/null
}

build() {
    # Adjust .desktop so it will work autside of AppImage container
    sed -i \
        -e "s|Exec=HexHub|Exec=/opt/$pkgname/AppRun|" \
        -e "s+^Icon=.*+Icon=hexhub-bin+" \
        -e "s|^Terminal=true|Terminal=false|" \
        -e "s|^NoDisplay=true|NoDisplay=false|" \
        "squashfs-root/appimagetool.desktop"

    # Fix work no so files.
    sed -i \
        -e "s|cd \"\$(dirname \"\$0\")\"|cd /opt/$pkgname|" \
        "squashfs-root/AppRun"
}

package() {
    # Icon images
    install -Dm644 "squashfs-root/hexhub.png" \
            "$pkgdir/usr/share/icons/hicolor/512x512/apps/hexhub-bin.png"
    
    # Desktop file
    install -Dm644 "$srcdir/squashfs-root/appimagetool.desktop" \
            "$pkgdir/usr/share/applications/HexHub.desktop"
    
    # Copy executable
    mkdir -p "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/squashfs-root/." "$pkgdir/opt/$pkgname/"

    # Copy Bin run file
    install -dm755 "$pkgdir/usr/bin"
    cp -r "$pkgdir/opt/$pkgname/AppRun" "$pkgdir/usr/bin/hexhub"
}
