# Maintainer: Hilary Jendrasiak SP5D <sylogista@sylogista.pl>

pkgname="wsjtz-appimage"
pkgver=2.0.18
epoch=1
pkgrel=1
pkgdesc="AppImage of WSJT-Z – fork of WSJT-X with automation features."
arch=('x86_64')
url="https://github.com/SP5D/wsjtz-AppImage"
license=("GPL3")
depends=("fuse2")
options=(!strip)
source=("https://github.com/SP5D/wsjtz-AppImage/releases/download/v${pkgver}/wsjtz-x86_64.AppImage")
noextract=("wsjtz-x86_64.AppImage")
sha256sums=('97dd612772f1c9498afc2c9c763c0c3cc78e0763d6eefabad5cfeb18f3e745f5')

prepare() {
    chmod +x wsjtz-x86_64.AppImage

    ./wsjtz-x86_64.AppImage --appimage-extract wsjtx_icon.png
    ./wsjtz-x86_64.AppImage --appimage-extract wsjtz.desktop

    # avoiding filename conflicts with possibly existing wsjtx package
    mv ./squashfs-root/wsjtx_icon.png wsjtz_icon-appimage.png
    mv ./squashfs-root/wsjtz.desktop wsjtz-appimage.desktop

    sed -i 's/Name=.*/Name=wsjtz-appimage/' wsjtz-appimage.desktop
    sed -i 's/Exec=.*/Exec=wsjtz-appimage/' wsjtz-appimage.desktop
    sed -i 's/Icon=.*/Icon=wsjtz_icon-appimage/' wsjtz-appimage.desktop
}

package() {
    install -Dm755 "${srcdir}"/wsjtz-x86_64.AppImage "${pkgdir}"/opt/appimages/wsjtz.AppImage
    install -Dm644 "${srcdir}"/wsjtz-appimage.desktop "${pkgdir}"/usr/share/applications/wsjtz-appimage.desktop
    install -Dm644 "${srcdir}"/wsjtz_icon-appimage.png "${pkgdir}"/usr/share/pixmaps/wsjtz_icon-appimage.png

    # Symlink executable
    mkdir -p "${pkgdir}"/usr/bin
    ln -s "/opt/appimages/wsjtz.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}