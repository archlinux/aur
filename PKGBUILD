# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: fengcheng <fengcheng@lidig.com>

_pkgname=wechat
_Pkgname=WechatLinux
_disname=wechat
_version=4.1.0
_image_url_x86_64=https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage
_image_url_aarch64=https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_arm64.AppImage
_last_modified_x86_64=1761904455
_last_modified_aarch64=1761904493

pkgname="${_pkgname}"-appimage
pkgver="${_version}"
pkgrel=2
pkgdesc="Wechat for Linux"
arch=('x86_64' 'aarch64')
url="https://linux.weixin.qq.com"
license=('custom')
options=(!strip !debug)
depends=('zlib' 'hicolor-icon-theme' 'fuse2' 'xcb-util-renderutil' 'xcb-util-image' 'xcb-util-wm')
provides=('wechat')

source=("LICENSE" "wechat")
source_x86_64=("${_Pkgname}-${_last_modified_x86_64}-x86_64.AppImage::${_image_url_x86_64}")
source_aarch64=("${_Pkgname}-${_last_modified_aarch64}-aarch64.AppImage::${_image_url_aarch64}")
sha256sums=('4348aee67f0c40bd29ec370fff75e24384907514a76104b43354d395c436f0f2'
            '7e021be7b7493b32484474e2030e3e0c52cd661959fd69e4b2b284aea4fc6c0b')
sha256sums_x86_64=('fabe446eee34195186da6da5982150fc99220ec37fbbb5c4b672eb07df3ad36c')
sha256sums_aarch64=('fdde5cacce8819dd24d1f4a5052431e13a48557ffc8a26fe6a7d1532458c35dc')

_last_modified=$(eval echo \${_last_modified_${CARCH}})
_appimage="${_Pkgname}-${_last_modified}-${CARCH}.AppImage"
noextract=(
    ${source_x86_64}
    ${source_aarch64}
)

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract ${_disname}.desktop
    ./"${_appimage}" --appimage-extract ${_disname}.png
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i \
        -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        -e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
        "squashfs-root/${_disname}.desktop"
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_disname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    install -Dm644 "${srcdir}/squashfs-root/${_disname}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/wechat" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
