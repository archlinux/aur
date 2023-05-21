# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=beaker-ng-appimage
_appname=beaker-browser
pkgver=1.2.3
pkgrel=1
pkgdesc="An experimental peer-to-peer Web browser - Compiler optimized, community maintained fork."
arch=('x86_64')
url="https://github.com/Alex313031/beaker-ng"
_githuburl="https://github.com/Alex313031/beaker-ng"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/Beaker_Browser_${pkgver}_${arch}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Alex313031/beaker-ng/master/LICENSE")
sha256sums=('cd00c161609fcc885098f1ffa98802bd6c65fe65d248a0e7331475b27490c5ca'
            'eb791f2db5b80ad689773f5a5087942dabc577d5a22b5f5618d9c19f82facc17')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/beaker-ng.AppImage|g;s|beaker-browser|beaker-ng|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 144x144 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
