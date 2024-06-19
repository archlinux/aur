# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: yifwon <wyf9661@gmail.com>

_pkgname=wechat-universal
_disname=com.tencent.wechat
pkgname="${_pkgname}"-appimage
pkgver=1.0.0.241
pkgrel=2
pkgdesc="AppImage version of WeChat for linux desktop."
arch=('x86_64' 'aarch64')
url="https://github.com/zydou/WeChat-AppImage"
license=('custom')
options=(!strip !debug)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('wechat-universal')
conflicts=('wechat-universal' 'wechat-universal-bwrap')

source=("${_pkgname}.desktop::https://raw.githubusercontent.com/7Ji-PKGBUILDs/${_pkgname}-bwrap/master/${_pkgname}.desktop")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/WeChat-${pkgver}-x86_64.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.AppImage::${url}/releases/download/${pkgver}/WeChat-${pkgver}-aarch64.AppImage")
sha1sums=('cd7db5c2b96626255eac3db29a92af322d6e46b2')
sha1sums_x86_64=('82538d5cb9d5f3bf73d8bab57d353b29c02a36ee')
sha1sums_aarch64=('a66ed8a149205ab54d6b8d02db70638445bfbddd')

_appimage="${_pkgname}-${pkgver}-${CARCH}.AppImage"
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm644 "${srcdir}/squashfs-root/${_disname}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

