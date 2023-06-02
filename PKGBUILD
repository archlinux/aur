# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ryan Dowling <ryan@ryandowling.me>
pkgname=hyper-appimage
pkgver=3.4.1
pkgrel=2
pkgdesc="A terminal built on web technologies"
arch=('x86_64')
url="https://hyper.is"
_githuburl="https://github.com/vercel/hyper"
license=('MIT')
conflicts=("${pkgname%-appimage}")
provides=("${pkgname%-appimage}")
depends=('glibc' 'hicolor-icon-theme' 'zlib')
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Hyper-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/vercel/hyper/canary/LICENSE")
sha256sums=('5050be667fe56d6871ed6f86b3b03a023b2b75aa91329a82c2f15ff7ed66b63c'
            '07a1ce5a08f3f385ea6f2aef0c8246c2d9bdd7c8dd21235b76b1cb7116efc13f')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|TerminalEmulator|TerminalEmulator;Utility|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}