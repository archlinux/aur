# Maintainer: rzhli
pkgname=longbridge-bin
pkgver=0.17.1
pkgrel=1
pkgdesc="Longbridge Desktop trading platform"
arch=("x86_64")
url="https://longbridge.com/desktop/"
license=("custom")
depends=(
    "glibc"
    "gtk3"
    "nss"
    "alsa-lib"
    "libxss"
    "libxtst"
    "xdg-utils"
    "libxcrypt-compat"
    "webkit2gtk-4.1"
)
provides=("longbridge")
conflicts=("longbridge")
options=('!strip')
source=("https://assets.lbctrl.com/github/release/longbridge-desktop/stable/longbridge-v${pkgver}-linux-x86_64.deb")
sha256sums=('9b9390023a0f529811215ec4d29871326369ee0a44c0c6591f740b7598f28ed3')

prepare() {
    cd "$srcdir"

    # 清理并创建解压目录
    rm -rf ext
    mkdir -p ext

    # 提取 deb 中的 data.tar.*
    bsdtar -xf data.tar.* -C ext

    # 调试:查看实际文件结构
    echo "=== 检查 DEB 包结构 ==="
    find ext -type f | head -20
}

package() {
    cd "$srcdir/ext"

    # ========================================
    # 1. 复制所有文件到标准位置
    # ========================================

    # 主要文件在 usr/ 下,直接复制整个目录
    if [[ -d "usr" ]]; then
        cp -a usr "$pkgdir/"
    fi

    # 如果还有 usr/local,也迁移到 usr
    if [[ -d "usr/local" ]]; then
        mkdir -p "$pkgdir/usr"
        cp -a usr/local/* "$pkgdir/usr/"
    fi

    # ========================================
    # 2. 修复桌面文件
    # ========================================

    local _desktop="$pkgdir/usr/share/applications/longbridge.desktop"

    if [[ -f "$_desktop" ]]; then
        # 修复 TryExec 为绝对路径
        sed -i "s|^TryExec=.*|TryExec=/usr/bin/longbridge|g" "$_desktop"

        # 修复 Exec - 不添加任何参数，让程序自己处理
        sed -i "s|^Exec=.*|Exec=/usr/bin/longbridge %U|g" "$_desktop"

        # 确保图标正确
        sed -i "s|^Icon=.*|Icon=longbridge|g" "$_desktop"

        # 修复类别 - 改为网络/互联网类别
        if grep -q "^Categories=" "$_desktop"; then
            sed -i "s|^Categories=.*|Categories=Network;Finance;|g" "$_desktop"
        else
            echo "Categories=Network;Finance;" >> "$_desktop"
        fi

        # 确保其他必需字段存在
        if ! grep -q "^Terminal=" "$_desktop"; then
            echo "Terminal=false" >> "$_desktop"
        fi

        if ! grep -q "^Type=" "$_desktop"; then
            echo "Type=Application" >> "$_desktop"
        fi

        if ! grep -q "^StartupNotify=" "$_desktop"; then
            sed -i "s|^StartupNotify=.*|StartupNotify=true|g" "$_desktop"
        fi
    else
        error "桌面文件不存在: $_desktop"
        return 1
    fi

    # ========================================
    # 3. 确保主程序可执行
    # ========================================

    if [[ -f "$pkgdir/usr/bin/longbridge" ]]; then
        chmod +x "$pkgdir/usr/bin/longbridge"
    else
        error "未找到主程序 /usr/bin/longbridge"
        return 1
    fi

    # ========================================
    # 4. 许可证文件
    # ========================================

    find . -name "copyright" -exec install -Dm644 {} "$pkgdir/usr/share/licenses/$pkgname/LICENSE" \; || true
}

post_install() {
    echo "正在更新桌面数据库..."
    update-desktop-database -q

    echo "正在更新图标缓存..."
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor || true

    echo ""
    echo "Longbridge 安装完成!"
    echo "如果图标未显示,请尝试:"
    echo "  1. 注销并重新登录"
    echo "  2. 运行: gtk-update-icon-cache -f /usr/share/icons/hicolor"
    echo ""
}

post_upgrade() {
    post_install
}

post_remove() {
    update-desktop-database -q
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor || true
}
