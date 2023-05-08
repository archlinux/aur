# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ldtk-appimage"
pkgver=1.3.2
pkgrel=1
pkgdesc="Modern and efficient 2D level editor with a strong focus on user-friendliness"
arch=('x86_64')
url="https://ldtk.io/"
_githuburl="https://github.com/deepnight/ldtk"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/ubuntu-distribution.zip"
  "LICENSE::https://raw.githubusercontent.com/deepnight/ldtk/master/LICENSE")
sha256sums=('f0688c9b535bda344b156b4636c49fad6d63222f72282732b942b0304aa85192'
            'f409a37a40e823efefddac3140d991141633d4db3cec4f8667bc23b846dcc335')
    
prepare() {
    mv "${srcdir}/LDtk ${pkgver} installer.AppImage" "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/ldtk.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}