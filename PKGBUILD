# Maintainer: ELITE <3504638270@qq.com>
# Original Author: scgm0 (MystiVaid)
pkgname=mvl-launcher-bin
_pkgname=mvl-launcher
pkgver=1.0.0
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
sha256sums=('28a66c33353635744f24c8d72d5c462e30f799a05e1489bc37bdf735452d59d7')
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

    # 安装主程序二进制和 Godot 数据包
    install -Dm755 MVL.x86_64 "$pkgdir/opt/${pkgname}/MVL"
    install -Dm644 MVL.pck "$pkgdir/opt/${pkgname}/MVL.pck"

    # 复制整个 data_MVL_linuxbsd_x86_64 目录（含 MVL.so）
    cp -r data_MVL_linuxbsd_x86_64 "$pkgdir/opt/${pkgname}/"
    find "$pkgdir/opt/${pkgname}/data_MVL_linuxbsd_x86_64" -type d -exec chmod 755 {} \;
    find "$pkgdir/opt/${pkgname}/data_MVL_linuxbsd_x86_64" -type f -exec chmod 644 {} \;
    chmod +x "$pkgdir/opt/${pkgname}/data_MVL_linuxbsd_x86_64/MVL.so" 2>/dev/null || true

    # 创建启动脚本（设置库路径）
    cat > "$pkgdir/usr/bin/${_pkgname}" << EOF
#!/bin/sh
cd /opt/${pkgname}
export LD_LIBRARY_PATH="\$PWD/data_MVL_linuxbsd_x86_64:\$LD_LIBRARY_PATH"
exec ./MVL "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/${_pkgname}"

    # 安装 .desktop 文件（直接使用解包出的 mvl.desktop）
    if [ -f "mvl.desktop" ]; then
        install -Dm644 mvl.desktop "$pkgdir/usr/share/applications/${_pkgname}.desktop"
        sed -i "s|^Exec=.*|Exec=${_pkgname}|g" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
        sed -i "s|^Icon=.*|Icon=${_pkgname}|g" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    fi

    # 安装图标（直接使用解包出的 icon.svg）
    if [ -f "icon.svg" ]; then
        install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
    fi

    # 安装许可证（如果存在）
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
