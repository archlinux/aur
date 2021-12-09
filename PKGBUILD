# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-tun
pkgver=2021.12.07
pkgrel=1
pkgdesc="A rule-based tunnel in Go for Linux with TUN"
arch=('x86_64')
url="https://github.com/Dreamacro/clash"
license=('unknown')
install=${pkgname}.install
depends=('clash-geoip' 'nftables' 'systemd' 'iproute2')
makedepends=('git' 'gzip')
provides=('clash')
conflicts=('clash')
backup=("etc/clash/config.yaml")
source=("git+https://github.com/Kr328/clash-premium-installer.git#commit=e729951"
        "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-${pkgver}.gz"
        "config.yaml")
sha256sums=('SKIP' 
            '8ee636be9cb6590c95b583dc023eddebe4fe02791e393a2011e3b393d3941993'
            '1938bc7544f8e33a6e41636f45e87a17de2eac0ca14f47c2f7a71c3c87341bf0')

prepare() {
	cd "${srcdir}"/clash-premium-installer/scripts
	sed -i "s/srv/etc/g" clash.service
	sed -i "s/lib/share/g" clash.service
	sed -i "s/bin\/bypass/share\/clash\/bypass/g" clash.service
	sed -i "s/\ iptabels.service//g" clash.service
	sed -i "s/lib/share/g" 99-clash.rules
	sed -i "s/1.0.0.1/198.18.0.2/g" clash-default
	sed -i "s/bypass/\/usr\/share\/clash\/bypass/g" bypass-proxy
}

package() {
	cd "${srcdir}"
    gunzip --force clash-linux-amd64-${pkgver}.gz
	install -Dm 755 clash-linux-amd64-${pkgver} "${pkgdir}"/usr/bin/clash
    install -Dm 644 config.yaml "${pkgdir}"/etc/clash/config.yaml
	cd "${srcdir}"/clash-premium-installer/scripts
    install -Dm 644 clash-default "${pkgdir}"/etc/default/clash
    install -Dm 755 bypass-proxy-pid "${pkgdir}"/usr/share/clash/bypass-proxy-pid
    install -Dm 755 bypass-proxy "${pkgdir}"/usr/share/clash/bypass-proxy
    install -Dm 700 clean-tun.sh "${pkgdir}"/usr/share/clash/clean-tun.sh
    install -Dm 700 setup-tun.sh "${pkgdir}"/usr/share/clash/setup-tun.sh
    install -Dm 700 setup-cgroup.sh "${pkgdir}"/usr/share/clash/setup-cgroup.sh
    install -Dm 644 99-clash.rules "${pkgdir}"/usr/lib/udev/rules.d/99-clash.rules
    install -Dm 644 clash.service "${pkgdir}"/usr/lib/systemd/system/clash.service
}
