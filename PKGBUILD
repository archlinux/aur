# Maintainer: MCB-SMART-BOY <mcb2720838051@gmail.com>
pkgname=gridix-appimage
pkgver=2.0.2
pkgrel=1
pkgdesc="简洁、快速、安全的跨平台数据库管理工具，Helix/Vim 风格键位 (AppImage)"
arch=('x86_64')
url="https://github.com/MCB-SMART-BOY/Gridix"
license=('Apache-2.0')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
provides=('gridix')
conflicts=('gridix' 'gridix-bin')
options=('!strip')
source=("gridix-${pkgver}.AppImage::https://github.com/MCB-SMART-BOY/Gridix/releases/download/v${pkgver}/gridix.AppImage"
        "LICENSE::https://raw.githubusercontent.com/MCB-SMART-BOY/Gridix/v${pkgver}/LICENSE")
sha256sums=('1a3f30b69bda227657f6136fa05c0786bfceab0b1e29c61a4f5b91a0628898e3' 'SKIP')

prepare() {
    chmod +x "gridix-${pkgver}.AppImage"
}

package() {
    # 安装 AppImage
    install -Dm755 "gridix-${pkgver}.AppImage" "$pkgdir/opt/gridix/gridix.AppImage"
    
    # 创建启动脚本
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/gridix" << END
#!/bin/sh
exec /opt/gridix/gridix.AppImage "\$@"
END
    chmod 755 "$pkgdir/usr/bin/gridix"
    
    # 安装桌面文件
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/gridix.desktop" << END
[Desktop Entry]
Name=Gridix
Comment=跨平台数据库管理工具
Comment[en]=Cross-platform database management tool
Exec=gridix
Icon=gridix
Terminal=false
Type=Application
Categories=Development;Database;
Keywords=database;sql;sqlite;postgresql;mysql;
END
    
    # 安装许可证
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
