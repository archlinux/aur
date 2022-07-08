# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-tun
pkgver=2022.07.07
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
source=("git+https://github.com/Kr328/clash-premium-installer.git#commit=c2b80f9"
        "arch.patch"
        "config.yaml")

sha512sums=('SKIP'
            '0139f81960af17a8c3ac43a98bc847ee429ec168a8ff2e5393e5bf42d5df779ae6ce9ed33e4301e3888f475525e1777c919044c64979987df9d92c0647f83ab8'
            'd7d9d4ee334068c14d80f567914775d2df9638b65d34763aab228dabcaeebace9db1a16f0e42ce657ade731ae34ebb23cee9a5cac8ad18b9c378606436266ffe')
source_i686=("clash-linux-i686-${pkgver}.gz::https://release.dreamacro.workers.dev/${pkgver}/clash-linux-386-${pkgver}.gz")
source_x86_64=("clash-linux-x86_64-${pkgver}.gz::https://release.dreamacro.workers.dev/${pkgver}/clash-linux-amd64-${pkgver}.gz")
source_arm=("clash-linux-arm-${pkgver}.gz::https://release.dreamacro.workers.dev/${pkgver}/clash-linux-armv5-${pkgver}.gz")
source_armv6h=("clash-linux-armv6h-${pkgver}.gz::https://release.dreamacro.workers.dev/${pkgver}/clash-linux-armv6-${pkgver}.gz")
source_armv7h=("clash-linux-armv7h-${pkgver}.gz::https://release.dreamacro.workers.dev/${pkgver}/clash-linux-armv7-${pkgver}.gz")
source_aarch64=("clash-linux-aarch64-${pkgver}.gz::https://release.dreamacro.workers.dev/${pkgver}/clash-linux-armv8-${pkgver}.gz")
sha512sums_i686=('1db5c7eda3fb35fb70a56eaa3879b0ef5a660a4c64ab39ea6698a123cc801679caf4c0926719333fd25111a25a3b6b3eb93759a597da1e375a9126ae712940ba')
sha512sums_x86_64=('489bb44cbe976a6e0af86313f112fc571fe30bdc496f8a8d1da2f8547f27d8163aa4bd3e0e27bd01183930ec3600d33dd60e7114a0ac0e60c08f0ed760d375ae')
sha512sums_arm=('b5b717834a3b33c8f4bf98e80a8ec6b240fca712f513b7d6c2b8c2c65642c0719d4e9e78e436114d1ab1405572a165e5bf5ce48823363ab9215d88191be0fda6')
sha512sums_armv6h=('2eb0349f7d6e08c83cd5d75de202aacae4fb1d5f2013aabf041f74e3c82de8cc093c2069b69fa37086d29c2042f6d9625ba3e66aba1e5bb22cb71bfd3ca867bd')
sha512sums_armv7h=('11b1cb5514eda7b22e89513f2c6bc1796364984ae6ee71c19f168945c2546149934c70e8589ba3b98e9077f7d4345f552fa17427907e3318c57870ce1353a60e')
sha512sums_aarch64=('1ef203e024cb95df56dd169a81ef61f3e4cf2f32a1225685ce98c1f113642c7fb8b4c4bb44ef3dbf42e3e4f0257b062ecb10099a071f716784b3bd76ffdb0dad')

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

