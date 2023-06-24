pkgname=another-redis-desktop-manager
pkgver=1.6.0
pkgrel=1
pkgdesc="A faster, better and more stable redis desktop manager, compatible with Linux, windows, mac. What's more, it won't crash when loading massive keys." # 包描述
arch=('any')
url="https://github.com/qishibo/AnotherRedisDesktopManager"
license=('MIT') 
provides=('another-redis-desktop-manager' 'another-redis-desktop-manager.Appimage')
conflicts=('another-redis-desktop-manager' 'another-redis-desktop-manager-Appimage')
image="${pkgname}.AppImage"
source=("${image}::${url}/releases/download/v${pkgver}/Another-Redis-Desktop-Manager.${pkgver}.AppImage") #源码
md5sums=('c3c88c5c9fffae3af497ef657c425bb6')
options=(!strip)


prepare() {
    chmod +x "${image}"
    ./"${image}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i \
        -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname}|" \
        -e "s|Icon=.*|Icon=/usr/share/icons/${pkgname}.png|" \
        "squashfs-root/${pkgname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}


package() {
    # AppImage
    install -Dm755 "${srcdir}/${image}" "${pkgdir}/opt/${pkgname}/${image}"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    ln -s "$(realpath ${srcdir}/squashfs-root/${pkgname}.png  --relative-to ${srcdir}/squashfs-root/usr/share/icons)" "${pkgdir}/usr/share/icons/${pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
