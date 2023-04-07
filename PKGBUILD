# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="muffon-appimage"
pkgver=1.5.0
pkgrel=1
pkgdesc="Music streaming browser,retrieves audio, video and metadata from various Internet sources."
arch=('x86_64')
url="https://muffon.netlify.app/"
_githuburl="https://github.com/staniel359/muffon"
license=(MIT)
options=(!strip)
providers=(staniel359)
conflicts=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-linux-x86_64.AppImage"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('9f9465a54bc2f723ee181bacf3c183062ad56fac31141e856672574ad1ee0252'
            '6d1a22f787896797e8e8d5e0afd14121b67041b13d59965344c1b499fab6e8f8')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/muffon.AppImage|g;s|Audio|AudioVideo|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
	for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
    	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png"
	done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}