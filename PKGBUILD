# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=station-bin
_pkgname=Station
pkgver=2.7.3
_electronversion=25
pkgrel=2
pkgdesc="The first open-source smart browser for busy people. A single place for all of your web applications."
arch=('x86_64')
url="https://getstation.com/"
_ghurl="https://github.com/getstation/desktop-app"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'hicolor-icon-theme'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${CARCH}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('6b420c84cfcfcf0f01729381c042202bc941a90bd5bdcf91241e9dc99fadbbdd'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|${pkgname%-bin}-desktop-app|${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-bin}-desktop-app.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,.env.production,app-update.yml} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}-desktop-app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}-desktop-app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}