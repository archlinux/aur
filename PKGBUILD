# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=youtube-music-appimage
pkgver=1.20.0
pkgrel=1
pkgdesc="YouTube Music Desktop App bundled with custom plugins (and built-in ad blocker / downloader)"
arch=('any')
url="https://th-ch.github.io/youtube-music/"
_githuburl="https://github.com/th-ch/youtube-music"
license=('MIT')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
options=(!strip)
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/YouTube-Music-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/th-ch/youtube-music/master/license")
sha256sums=('7933d62c3f4a52cd99b0b6d84649279f1e6e0f2acd49b1473f2bfa814fb02ff7'
            'e7e14b3b771ecadb23f6ee0b6f99d1553e385e35cdb44fc8e36ee7c878dacd08')

prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/youtube-music.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
	for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
    	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
			-t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
	install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}