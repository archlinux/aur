# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-tun
pkgver=2022.04.10
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
sha512sums_i686=('f8140dabd72bbc55ce0722507632a7bf33f3150ba50381eb27f8ee9b8806efa196906e23fee560e38be35d5fde5cd3855dc1a694a7f416fc709c178ed1afa117')
sha512sums_x86_64=('c1d98aefd34f77a47c92946469b5bb95d8e7e4a8890a6e61d3d0c972d3fa1c563e73557dc88f692fea3688046aae24a459fd12e50bd94dba40567bf86ace45be')
sha512sums_arm=('e734d0eb5861a93b44213a654d523877154e77fd42f39833ff12df270715ad6ad73522381c5ee6662f2071448e3ff277c0972d3302adf4148d2c64b16a8531c5')
sha512sums_armv6h=('278e5491f5263bbf43a7b08fac60f2cc766486180a8f50d283723b40c13d82fbda038d6c066aaffc30079e9aa51a1152ae58046e4d18acfba598c7bc56562600')
sha512sums_armv7h=('15565b44d88e560d5b9cf0a866712341e2a2f5d4da822c43cfbbfea708fd02b9da8c928667c889c8e7d05331ff6ccbfccd554636a5c1ed35c96b67a0af030d74')
sha512sums_aarch64=('1920ec717b4a5a0dcda777c8ca8e6c9d716dbe8d084bb1d5471255b01f51b6c0defcbe7b3035d02bc061ef5fd655687094138b7255824ed1ca7596f8b66699c6')

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

