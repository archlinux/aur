# Maintainer: Spoorloos <mick.negenman@icloud.com>

_version='1.1.4'
_appimage='iloader-linux-amd64.AppImage'
_checksum='3bf27878516de1488e30cdb2a049c7094efccc9c3c8bee464481f754f9033c87'

pkgbase='iloader'
pkgname='iloader-appimage'
pkgver=$_version
pkgrel=2
pkgdesc='User-friendly sideloader'
url='https://github.com/nab138/iloader'
arch=('x86_64')
license=('MIT')
source=("https://github.com/nab138/iloader/releases/download/v$_version/$_appimage")
sha256sums=($_checksum)
noextract=($_appimage)
options=(!strip !debug)

prepare() {
    # Make appimage executable
    chmod +x "$srcdir/$_appimage"

    # Extract appimage files
    "$srcdir/$_appimage" --appimage-extract
}

build() {
    # Fix desktop file for running outside the appimage
    sed -i \
        -e 's|Exec=.*|Exec=/usr/bin/iloader|' \
        -e 's|Icon=.*|Icon=/usr/share/icons/hicolor/256x256/apps/iloader.png|' \
        "$srcdir/squashfs-root/iloader.desktop"
}

package() {
    # Install appimage
    install -Dm755 "$srcdir/$_appimage" "$pkgdir/opt/iloader/$_appimage"

    # Create a symlink for appimage in /usr/bin/
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/iloader/$_appimage" "$pkgdir/usr/bin/iloader"

    # Install desktop file
    install -Dm644 "$srcdir/squashfs-root/iloader.desktop" \
        "$pkgdir/usr/share/applications/iloader.desktop"

    # Install icon
    install -Dm644 "$srcdir/squashfs-root/iloader.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/iloader.png"
}
