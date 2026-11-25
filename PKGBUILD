# Maintainer: tsaitang404 <tsaitang.agent@gmail.com>
pkgname=openunivpn
pkgver=1.1.13
pkgrel=1
pkgdesc="H3C SecPath SSLVPN 开源替代客户端"
arch=('any')
url="https://github.com/tsaitang404/openunivpn"
license=('MIT')
depends=('python>=3.8' 'openresolv')
optdepends=('dnsmasq: exclusive VPN DNS with a local dnsmasq resolver')
makedepends=('git')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
install="$pkgname.install"

package() {
    cd "$srcdir/$pkgname"

    # 主程序
    install -Dm644 client.py config.py dns_backend.py protocol-format.md README.md -t "$pkgdir/opt/$pkgname/"

    # systemd service
    install -Dm644 openunivpn.service -t "$pkgdir/usr/lib/systemd/system/"

    # 系统配置示例（不直接安装 config.conf——升级时 pacman 会覆盖用户配置！
    # 规范：包内只装 example，运行时缺配置才由 service 从 example 复制）
    install -Dm600 /dev/stdin "$pkgdir/etc/$pkgname/config.conf.example" << 'EOF'
# OpenUniVPN 系统级配置示例
# 首次运行：sudo cp /etc/openunivpn/config.conf.example /etc/openunivpn/config.conf
# 然后编辑 /etc/openunivpn/config.conf 填写凭据，权限应保持 600

[auth]
username =
password =
# 可选：网关要求固定客户端 MAC 时填写 AA-BB-CC-DD-EE-FF；留空则使用本机 MAC
mac_address =

[gateway]
# 格式: host:port（端口可省略，缺省 443）
list =
# 默认校验 VPN 网关证书；仅在明确需要时设为 false。
# tls_verify = true

[tun]
name = cnem0
# 可选：逗号分隔的 IPv4 CIDR；留空只使用协商网段及网关下发路由。
extra_routes =

[dns]
backend = resolvconf
# resolvconf 的独立标签，不是 TUN 接口名；避免与其他 VPN 共用 vpn0
resolvconf_iface = vpn-openunivpn
EOF

    # 会话目录
    install -dm755 "$pkgdir/var/lib/$pkgname"

    # 许可证
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
