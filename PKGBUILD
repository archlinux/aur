# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ldtk-bin
_pkgname=LDtk
pkgver=1.5.3
_electronversion=24
pkgrel=1
pkgdesc="Modern and efficient 2D level editor with a strong focus on user-friendliness"
arch=('x86_64')
url="https://ldtk.io/"
_ghurl="https://github.com/deepnight/ldtk"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'hicolor-icon-theme'
    'libdbusmenu-glib'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/ubuntu-distribution.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/deepnight/ldtk/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('8bb1c870ab35d2cadfbf08a119d3049e7986a2a80558d2610babc67fcd502566'
            'f409a37a40e823efefddac3140d991141633d4db3cec4f8667bc23b846dcc335'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
          -e "s|@appname@|${pkgname%-bin}|g" \
          -e "s|@runname@|app|g" \
          -e "s|@options@|levelIndex=1|g" \
          -i "${srcdir}/${pkgname%-bin}.sh"
    mv "${srcdir}/${_pkgname} ${pkgver} installer.AppImage" "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/extraFiles" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}