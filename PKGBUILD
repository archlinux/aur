# Maintainer: liyp <my@liyp.cc>
pkgname=uudeck
pkgver=2025.4.12.0001
pkgrel=2
pkgdesc="Simplified UU Accelerator for Steam Deck on Arch Linux"
arch=('x86_64')
license=('custom')
url='https://uu.163.com/'
depends=('curl' 'systemd')
source=("uuplugin_monitor.sh"
        "uuplugin.service")
sha256sums=('eff7ffa59d9352b919355a6f7b05f7e558f74731e188479de2855dd678670432'
            'bbddf6facbb33d5635fc72f65088830cdbe04f2a6926b2d0216bc8fccf53c02f')

package() {
    # 安装监控脚本
    install -Dm755 "$srcdir/uuplugin_monitor.sh" "$pkgdir/usr/bin/uuplugin_monitor"

    # 安装systemd服务
    install -Dm644 "$srcdir/uuplugin.service" "$pkgdir/usr/lib/systemd/system/uuplugin.service"

    # 创建配置目录
    install -dm755 "$pkgdir/etc/uu"

    # 创建插件目录
    install -dm755 "$pkgdir/usr/lib/uu"

    # 创建卸载脚本
    cat > "$pkgdir/usr/lib/uu/uninstall.sh" << 'EOF'
#!/bin/bash
systemctl stop uuplugin
systemctl disable uuplugin
rm -rf /usr/lib/uu
rm -rf /etc/uu
rm -f /usr/lib/systemd/system/uuplugin.service
rm -f /usr/bin/uuplugin_monitor
systemctl daemon-reload
EOF
    chmod +x "$pkgdir/usr/lib/uu/uninstall.sh"
}
