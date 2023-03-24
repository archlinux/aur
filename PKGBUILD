# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=toughcookies
pkgname="${_pkgname}-appimage"
pkgver=0.45.0
pkgrel=4
pkgdesc="A modern flash cards study and management app that runs cross-platform on Windows, Mac, and Linux."
arch=("x86_64")
url="https://www.toughcookies.net/"
license=('custom')
depends=(glibc zlib hicolor-icon-theme)
options=(!strip)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::https://downloads.toughcookies.net/v0.45.0/Tough-Cookies-0.45.0.AppImage")
sha256sums=('767dcd1fafa142e9178c7fe55f77a6d7f3f995d167bf4a2e0df978af377b59cf')
   
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=/Exec=\/opt\/appimages\/toughcookies.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    cat > LICENSE <<EOF
Yep, it's for Windows, Mac, and Linux. And it's FREE!
TC is a cross-platform app that runs on all modern versions of Windows, Mac OS and Linux. You can download and use it free of charge. Forever. There's no catch.
See https://www.toughcookies.net/#download
EOF
}   
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
