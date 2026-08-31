# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=welink
pkgname="deepin-wine-${_pkgname}"
_sparkname="com.huaweicloud.${_pkgname}.spark"
pkgver=7.53.7
_sparkver="${pkgver}spark2"
pkgrel=1
pkgdesc="华为云 WeLink 数字化办公平台（wine 封装，WoW64 运行）"
arch=('x86_64')
url="https://www.huaweicloud.com/product/welink.html"
license=('LicenseRef-proprietary')
depends=(
    'deepin-wine8-stable'
    '7zip'
    'hicolor-icon-theme'
)
optdepends=(
    'noto-fonts-cjk: 中文字体（推荐）'
    'wqy-microhei: 中文字体'
    'wqy-zenhei: 中文字体'
)
conflicts=("${_pkgname}" 'huaweicloudmeeting')
install="${pkgname}.install"
source=(
    "${pkgname}_${_sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/${_sparkname}/${_sparkname}_${_sparkver}_i386.deb"
    "${pkgname}.sh"
)
sha256sums=('4415488537b92e566d7d87ac1a80d6dddad73a0a820dbbfce18b01083496377b'
            'SKIP')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}"

    # 只安装 WeLink 应用归档（files.7z / md5sum），启动器在首次运行时
    # 解出到用户的 win64 容器，避免把 32 位 windows 系统树带进包
    install -Dm644 "${srcdir}/opt/apps/${_sparkname}/files/files.7z" \
        "${pkgdir}/opt/apps/${_sparkname}/files/files.7z"
    md5sum "${pkgdir}/opt/apps/${_sparkname}/files/files.7z" | awk '{print $1}' \
        > "${srcdir}/files.md5sum"
    install -Dm644 "${srcdir}/files.md5sum" \
        "${pkgdir}/opt/apps/${_sparkname}/files/files.md5sum"

    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # 桌面项与图标
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=WeLink
Name[zh_CN]=华为云 WeLink
Comment=Huawei Cloud digital workplace
Comment[zh_CN]=华为云数字化办公平台
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
Categories=Network;InstantMessaging;
StartupNotify=false
EOF

    local _s
    for _s in 32x32 48x48 64x64 96x96 128x128 256x256; do
        install -Dm644 \
            "${srcdir}/opt/apps/${_sparkname}/entries/icons/hicolor/${_s}/apps/6EBA_WeLink.0.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_s}/apps/${pkgname}.png"
    done
}