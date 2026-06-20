# Maintainer: ELITE <3504638270@qq.com>
# Original Author: scgm0 (MystiVaid)
pkgname=mvl-bin
_pkgname=mvl
pkgver=1.0.1
pkgrel=1
pkgdesc="第三方启动器，用于管理和启动 Vintage Story 游戏（内置游戏下载功能）"
arch=('x86_64')
url="https://github.com/scgm0/MVL"
license=('MIT')
depends=('fuse2')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=(
    "${pkgname}-${pkgver}.AppImage::https://github.com/scgm0/MVL/releases/download/${pkgver}/MVL-${pkgver}.AppImage"
)
sha256sums=('a08c501c186d6987f477abb584298c25899886525079c36ec7594723d26217c2')
noextract=("${pkgname}-${pkgver}.AppImage")

package() {
    cd "$srcdir"

    # 赋予 AppImage 执行权限并解包
    chmod +x "${pkgname}-${pkgver}.AppImage"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    cd squashfs-root

    # 创建安装目录
    install -dm755 "$pkgdir/opt/${pkgname}"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"

    # 安装主程序二进制和 Godot 数据包（保留原文件名 MVL）
    install -Dm755 MVL.x86_64 "$pkgdir/opt/${pkgname}/MVL"
    install -Dm644 MVL.pck "$pkgdir/opt/${pkgname}/MVL.pck"

    # 复制整个 data_MVL_linuxbsd_x86_64 目录（含 MVL.so）
    cp -r data_MVL_linuxbsd_x86_64 "$pkgdir/opt/${pkgname}/"
    find "$pkgdir/opt/${pkgname}/data_MVL_linuxbsd_x86_64" -type d -exec chmod 755 {} \;
    find "$pkgdir/opt/${pkgname}/data_MVL_linuxbsd_x86_64" -type f -exec chmod 644 {} \;
    chmod +x "$pkgdir/opt/${pkgname}/data_MVL_linuxbsd_x86_64/MVL.so" 2>/dev/null || true

    # 创建启动脚本（命令为 mvl，执行 ./MVL）
    cat > "$pkgdir/usr/bin/${_pkgname}" << EOF
#!/bin/sh
cd /opt/${pkgname}
exec ./MVL "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/${_pkgname}"

    # 安装 .desktop 文件（保留原有的 sed 修正）
    if [ -f "mvl.desktop" ]; then
        install -Dm644 mvl.desktop "$pkgdir/usr/share/applications/${_pkgname}.desktop"
        sed -i "s|^Exec=.*|Exec=${_pkgname}|g" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
        sed -i "s|^Icon=.*|Icon=${_pkgname}|g" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    fi

    # 安装图标（直接使用解包出的 icon.svg，重命名为 mvl.svg）
    if [ -f "icon.svg" ]; then
        install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
    fi

    # 安装许可证（如果存在）
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
