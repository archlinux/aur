# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: fengcheng <fengcheng@lidig.com>

_pkgname=wechat
_Pkgname=WechatLinux
_disname=wechat
_version=4.0.0.30
_image_url_x86_64=https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage
_image_url_aarch64=https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_arm64.AppImage

pkgname="${_pkgname}"-appimage
pkgver="${_version}"
pkgrel=1
pkgdesc="Wechat for Linux"
arch=('x86_64' 'aarch64')
url="https://linux.weixin.qq.com"
license=('custom')
options=(!strip !debug)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('wechat')

source=("LICENSE")
source_x86_64=("${_Pkgname}-${pkgver}-x86_64.AppImage::${_image_url_x86_64}")
source_aarch64=("${_Pkgname}-${pkgver}-aarch64.AppImage::${_image_url_aarch64}")
sha256sums=('4348aee67f0c40bd29ec370fff75e24384907514a76104b43354d395c436f0f2')
sha256sums_x86_64=('6a57952abb19b0cea4e2f6c873bf692760e657e846bd43e43939a20ea0aab941')
sha256sums_aarch64=('ef12cbeebff114adaaafba324e71b9fa78a864229165580d321538e110f666ee')

_appimage="${_Pkgname}-${pkgver}-${CARCH}.AppImage"
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i \
        -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        -e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
        "squashfs-root/${_disname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
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
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
