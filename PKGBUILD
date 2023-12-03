# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=bitcomet
pkgver=2.5.1
pkgrel=1
pkgdesc="A free BitTorrent download client! Powerful, super-fast and easy-to-use"
arch=(x86_64)
url='https://www.bitcomet.com'
license=('custom')
depends=('glibc' 'hicolor-icon-theme' 'zlib' 'lerc' 'fuse2' 'webkit2gtk' 'libjpeg6-turbo')
makedepends=('appimagetool')
options=(!strip)
source=(
    "BitComet-${pkgver}-${CARCH}.AppImage::https://download.bitcomet.com/linux/BitComet-${pkgver}-${CARCH}.AppImage"
    "libtiff.rpm::https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/${CARCH}/os/Packages/l/libtiff-4.5.0-3.fc40.${CARCH}.rpm"
    "LICENSE.html::https://www.bitcomet.com/en/license"
)
sha256sums=(
    "e36b8a4e1cefd3381ed2bd40fc3ab1237238c20f84cce1564b5535fce0f454a3"
    "2d29d4666fa6ac1949a6af6ef4c8f83e4e33fce30f289bc8e7fd9f47acabcc95"
    "SKIP"
)
_install_path="/opt/$pkgname"

prepare() {
    cd "${srcdir}"
    chmod a+x "BitComet-${pkgver}-${CARCH}.AppImage"
    ./BitComet-${pkgver}-${CARCH}.AppImage --appimage-extract > /dev/null
    sed -i 's|Exec=usr/bin/BitComet|Exec=env XDG_DATA_DIRS="/usr/local/share:/usr/share" bitcomet|' "${srcdir}/squashfs-root/com.bitcomet.linux.desktop"
}

package() {
    install -Dm755 "${srcdir}/usr/lib64/libtiff.so.6.0.0" "${srcdir}/squashfs-root/usr/lib/${CARCH}-linux-gnu/libtiff.so.6"
    install -Dm755 "${srcdir}/usr/lib64/libtiffxx.so.6.0.0" "${srcdir}/squashfs-root/usr/lib/${CARCH}-linux-gnu/libtiffxx.so.6"
    unset SOURCE_DATE_EPOCH
    appimagetool "${srcdir}/squashfs-root" "${srcdir}/${pkgname}.AppImage"
    install -Dm755 "${srcdir}/${pkgname}.AppImage" "${pkgdir}/${_install_path}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/com.bitcomet.linux.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/LICENSE.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}