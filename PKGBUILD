# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mmseqs2-search-bin
_appname=mmseqs-app
_pkgname=MMseqs2-Search
pkgver=1.7.0
_electronversion=12
pkgrel=1
pkgdesc="MMseqs2 app to run on your workstation or servers"
arch=(
    'aarch64'
    'x86_64'
)
url="https://search.mmseqs.com/"
_ghurl="https://github.com/soedinglab/MMseqs2-App"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'fuse2'
    'asar'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v7-8e1704f/${_pkgname}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v7-8e1704f/${_pkgname}-${pkgver}.AppImage")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
sha256sums_aarch64=('afe09835f2763f8c3fdb08d0f33de8d0ac262c7ea41038203d093f7c0682eb0e')
sha256sums_x86_64=('8741f3c9bb4ba43586c8e3abd8ff4438cb2a750fe0abb7c5d5afa23c80f98f03')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|\"mmseqs|\"..\/..\/..\/${pkgname%-bin}\/bin\/mmseqs|g" -i "${srcdir}/app.asar.unpacked/dist/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/squashfs-root/resources/bin/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/bin"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}