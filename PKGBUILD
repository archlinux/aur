# Maintainer: Elias Blume <mail at elias-blu.me>
pkgname=moonlight-qt-bin
pkgver=5.0.1
pkgrel=1
pkgdesc="moonlight-qt bin from appimage"
arch=('x86_64')
url="https://moonlight-stream.org"
license=('GPL3')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-svg' 'ffmpeg' 'sdl2_ttf' 'hicolor-icon-theme' 'openssl-1.1')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs')

source=("${pkgname%-bin}-$pkgver.AppImage::https://github.com/moonlight-stream/moonlight-qt/releases/download/v${pkgver}/Moonlight-${pkgver}-x86_64.AppImage"
"launcher.sh")
_bin_name="${pkgname%-qt-bin}"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
sha256sums=('c2bfdc93537333e1a2c1ba3eae66fa1b1a9f537fc60b3df7cabc8dff1b7f18cd'
            '7dc324b4621067c01c1ea91570dec230fb43735f48f5f9eac91b0e487070a79d')
options=(!strip)
prepare() {
    # extract appimage
    chmod +x "${pkgname%-bin}-$pkgver.AppImage"
    ./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract 1>/dev/null

    # Rename file
    mv "squashfs-root/com.moonlight_stream.Moonlight.desktop" "squashfs-root/${pkgname%-bin}.desktop"

    # Remove X-AppImage-Version
    sed -i '/AppImage/d' "squashfs-root/${pkgname%-bin}.desktop"
}

package() {
    # install -Dm755 "squashfs-root/usr/bin/${_bin_name}" -t "$pkgdir/usr/bin/"
    mkdir "${pkgdir}/opt/" -p
    cp -r squashfs-root "${pkgdir}/opt/${pkgname}"
    mkdir "${pkgdir}/usr/bin/" -p
    install -dm644 "${pkgdir}/opt/"
    install -m755 "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/moonlight"
    install -m755 "squashfs-root/AppRun" "${pkgdir}/opt/${pkgname}/AppRun"

    install -Dm644 "squashfs-root/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications/"
    # install -m644 "squashfs-root/usr"
    install -d "$pkgdir/usr/share/icons/"
    cp -r squashfs-root/usr/share/icons/hicolor/ "$pkgdir/usr/share/icons/"
}
