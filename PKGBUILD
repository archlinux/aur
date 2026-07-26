# Contributor: holishing
# Contributor: axzxc1236
pkgname=oxwu
pkgver=4.2.0
pkgrel=1
pkgdesc="The GUI software using P2P networking to fastly report Earthquakes in Taiwan"
arch=('x86_64')
url="https://eew.earthquake.tw"
source=("oxwu-$pkgver.AppImage::https://eew.earthquake.tw/releases/linux/x64/oxwu-linux-x86_64.AppImage")
sha512sums=('a7ab9967f632e545569a71ce8a5d9b12197a8d3d6ac8f8698de2700744d22162b08baf6b8242f12fb1e9c716aebe4bb529900cc37cf8749e6696d7e3d0397c94')
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
