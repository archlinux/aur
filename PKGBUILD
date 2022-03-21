# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-tun
pkgver=2022.03.21
pkgrel=3
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
sha512sums_i686=('b175e9e001f4525a17daf596955bcda69c8b67fe2f747c4b16961a5b495fb4f45a4c6be889c35273c0f2202533c59f6b7edae432b207ca961705232c5aae9b24')
sha512sums_x86_64=('df14074ddc2d4037399f0d52775df0718c994ba70cf167426062508196f8e8de4d950cf6cfe6728132a33abfeb4f9b62ab26193dcdac6d077c58d5a34b247440')
sha512sums_arm=('549f3480869c78ff0b6fdf29d0e4fd646ebcbb8f7d15ab4ff0ef40630008e83d9e967ebd7a0546d192eda1b718b7b393ff33cb5cdeda6754a0c49b3aec1cb6ae')
sha512sums_armv6h=('3657bbab926829717137f6d2c4d443502407db1abfe3aad3a3892d30d71b22a08a4dbabd1d72cbbb84a99d7a225e5115e40a6614cdee65c11941e180f2cb5395')
sha512sums_armv7h=('7779026cd8022e58c16945f18572af236708399e619732cef5db538914ef70276331dd83465f33cef4998a07c5f20582d142af90378d0edb28eedcccde727fca')
sha512sums_aarch64=('ff03102316cf0e2b4a8363582a8a4a9f10d51a3a2ccc1d0e4cefa844a6d8301ecf9f40226bbeea116aeb073330f956a43faf3597a850da98982dba8fa3acbd86')

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

