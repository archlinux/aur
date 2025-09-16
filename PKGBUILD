# Maintainer: xifan <xifan233@163.com>
pkgname=ziniaobrowser-bin
pkgver=6.9.0.9
pkgrel=2
pkgdesc="紫鸟浏览器 - 基于 Chromium 的浏览器"
arch=('x86_64')
url="https://www.ziniao.com/"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: for system tray support')
source=("$pkgname-$pkgver.deb::https://cdn-superbrowser-web.ziniao.com/v6/ziniao_x64_6.9.0.9_production.deb")
sha256sums=('8c3ef239674bc861618059dc8d792bb2c762ba7dd1a58af7af3cbdb7d6d1486b')
noextract=("$pkgname-$pkgver.deb")

package() {
    cd "$srcdir"
    
    # 提取 deb 包
    ar x "$pkgname-$pkgver.deb"
    tar -xf data.tar.xz -C "$pkgdir/"
    
    # 修复权限
    find "$pkgdir" -type d -exec chmod 755 {} \;
    find "$pkgdir" -type f -exec chmod 644 {} \;
    
    # 设置可执行文件权限
    if [ -d "$pkgdir/opt" ]; then
        find "$pkgdir/opt" -name "ziniaobrowser" -exec chmod 755 {} \;
        find "$pkgdir/opt" -name "chrome_crashpad_handler" -exec chmod 755 {} \;
        find "$pkgdir/opt" -name "chrome-sandbox" -exec chmod 4755 {} \;
        find "$pkgdir/opt" -name "env-kit" -exec chmod 755 {} \;
        find "$pkgdir/opt" -name "ziniao-gateway" -exec chmod 755 {} \;
    fi
    
    # 创建启动脚本
    mkdir -p "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/ziniao" << 'EOF'
#!/bin/bash
exec /opt/ziniao/ziniaobrowser "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/ziniao"
    
    # 修改桌面文件
    sed -i 's|Name=ziniao|Name=紫鸟浏览器\nName[en]=ziniao|' "$pkgdir/usr/share/applications/ziniaobrowser.desktop"
    sed -i 's|Exec=/opt/ziniao/ziniaobrowser %U|Exec=ziniao %U|' "$pkgdir/usr/share/applications/ziniaobrowser.desktop"
}
