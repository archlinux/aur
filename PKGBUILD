# Maintainer: Alvin

pkgname=pvz-hybrid-bin
_reponame=pvz-hybrid
pkgver=0.20
pkgrel=1
pkgdesc="植物大战僵尸杂交版linux版 (基于 Godot 原生运行)"
arch=('x86_64') 
url="https://www.pvzhe.com"
license=('unknown')
depends=('godot')
install="${pkgname}.install"

# 声明网络依赖文件：从 Release 下载 pck，从 main 分支 raw 下载 icon
source=(
    "https://github.com/cublueer/${_reponame}/releases/download/v${pkgver}/${_reponame}-v${pkgver}.pck"
    "https://raw.githubusercontent.com/cublueer/${_reponame}/main/icon.png"
)

# 校验
sha256sums=('68f34fe6ea151734a43052fe519a8adb97119bf104ab675808abf94ed2b57c6f'
            '4cd2117b55449b7cbf396edc0b02f323cac2020d60aa44330b204f748e9f8426')

package() {
    # 1. 创建目标目录
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/pixmaps"

    # 2. 安装核心数据包 (.pck) 到 /usr/share
    install -Dm644 "${_reponame}-v${pkgver}.pck" "${pkgdir}/usr/share/${pkgname}/"

    # 3. 创建并安装启动脚本到 /usr/bin
    cat <<EOF > "${pkgdir}/usr/bin/${pkgname}"
#!/bin/bash
# 启动 Godot 并加载游戏数据包
exec godot --main-pack "/usr/share/${pkgname}/${_reponame}-v${pkgver}.pck" "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # 4. 安装应用图标
    install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # 5. 创建并安装 .desktop 桌面快捷方式文件
    cat <<EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Name=植物大战僵尸杂交版
Name[en]=Plants vs Zombies Hybrid
Comment=植物大战僵尸杂交版 (pvz-hybrid)
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Game;StrategyGame;
EOF
}
