# Maintainer: B-Silent <ben10ruitenbeek@gmail.com>

pkgname="winboat-appimage"
pkgver="0.9.0"
pkgrel=1
pkgdesc="Run Windows apps on 🐧 Linux with ✨ seamless integration"
url="https://github.com/TibixDev/winboat"
arch=("x86_64")
license=("MIT")
depends=("fuse2" "hicolor-icon-theme" 'docker' 'docker-compose' 'freerdp' 'gtk3' 'alsa-lib' 'nss')
conflicts=("winboat-bin" "winboat-electron" "winboat" "winboat-git")
options=("!strip" "!debug")

_appimage="winboat-0.9.0-x86_64.AppImage"
source=("$_appimage::$url/releases/download/v$pkgver/$_appimage" "LICENSE::$url/raw/refs/tags/v$pkgver/LICENSE")
sha256sums=("d35222b6bd2dee0e4026b72b0b82c9b532842c92ea91d1465d7f34e573090ef6"
            "c9985a68d5fb2e5c9f12ead3ee456937c9a928916d7106d677a0fa44b98b35fc")

prepare() {
    chmod +x "$srcdir/$_appimage"

    "$srcdir/$_appimage" --appimage-extract
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/winboat|"\
        "squashfs-root/winboat.desktop"
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # Install AppImage
    install -Dm755 "$srcdir/$_appimage" "$pkgdir/opt/$pkgname/$_appimage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Install desktop file
    install -Dm644 "$srcdir/squashfs-root/winboat.desktop" \
        "$pkgdir/usr/share/applications/winboat.desktop"

    # Install icons
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    cp -v "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/"*.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

    # Create a symlink for AppImage in /usr/bin/
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "$pkgdir/usr/bin/winboat"

    #Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
