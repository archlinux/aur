# Maintainer: tsaitang404 <tsaitang.agent@gmail.com>
pkgname=openunivpn
pkgver=1.1.6
pkgrel=1
pkgdesc="H3C SecPath SSLVPN 开源替代客户端"
arch=('any')
url="https://github.com/tsaitang404/openunivpn"
license=('MIT')
depends=('python>=3.8' 'openresolv')
makedepends=('git')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
install="$pkgname.install"

package() {
    cd "$srcdir/$pkgname"

    # 主程序
    install -Dm644 client.py config.py protocol-format.md README.md -t "$pkgdir/opt/$pkgname/"

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

[gateway]
# 格式: host:ip 或 host:port（缺省 443）
list =

[tun]
name = cnem0
EOF

    # 会话目录
    install -dm755 "$pkgdir/var/lib/$pkgname"

    # 许可证
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
