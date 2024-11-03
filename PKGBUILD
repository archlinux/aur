# Maintainer: wwxiaoqi <tahicoing@gmail.com>

pkgname=hexhub-bin
pkgver=1.1.6
pkgrel=1
pkgdesc="database, docker, ssh, sftp. all in one"
arch=('x86_64')
url='https://www.hexhub.cn/'
license=('GPL')
depends=()
conflicts=()
options=("!strip" "!debug")
source=('https://oss.hexhub.cn/plugin/HexHub_amd64.AppImage')
sha256sums=('417461fad6a4c04b8d18ee5d4e4d4a7f831314e5123bc25886936e78dec59a70')

_pkgname=HexHub_amd64.AppImage
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
