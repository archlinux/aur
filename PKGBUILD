# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-tun
_pkgname=clash
pkgver=2021.05.08
pkgrel=1
pkgdesc="A rule-based tunnel in Go"
arch=('x86_64')
url="https://github.com/Dreamacro/clash"
license=('custom')
install=${pkgname}.install
depends=('glibc' 'clash-geoip' 'iptables' 'nftables' 'systemd' 'iproute2')
makedepends=('git' 'gzip')
provides=('clash' 'clash-dev' 'clash-dev-git')
conflicts=('clash' 'clash-dev' 'clash-dev-git')
backup=("etc/clash/config.yaml")
source=("git+https://github.com/Kr328/clash-premium-installer.git#commit=e729951"
        "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-2021.05.08.gz"
        "config.yaml")
sha256sums=('SKIP'
            '82e640ffd2ea50f948fb4899aca9659e46dc0b648b739c431ae4b107554e4301'
            '1552736c573d6722ed11654646a7ec2ea30b5ed3f4f2d3e9bbfb61227ad37026')

prepare() {
	cd "${srcdir}"/clash-premium-installer/scripts
	sed -i "s/srv/etc/g" clash.service
	sed -i "s/lib/share/g" clash.service
	sed -i "s/lib/share/g" 99-clash.rules
}

package() {
	cd "${srcdir}"
    gunzip --force clash-linux-amd64-2021.05.08.gz
	install -Dm 755 clash-linux-amd64-2021.05.08 "${pkgdir}"/usr/bin/clash
    install -Dm 644 ../config.yaml "${pkgdir}"/etc/clash/config.yaml
	cd "${srcdir}"/clash-premium-installer/scripts
    install -Dm 644 clash-default "${pkgdir}"/etc/default/clash
    install -Dm 755 bypass-proxy-pid "${pkgdir}"/usr/bin/bypass-proxy-pid
    install -Dm 755 bypass-proxy "${pkgdir}"/usr/bin/bypass-proxy
    install -Dm 700 clean-tun.sh "${pkgdir}"/usr/share/clash/clean-tun.sh
    install -Dm 700 setup-tun.sh "${pkgdir}"/usr/share/clash/setup-tun.sh
    install -Dm 700 setup-cgroup.sh "${pkgdir}"/usr/share/clash/setup-cgroup.sh
    install -Dm 644 99-clash.rules "${pkgdir}"/usr/lib/udev/rules.d/99-clash.rules
    install -Dm 644 clash.service "${pkgdir}"/usr/lib/systemd/system/clash.service
}
