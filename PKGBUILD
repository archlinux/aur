# Maintainer: illusory <becomeillusory AT gmail DOT com>


pkgname=flclash-myflavor-bin
_pkgname=FlClash
pkgver=1.19.26
pkgrel=1
pkgdesc="Multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free, follows the mainline mihomo core updates. (Forked by myflavor)"
arch=('x86_64')
url="https://github.com/myflavor/FlClash"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}" 'flclash-bin')
provides=("${pkgname%-bin}=${pkgver}")

# 依赖库（沿用你参考的这几个关键依赖）
depends=(
    'libayatana-appindicator'
    'ayatana-ido'
    'libdbusmenu-glib'
    'libkeybinder3'
)


# 公共源文件：我们刚才创建的本地启动脚本
source=(
    "${pkgname%-bin}.sh"
)

# 针对不同架构，下载你自己的 GitHub Release
# 注意：你 Release 的文件名是大写的 FlClash-${pkgver}-linux-amd64.deb
source_x86_64=(
    "${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
)


sha256sums=('debddc0c8728bcbc552d0826ef0b5a4cd33e20df01752baa85e54498ec8ec3d5')
sha256sums_x86_64=('4de5ba5a0cca188e1c649829c893072dc2ca2748d7ae1917b8a3bee14d7a33e8')

prepare() {
    # 替换启动脚本里的占位符
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    
    # 解压 deb 包里的数据
    bsdtar -xf "${srcdir}/data.tar."*
    
    # 修正桌面快捷方式的图标、路径和分类
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        /\[Desktop Entry\]/a Categories=Network;
        /Categories=/a StartupWMClass=flclash
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
    # 1. 安装启动脚本到 /usr/bin/flclash
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    
    # 2. 将程序核心文件安装到 /usr/lib/flclash/
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    
    
    # 3. 安装快捷方式和图标
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    
    # 自动遍历可能存在的各种尺寸的图标并安装
    cd "${srcdir}/usr/share/icons/hicolor"
    for size in *; do
        if [ -f "${size}/apps/${_pkgname}.png" ]; then
            install -Dm644 "${size}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname%-bin}.png"
        fi
    done
}
