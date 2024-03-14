# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=bitcomet
pkgver=2.7.0
pkgrel=1
pkgdesc="A free BitTorrent download client! Powerful, super-fast and easy-to-use"
arch=(x86_64)
url='https://www.bitcomet.com'
license=('LicenseRef-bitcomet')
depends=('glibc' 'hicolor-icon-theme' 'zlib' 'lerc' 'fuse2' 'webkit2gtk' 'libjpeg6-turbo')
makedepends=('appimagetool-bin')
options=(!strip)
source=(
    "BitComet-${pkgver}-${CARCH}.AppImage::https://download.bitcomet.com/linux/BitComet-${pkgver}-${CARCH}.AppImage"
    "libtiff-4.5.0-4-x86_64.pkg.tar.zst::https://archive.archlinux.org/packages/l/libtiff/libtiff-4.5.0-4-${CARCH}.pkg.tar.zst"
    "LICENSE.html::https://www.bitcomet.com/en/license"
)
sha256sums=(
    "125e50545668c5d2204aa38b31dd1f070b8dfdf595e15bcf41de6dedc85d42f7"
    "c5eaf83c66d97b751c6e63a7b1f54378e3232e41d81505a6576ccd8741f675b9"
    "SKIP"
)
_install_path="/opt/$pkgname"

prepare() {
    cd "${srcdir}"
    chmod a+x "BitComet-${pkgver}-${CARCH}.AppImage"
    ./BitComet-${pkgver}-${CARCH}.AppImage --appimage-extract >/dev/null
}

package() {
    install -Dm755 "${srcdir}/usr/lib/libtiff.so.6.0.0" "${srcdir}/squashfs-root/lib/${CARCH}-linux-gnu/libtiff.so.6"
    install -Dm755 "${srcdir}/usr/lib/libtiffxx.so.6.0.0" "${srcdir}/squashfs-root/lib/${CARCH}-linux-gnu/libtiffxx.so.6"
    unset SOURCE_DATE_EPOCH
    ARCH=${CARCH} appimagetool "${srcdir}/squashfs-root" "${srcdir}/${pkgname}.AppImage"
    install -Dm755 "${srcdir}/${pkgname}.AppImage" "${pkgdir}/${_install_path}/${pkgname}.AppImage"
    sed -i 's|Exec=usr/bin/BitComet|Exec=/usr/bin/bitcomet|g' "${srcdir}/squashfs-root/com.bitcomet.linux.desktop"
    install -Dm644 "${srcdir}/squashfs-root/com.bitcomet.linux.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/LICENSE.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
