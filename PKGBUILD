# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-tun
_pkgname=clash
pkgver=2021.07.03
pkgrel=1
pkgdesc="A rule-based tunnel in Go for Linux with TUN"
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
        "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-2021.07.03.gz"
        "config.yaml")
sha256sums=('SKIP'
            '2f6d81b350048c71fc142ea743ee4463663170638286e49d71e1c7b930c2d5b4'
            '267f63b7b35ff59c0a183449d5a4c1bc5e5d3637f9a92389e60cd098bfeb5d32')

prepare() {
	cd "${srcdir}"/clash-premium-installer/scripts
	sed -i "s/srv/etc/g" clash.service
	sed -i "s/lib/share/g" clash.service
	sed -i "s/lib/share/g" 99-clash.rules
}

package() {
	cd "${srcdir}"
    gunzip --force clash-linux-amd64-2021.07.03.gz
	install -Dm 755 clash-linux-amd64-2021.07.03 "${pkgdir}"/usr/bin/clash
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
