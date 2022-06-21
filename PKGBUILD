# Maintainer: Elias Blume <mail at elias-blu.me>
pkgname=moonlight-qt-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="moonlight-qt bin from appimage"
arch=('x86_64')
url="https://moonlight-stream.org"
license=('GPL3')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-svg' 'ffmpeg' 'sdl2_ttf' 'hicolor-icon-theme')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs')

source=("${pkgname%-bin}-$pkgver.AppImage::https://github.com/moonlight-stream/moonlight-qt/releases/download/v${pkgver}/Moonlight-${pkgver}-x86_64.AppImage")
_bin_name="${pkgname%-qt-bin}"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
sha256sums=('c71f2bff0e12962580b9f550e936cf08a7e3e958d972f5b12612d1564fc22bb5')

prepare() {
    # extract appimage
    chmod +x "${pkgname%-bin}-$pkgver.AppImage"
    ./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract

    # Rename file
    mv "squashfs-root/com.moonlight_stream.Moonlight.desktop" "squashfs-root/${pkgname%-bin}.desktop"

    # Remove X-AppImage-Version
    sed -i '/AppImage/d' "squashfs-root/${pkgname%-bin}.desktop"
}

package() {
    install -Dm755 "squashfs-root/usr/bin/${_bin_name}" -t "$pkgdir/usr/bin/"

    install -Dm644 "squashfs-root/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications/"

    install -d "$pkgdir/usr/share/icons/"
    cp -r squashfs-root/usr/share/icons/hicolor/ "$pkgdir/usr/share/icons/"
}
