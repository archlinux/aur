# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=r3play-bin
_pkgname=R3PLAY
pkgver=2.0.0_alpha_2
_electronversion=23
pkgrel=4
pkgdesc="高颜值的第三方网易云播放器，支持 Windows/macOS/Linux.原名YesPlayMusic."
arch=('x86_64')
url="https://music.qier222.com/"
_ghurl="https://github.com/qier222/YesPlayMusic"
license=('MIT')
conflicts=(
    "${pkgname%-bin}"
    "yesplaymusic"
    "${pkgname%-bin}x"
)
provides=("yesplaymusic")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver%_alpha_2}-linux.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/qier222/YesPlayMusic/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('6108bdc25f8c27fedd4cad07e8c6f20c3eed895bea46f6d73123ad889d927ec7'
            'db52e3daad9260a1cc638efaf3f6b7a6bdead236365586a60078a9a287613037'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|Music|AudioVideo|g;s|desktop|${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/desktop.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
    sed -e "s|..\/..\/Resources\/bin\/better_sqlite3.node|\/usr\/lib\/${pkgname%-bin}\/bin\/better_sqlite3.node|g" \
        -e "s|..\/resources\/bin\/better_sqlite3.node|\/usr\/lib\/${pkgname%-bin}\/bin\/better_sqlite3.node|g" \
        -i "${srcdir}/squashfs-root/resources/app/main/index.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/squashfs-root/resources/bin/better_sqlite3.node" -t "${pkgdir}/usr/lib/${pkgname%-bin}/bin"
    cp -r "${srcdir}/squashfs-root/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 24x24 32x32 48x48 64x64 88x88 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/desktop.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}