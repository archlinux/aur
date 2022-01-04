# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-tun
pkgver=2022.01.03
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
sha512sums_i686=('5e511518b5e58933e80374200f50f2b6d46f5a189231c9d074050d4441e4700f900a994d4e77d26df7b5beb335824c7ecf619553dfabfcc820fa2774b9804038')
sha512sums_x86_64=('7a7e471e707bd9e61edc07ec335dd2236c6b156e434ab6aa1d90607c643d36345f8860ce1bb6172bbc703769799e75bf60418dc276fded5d69feeb911f69c4f6')
sha512sums_arm=('9e65b363b956cd601c29ea2dc734c6bd6cedf8c9e7d12d4ec91ba2e8ef54a01120e15d7fe2d8fb5782f2c805c86c09b9210ce6edb24e6cbd99c1c6a29442f4a2')
sha512sums_armv6h=('365167341c0a665cfa10c4b4a447a603dfa1cee00c3950bd1072b667659fd3f16d3229ffdee24d6f7e7baac782914267e6b47360cbf11606f63661f75df7c3b3')
sha512sums_armv7h=('460f65f8c32297a83f4218268e2dd1bbcca56304369dcdb8730ef9edfab30c9af77b1eeaaba4528361d831e543e51fd89f864283d364aebe8609114a660c0854')
sha512sums_aarch64=('7cebddc92db7613a24b36dc12172226e7e3687b9725cfad2bb2f62f8690378b40559daa46269d53e666adc5eacb8f5d66e78351aec229cd43462b7c5fda76cb1')

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

