# Maintainer: Spoorloos <mick.negenman@icloud.com>

_appimage='iloader-linux-amd64.AppImage'

pkgname='iloader-appimage'
pkgver=1.1.3
pkgrel=1
pkgdesc='User-friendly sideloader'
arch=('x86_64')
license=('MIT')
source=("https://github.com/nab138/iloader/releases/latest/download/$_appimage")
sha256sums=('SKIP')
makedepends=('jq')
noextract=($_appimage)
options=(!strip !debug)

pkgver() {
    curl -s https://api.github.com/repos/nab138/iloader/releases/latest | jq -r '.tag_name' | sed 's/^v//'
}

prepare() {
    chmod +x "$srcdir/$_appimage"

    "$srcdir/$_appimage" --appimage-extract
}

build() {
    sed -i \
        -e "s|Exec=.*|Exec=/usr/bin/iloader|" \
        -e "s|Icon=.*|Icon=/usr/share/icons/hicolor/256x256/apps/iloader.png|" \
        "squashfs-root/iloader.desktop"
}

package() {
    install -Dm755 "$srcdir/$_appimage" "$pkgdir/usr/bin/iloader"
    install -Dm644 "$srcdir/squashfs-root/iloader.desktop" "$pkgdir/usr/share/applications/iloader.desktop"
    install -Dm644 "$srcdir/squashfs-root/iloader.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/iloader.png"
}
