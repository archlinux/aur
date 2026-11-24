# Maintainer: Hilary Jendrasiak SP5D <sylogista@sylogista.pl>

pkgname="wsjtz-appimage"
pkgver=2.0.20
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
sha256sums=('1eacedacc0356f3f89de0a3a831ad4d2cf7993900d6fb2cca41de374667ce15a')

prepare() {
    chmod +x wsjtz-x86_64.AppImage

    ./wsjtz-x86_64.AppImage --appimage-extract
    cp -L ./squashfs-root/wsjtx_icon.png wsjtz_icon-appimage.png
    cp -L ./squashfs-root/wsjtz.desktop wsjtz-appimage.desktop

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