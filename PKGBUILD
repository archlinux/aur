# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-script
_pkgname=clash-premium-installer
pkgver=r11.e729951
pkgrel=2
pkgdesc="Simple clash premium core script for Linux."
arch=('any')
url="https://github.com/Kr328/clash-premium-installer"
license=('unknown')
install=${pkgname}.install
depends=('clash-premium-bin' 'systemd' 'nftables' 'iproute2')
makedepends=('git')
backup=("etc/clash/config.yaml" "etc/default/clash")
source=("git+https://github.com/Kr328/clash-premium-installer.git"
        "arch.patch"
		"config.yaml")
sha256sums=('SKIP' 
            'b12839b50154a1ff31fa6aa2e9de482ddd9a2bcd45a83bed0fae11549d479646'
			'1938bc7544f8e33a6e41636f45e87a17de2eac0ca14f47c2f7a71c3c87341bf0')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
			
prepare() {
    cd "${srcdir}"/clash-premium-installer/
    git apply ../arch.patch
}

package() {
    cd "${srcdir}"
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
