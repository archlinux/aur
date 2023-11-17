# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=godmode-appimage
_pkgname=GodMode
pkgver=1.0.0_beta.10
pkgrel=1
pkgdesc="AI Chat Browser: Fast, Full webapp access to ChatGPT / Claude / Bard / Bing / Llama2!"
arch=('aarch64' 'x86_64')
url="https://smol.ai/"
_githuburl="https://github.com/smol-ai/GodMode"
license=('MIT')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'hicolor-icon-theme'
)
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.AppImage")
source=("LICENSE::https://raw.githubusercontent.com/smol-ai/GodMode/v${pkgver//_/-}/LICENSE")
sha256sums=('5e98c15fe806a18f79422d2cd0c4587129f4e03081b5ab4c030627d6f6840d68')
sha256sums_aarch64=('86985de33c5444911ee3fa4821d5e5d123d5dd1055dbba23ff2098ef08f4febf')
sha256sums_x86_64=('7142508ed201a2dea78f03900633ba2b75b54fa8e72b066599e5d41a22dc6243')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}