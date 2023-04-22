# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="toughcookies-appimage"
pkgver=0.45.0
pkgrel=5
pkgdesc="A modern flash cards study and management app that runs cross-platform on Windows, Mac, and Linux."
arch=("x86_64")
url="https://www.toughcookies.net/"
license=('custom')
depends=('glibc' 'zlib' 'hicolor-icon-theme')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://downloads.toughcookies.net/v0.45.0/Tough-Cookies-0.45.0.AppImage")
sha256sums=('767dcd1fafa142e9178c7fe55f77a6d7f3f995d167bf4a2e0df978af377b59cf')
   
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/toughcookies.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
    cat > LICENSE <<EOF
Yep, it's for Windows, Mac, and Linux. And it's FREE!
TC is a cross-platform app that runs on all modern versions of Windows, Mac OS and Linux. You can download and use it free of charge. Forever. There's no catch.
See https://www.toughcookies.net/#download
EOF
}   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}