# Maintainer: Revincx <revincx233@gmail.com>
# Co-Maintainer: Mikata Riko <sanbikappa@qq.com>

pkgname='kikoplay-bin'
pkgver=0.9.3
pkgrel=1
pkgdesc="linux danmaku player"
arch=('x86_64')
license=('GPL3')
url="https://github.com/KikoPlayProject/KikoPlay"
depends=('mpv' 'lua53' 'qhttpengine')
conflicts=('kikoplay')
optdepends=('aria2: for downloading')
source=(
    "https://github.com/KikoPlayProject/KikoPlay/releases/download/${pkgver}/KikoPlay-x86_64_${pkgver}.AppImage"
    # download script module manually due to the module was excluded from appimage package
    "git+https://github.com/KikoPlayProject/KikoPlayScript"
)
sha256sums=(
    "8ca6b77b0f1a7e13f429b3a9b50b0e71361ce031d6850b0ff35499568780c1a9"
    SKIP
)

package() {
    chmod 0755 *.AppImage
    ./*.AppImage --appimage-extract
    cd "${srcdir}/squashfs-root/usr/bin"
    install -Dm644 KikoPlay使用说明.pdf "$pkgdir/usr/share/doc/kikoplay/help.pdf"
    install -Dm755 KikoPlay "$pkgdir/usr/bin/KikoPlay"
    install -Dm644 "${srcdir}/squashfs-root/kikoplay.png" "$pkgdir/usr/share/pixmaps/kikoplay.png"
    install -Dm644 kikoplay.desktop "${pkgdir}/usr/share/applications/kikoplay.desktop"

    mkdir -p "${pkgdir}/usr/share/kikoplay"
    # lua script module for danmu search
    cd "${srcdir}/KikoPlayScript"
    rm LICENSE *.md *.png
    install -dm755 "${pkgdir}/usr/share/kikoplay/script"
    cp -r * "${pkgdir}/usr/share/kikoplay/script"

    # web server module for LANserver function
    cd "${srcdir}/squashfs-root/usr/bin"
    install -dm755 "${pkgdir}/usr/share/kikoplay/web"
    cp -r web/* "${pkgdir}/usr/share/kikoplay/web"

    ln -sf KikoPlay "${pkgdir}/usr/bin/kikoplay"
}
