pkgname=xrayr-git
pkgver=latest
pkgrel=1
pkgdesc="A Xray backend framework that can easily support many panels"
arch=('x86_64' 'aarch64')
url="https://github.com/XrayR-project/XrayR"
depends=('fakeroot')
license=('MIT')

source=("https://github.com/XrayR-project/XrayR-release/raw/master/XrayR.service" "https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/XrayR.sh")
source_x86_64=("$url/releases/latest/download/XrayR-linux-64.zip")
source_aarch64=("$url/releases/latest/download/XrayR-linux-arm64-v8a.zip")
sha256sums=('SKIP' 'SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

prepare() {
    cd "$srcdir"
    chmod +x XrayR
    chmod +x XrayR.sh
    sed -i 's/debian/Arch Linux/g' XrayR.sh
    sed -i 's/-lt 8/-lt 0/g' XrayR.sh
}

package() {
    cd "$srcdir"
    install -Dm755 "$srcdir/XrayR.sh" "$pkgdir"/usr/bin/XrayR
    install -Dm755 "$srcdir/XrayR.sh" "$pkgdir"/usr/bin/xrayr
    install -Dm644 "$srcdir/XrayR.service" "${pkgdir}"/etc/systemd/system/XrayR.service
    rm *.zip *.sh *.service
    mkdir -p "$pkgdir"/usr/local/XrayR
    cp -r "$srcdir"/* "$pkgdir/usr/local/XrayR/"
    mkdir -p "$pkgdir"/etc/XrayR
    install -Dm644 "$srcdir/config.yml" "$pkgdir"/etc/XrayR/config.yml
    install -Dm644 "$srcdir/dns.json" "$pkgdir"/etc/XrayR/dns.json
    install -Dm644 "$srcdir/rulelist" "$pkgdir"/etc/XrayR/rulelist
    install -Dm644 "$srcdir/route.json" "$pkgdir"/etc/XrayR/route.json
    install -Dm644 "$srcdir/geoip.dat" "$pkgdir"/etc/XrayR/geoip.dat
    install -Dm644 "$srcdir/geosite.dat" "$pkgdir"/etc/XrayR/geosite.dat
    install -Dm644 "$srcdir/custom_inbound.json" "$pkgdir"/etc/XrayR/custom_inbound.json
    install -Dm644 "$srcdir/custom_outbound.json" "$pkgdir"/etc/XrayR/custom_outbound.json
    echo -e ""
    echo "XrayR 管理脚本使用方法 (兼容使用xrayr执行，大小写不敏感): "
    echo "------------------------------------------"
    echo "XrayR                    - 显示管理菜单 (功能更多)"
    echo "XrayR start              - 启动 XrayR"
    echo "XrayR stop               - 停止 XrayR"
    echo "XrayR restart            - 重启 XrayR"
    echo "XrayR status             - 查看 XrayR 状态"
    echo "XrayR enable             - 设置 XrayR 开机自启"
    echo "XrayR disable            - 取消 XrayR 开机自启"
    echo "XrayR log                - 查看 XrayR 日志"
    echo "XrayR update             - 更新 XrayR"
    echo "XrayR update x.x.x       - 更新 XrayR 指定版本"
    echo "XrayR config             - 显示配置文件内容"
    echo "XrayR install            - 安装 XrayR"
    echo "XrayR uninstall          - 卸载 XrayR"
    echo "XrayR version            - 查看 XrayR 版本"
    echo "------------------------------------------"
    echo -e "\033[33m请使用 systemctl enable --now XrayR 启动服务\033[0m"
    echo "------------------------------------------"
}
