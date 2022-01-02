# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-tun
pkgver=2022.01.02
pkgrel=1
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
sha512sums_i686=('83e885159b334517985c3b839b6672333ab0b2006cf18cb00876bdf94cc15ca83554db15970629aac68f8c210961914c8f5b2a3762ceeef033753835d6036d7f')
sha512sums_x86_64=('e81e961a11baa6a3a2bfe71bd52667b86d5e85833100c6f25ac3f36321bdda235e457735380dedb12ced580968a5c2a2394ebd512c208495c738674880ddcadd')
sha512sums_arm=('956248ce67f6071def37015881ce002684691ca7eae22c572b8f34a4e488f595ff4eba5c4ad048ba7ef8e31e7c02f77a153220800ec521d9c5cf6e2cf5645a29')
sha512sums_armv6h=('04def0e7e19bae0fe3e8711e0257d9c2992a879300e19a0961120acba9969ba4e21d42377031d807cd15c5490b3dbc374695e778356101c4d6dde2c70f27596f')
sha512sums_armv7h=('ff2186876f987448476ec388631fe57d240f243fbf76b01adab0d4f0adad17ceeff41060cfd2cd4d136ff41cc20c0ef8916f2b6825cf3aad17b965b09dab4e8b')
sha512sums_aarch64=('4d8f3a8e3e44ca3eaa171caaf77c2175a3f40d48a5ee28841ac5f76ea9b36a43bc06da39c1c0bc13f664fc6eac3408c57f0d89536519a9524f95082836dce99c')

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

