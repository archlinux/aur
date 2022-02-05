# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-tun
pkgver=2022.01.27
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
sha512sums_i686=('237a7c2d0d1ae14b97d01b76d9a9f8e015732de2182636eb26fb72a6902ed0363fd329b5c3789552ece437ce9293dfdde10ffbe34e5de41400c2530a022e437b')
sha512sums_x86_64=('2213c4f9e6479b8fb72a88a33c49bf19a2e83715389cce985423fdb01929786a4366529e48c5d59376cf66f9f11f0b3c1858633d0e97e98903e623f098f2cb9a')
sha512sums_arm=('97de006620dd00412049a1964306e676e9f4b5a1fa5b0f07dfa72c0d0ac4aba1097744c8339f64e907d5a824b6243f184e7dfb6dfac3370a1887becda6859d4d')
sha512sums_armv6h=('d2a12ed5a80f539c9b40987a18fd0f86e2a48077f1e74f180e78a708df0c28ebe9207b6f2f7066c0fba7d72e2e29cf30ce3318ca9b2401a2c746a18e5426b7c1')
sha512sums_armv7h=('33f983d3009a2405030fe2233ea327a31f4389a62c358f65d2d97eb45c5b30514d178b04b7eda82e5981255350bc1854b47f4b1c48bd48094cf46f602b352c22')
sha512sums_aarch64=('e246ae8dd5ecd8b5216183eff6ebbaa491dd034b58120da2c1698ea2a9c7fbf12ecb4c457516ba4c029e60fcec03d711e8c7b78e15ebf4a5b600cd74d45b7c9a')

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

