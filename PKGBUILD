# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=notable
pkgname="${_pkgname}-appimage"
pkgver=1.8.4
pkgrel=3
pkgdesc="The Markdown-based note-taking app that doesn't suck."
arch=("x86_64")
url="https://notable.app/"
_githuburl="https://github.com/notable/notable"
license=('custom')
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin")
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Notable-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/SOURCE_CODE.md")
sha256sums=('7ee59f198613f35e8cdb21b73dc100cb1798201716ed9b108e5398a8f9477f67'
            '761159ffb2c4caef19adde130bebbffcc98e57aa98cde860a05d986f95e6ed4f')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=/Exec=\/opt\/appimages\/notable.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
