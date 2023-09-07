# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=godmode-appimage
_pkgname=GodMode
pkgver=1.0.0_beta.8
pkgrel=1
pkgdesc="AI Chat Browser: Fast, Full webapp access to ChatGPT / Claude / Bard / Bing / Llama2!"
arch=('aarch64' 'x86_64')
url="https://smol.ai/"
_githuburl="https://github.com/smol-ai/GodMode"
license=('MIT')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('glibc' 'zlib' 'hicolor-icon-theme')
options=('!strip')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.AppImage")
source=("LICENSE::https://raw.githubusercontent.com/smol-ai/GodMode/v${pkgver//_/-}/LICENSE")
sha256sums=('5e98c15fe806a18f79422d2cd0c4587129f4e03081b5ab4c030627d6f6840d68')
sha256sums_aarch64=('a33cb0f3a38ed27e1af738f2e52692446f02bd14ec0a6fd682e1bf72e8a3dc68')
sha256sums_x86_64=('898ce499048f8c0fb9d8bbf6ab76b6d9d82e7782caf2ba693eca05403493e7fd')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}