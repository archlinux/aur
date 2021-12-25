# Maintainer: Kostoski Stefan <kostoski.stefan90@gmail.com>

_appname=hoverclock
pkgname=hoverclock-appimage
pkgver=0.0.8
pkgrel=1
pkgdesc="Hoverclock - A simple, customizable floating clock for linux made with QT"
arch=('x86_64')
url="https://github.com/kostoskistefan/hoverclock"
license=('GPL3')
provides=('hoverclock')
options=(!strip)
source_x86_64=("Hoverclock-x86_64.AppImage::$url/releases/download/v$pkgver/Hoverclock-x86_64.AppImage"
                "https://raw.githubusercontent.com/kostoskistefan/hoverclock/main/LICENSE")
sha256sums_x86_64=('c111eae336e7392d2cd60345e9c9ec42b3d1af92e3701fea7bbabbd532e0f575'
                   '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

prepare() {
    mv -f "Hoverclock-x86_64.AppImage" "hoverclock.AppImage"
    chmod +x "hoverclock.AppImage"
    ./"hoverclock.AppImage" --appimage-extract "usr/share/icons/hicolor/256x256/apps/hoverclock.png" > /dev/null 2>&1
    ./"hoverclock.AppImage" --appimage-extract "usr/share/applications/hoverclock.desktop" > /dev/null 2>&1
}

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/${_appname}.AppImage" "${pkgdir}/opt/${_appname}/${_appname}.AppImage"

    # Install Desktop file
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

    # Install icon
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_appname}/${_appname}.AppImage" "${pkgdir}/usr/bin/${_appname}"

    # Install license
    install -dm755 "${pkgdir}/usr/share/licenses/${_appname}/"
    ln -s "/opt/${_appname}/LICENSE" "${pkgdir}/usr/share/licenses/${_appname}"
}

post_install() {
    update-mime-database /usr/share/mime || true
    update-desktop-database /usr/share/applications || true
    rm ~/.cache/icon-cache.kcache
}

post_remove() {
    rm -f "/usr/bin/${_appname}"
}
