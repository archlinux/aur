# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: yifwon <wyf9661@gmail.com>

_pkgname=wechat-universal
pkgname="${_pkgname}"-appimage
pkgver=4.0.0.30
pkgrel=1
pkgdesc="AppImage version of WeChat for linux desktop."
arch=('x86_64' 'aarch64')
url="https://linux.weixin.qq.com/"
_downloadurl="https://dldir1v6.qq.com/weixin/Universal/Linux"
license=('custom')
options=(!strip !debug)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('wechat-universal')
conflicts=('wechat-universal' 'wechat-universal-bwrap')

source_x86_64=("${_pkgname}-${pkgver}-x86_64.AppImage::${_downloadurl}/WeChatLinux_x86_64.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.AppImage::${_downloadurl}/WeChatLinux_arm64.AppImage")

sha1sums_x86_64=('SKIP')
sha1sums_aarch64=('SKIP')

_appimage="${_pkgname}-${pkgver}-${CARCH}.AppImage"
noextract=("${_appimage}")

_install_path=/opt/${pkgname}

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
    sed 's/Exec=/\#Exec=/g' -i "${srcdir}/squashfs-root/wechat.desktop"
    echo "Exec=${_install_path}/${_pkgname}.AppImage --no-sandbox %U" >> "${srcdir}/squashfs-root/wechat.desktop"
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/wechat.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm644 "${srcdir}/squashfs-root/wechat.png" -t "${pkgdir}/usr/share/icons"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

