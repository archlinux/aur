# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-tun
pkgver=2022.04.17
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
sha512sums_i686=('2b3e0b5dce84f1052873006b018433627f786dda2487d58691ac17ad48feadb58372244ec69782a66e4a70c17906047ff0013dd38ea43c2735aa043524a59808')
sha512sums_x86_64=('4d37b42c1c133c37d64b2c6e0160f7ea0662dbce0ab026a0b45fde8856568b0072b791fc456b043bb087d7d906bbc40fccb7ac05543167e07cfd8bb12b922037')
sha512sums_arm=('d798b6368efba44c7d2e583541b2d300188d0c5730469ee1d364e0dfd77309e3661f609404fae378abd8533d89aec6b5020a2b06471e5d65d624b5a4359a4f03')
sha512sums_armv6h=('66b866ccf0fa22674f3ac4a3d68c102d99ff096385560b80353dd5c137f3acb139a6abd7eddbd68a016de9d44e3d7b7893adab687f16753804403771d7656712')
sha512sums_armv7h=('e934dfd5a0a3d81704ee46f574966f27244cb38ef2d7e00ab69b331b3df1aa82d41aeda5b0a4b64795e9eea4cfc062f98492a28f6053ee20e215b3803fa924dc')
sha512sums_aarch64=('b51f27cd2738410e3c5c24835b59d9412d36dcbc9532c4ff67a6d54c9c4995df2e380109e7bb93cf311954818e37d6052d24b9e4d40215486967da90d6d74a9d')

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

