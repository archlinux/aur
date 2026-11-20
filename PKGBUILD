# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: fengcheng <fengcheng@lidig.com>

_pkgname=wechat
_Pkgname=WechatLinux
_disname=wechat
_version=4.1.13
_image_url_x86_64=https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage
_image_url_aarch64=https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_arm64.AppImage
_last_modified_x86_64=1795157608
_last_modified_aarch64=1795157594

pkgname="${_pkgname}"-appimage
pkgver="${_version}"
pkgrel=6
pkgdesc="Wechat for Linux (Unpacked from AppImage without privileged AppRun)"
arch=('x86_64' 'aarch64')
url="https://qq.com"
license=('custom')
options=(!strip !debug)
# 移除 fuse2 依赖，因为已经直接解压部署
depends=('zlib' 'hicolor-icon-theme' 'xcb-util-renderutil' 'xcb-util-image' 'xcb-util-wm')
provides=('wechat')

source=("LICENSE" "wechat")
source_x86_64=("${_Pkgname}-${_last_modified_x86_64}-x86_64.AppImage::${_image_url_x86_64}")
source_aarch64=("${_Pkgname}-${_last_modified_aarch64}-aarch64.AppImage::${_image_url_aarch64}")
sha256sums=('4348aee67f0c40bd29ec370fff75e24384907514a76104b43354d395c436f0f2'
            '69581a30f98f6f97a47cb378d9e92b0b0ce8a07ba96ce63d4b2c3aa85d353b99')
sha256sums_x86_64=('65b152baeb60bad8d4f1b8e5abf800b1efd61e4294521d69405810168b3fc2c3')
sha256sums_aarch64=('16606db401cdcd82a1e8d49db45b57f1bc135b80100b8043e5498b9f55070bbd')

_last_modified=$(eval echo \${_last_modified_${CARCH}})
_appimage="${_Pkgname}-${_last_modified}-${CARCH}.AppImage"
noextract=(
    ${source_x86_64}
    ${source_aarch64}
)

prepare() {
    rm -rf squashfs-root wechat-unpacked
    chmod +x "${_appimage}"

    # 1. 提取外层 AppImage 内容
    ./"${_appimage}" --appimage-extract

    # 2. 将内嵌的真正程序包 wechat-payload.tar 解压到独立目录
    mkdir -p wechat-unpacked
    tar -xf "squashfs-root/wechat-payload.tar" -C wechat-unpacked
}

build() {
    # 修正 .desktop 启动项路径
    sed -i \
        -e "s|Exec=.*|Exec=/usr/bin/${_pkgname} %U|" \
        -e "s|Icon=.*|Icon=${_pkgname}|" \
        "squashfs-root/${_disname}.desktop"
}

package() {
    # 1. 部署解压后的核心程序文件（完全跳过官方的 AppRun 和 install-apparmor.sh）
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/wechat-unpacked/." "${pkgdir}/opt/${pkgname}/"

    # 确保权限干净，不赋予任何多余的 SUID 权限
    chown -R root:root "${pkgdir}/opt/${pkgname}"
    chmod -R u=rwX,go=rX "${pkgdir}/opt/${pkgname}"

    # 2. 安装许可证
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # 3. 安装桌面入口与图标
    install -Dm644 "${srcdir}/squashfs-root/${_disname}.desktop" \
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_disname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

    # 4. 安装保留并补充了注意项的自定义启动脚本
    install -Dm755 "${srcdir}/wechat" "${pkgdir}/usr/bin/${_pkgname}"
}
