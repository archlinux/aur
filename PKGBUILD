# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-tun
pkgver=2021.12.07
pkgrel=2
pkgdesc="A rule-based tunnel in Go for Linux with TUN"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Dreamacro/clash"
license=('unknown')
install=${pkgname}.install
depends=('clash-geoip' 'nftables' 'systemd' 'iproute2')
makedepends=('git' 'gzip')
provides=('clash')
conflicts=('clash')
backup=("etc/clash/config.yaml" "etc/default/clash")
source=("git+https://github.com/Kr328/clash-premium-installer.git#commit=e729951"
        "arch.patch"
		"config.yaml")

sha512sums=('SKIP'
            '19287a6707d90d6fb699cbbfb09ba2e44bcfda7e1260f7d5d51c8c9135cdc5584cf671d095cb1b9ac7db9489c3e33affaa2ff4c3f1b4cd67ec1ab4d692edd4df'
			'd7d9d4ee334068c14d80f567914775d2df9638b65d34763aab228dabcaeebace9db1a16f0e42ce657ade731ae34ebb23cee9a5cac8ad18b9c378606436266ffe')
source_i686=("clash-linux-i686-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-386-${pkgver}.gz")
source_x86_64=("clash-linux-x86_64-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-${pkgver}.gz")
source_arm=("clash-linux-arm-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv5-${pkgver}.gz")
source_armv6h=("clash-linux-armv6h-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv6-${pkgver}.gz")
source_armv7h=("clash-linux-armv7h-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv7-${pkgver}.gz")
source_aarch64=("clash-linux-aarch64-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv8-${pkgver}.gz")
sha512sums_i686=('34cf1056f71fa7e830fe50b84deca889dd71d1bffe1c0ba15cce83e4b839dca9ed640ae5c14a5227ccd8bd0388c8ae06f750c0b7c997a192a628e51bb91bffdb')
sha512sums_x86_64=('460a8cc50042ccffa0ce56aac4f33568496a163f234ead2cbec2e923f917e946e425ff3d4d170455bb6d583f484f1f010ba1b444757a9540d18560b3f317c4f0')
sha512sums_arm=('40a0af3df3591b2c0b1a5e339ca68f662adbef2defdeeb55bd0bb0502268e5c5d5a9896083072c65e32a50aead51c5679214a4e206b1e620c8495cc972d31a6b')
sha512sums_armv6h=('03f417d86dea709d084e8638bf2058cc8e54c3efcce876db64b453562b55edb31c5d6f0237575e2abdc73cf765868868c520b85940b8a2acf07d68fc39fcd809')
sha512sums_armv7h=('3e2386b6ca14a8f887db00851cf963cd393de2d1bd15836a808a845077e2893d26206187985fc3988341493e507e42dd1b363f5a0c2f5a219d99eb1f68908277')
sha512sums_aarch64=('637139496b9e166e3dcc1d64e6b3a5ce24aaa6991be5d88e9b61ad36a4650f2f24df7ee623db43091cf4e21d71c3ed8c90919d39c8944eeb1b5f2be763f60325')

prepare() {
    cd "${srcdir}"/clash-premium-installer/
    git apply ../arch.patch
}

package() {
    cd "${srcdir}"
    gunzip --force clash-linux-${CARCH}-${pkgver}.gz
    install -Dm 755 clash-linux-${CARCH}-${pkgver} "${pkgdir}"/usr/bin/clash
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

