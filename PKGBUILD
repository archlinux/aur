# Contributor: holishing
# Contributor: axzxc1236
pkgname=oxwu
pkgver=4.1.0
pkgrel=1
pkgdesc="The GUI software using P2P networking to fastly report Earthquakes in Taiwan"
arch=('x86_64')
url="https://eew.earthquake.tw"
source=("oxwu-$pkgver.AppImage::https://eew.earthquake.tw/releases/linux/x64/oxwu-linux-x86_64.AppImage")
sha512sums=('e208dd1a1db22744ff2f7f6edacf8bf93db9b46e38398b028f71ccb52e810e0e5b93b632540f902593c4d7c3a13a2225a164755fc62674630da3c02b72ed6e0a')
noextract=("oxwu-$pkgver.AppImage")
options+=('!strip')

prepare() {
    cd "${srcdir}"
    # Extract appimage content
    chmod +x oxwu-$pkgver.AppImage
    ./oxwu-$pkgver.AppImage --appimage-extract > /dev/null
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E 's|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /opt/OXWU/oxwu.AppImage|' 'squashfs-root/oxwu.desktop'
}

package() {
    install -Dm755 "${srcdir}/oxwu-$pkgver.AppImage" "${pkgdir}/opt/OXWU/oxwu.AppImage"
    # create symbolic link
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/opt/OXWU/oxwu.AppImage" "${pkgdir}/usr/bin/oxwu"
    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    install -Dm644 "${srcdir}/squashfs-root/oxwu.png" "${pkgdir}/opt/OXWU/oxwu.png"
    install -Dm644 "${srcdir}/squashfs-root/oxwu.desktop" "${pkgdir}/usr/share/applications/oxwu.desktop"
    install -Dm644 "${srcdir}/squashfs-root/oxwu.desktop" "${pkgdir}/etc/xdg/autostart/oxwu.desktop"
}
