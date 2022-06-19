# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-tun
pkgver=2022.06.19
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
sha512sums_i686=('3800f433d291b5a4c17245e403aa3d5b36466447ba973943d0dcf209a638b507ecf8cb9c7ae938ae7292e5b91d477ffa71553cc4b05b92b83fd405827d67591d')
sha512sums_x86_64=('30dcf6ca176205ead5b55d81088fb82e51bb85699376a94db1d67aa4137d6af29f03a971020565bc71782180e9cb840f1c7076459e2bb2643f0c21ceb44cd14e')
sha512sums_arm=('b7d834e371bf9a6e24b48f1210548854ba0c08b3274fdb852d2524a905d848a5b265230388f9d91dd61e5725d0e9a21fd9bb0924ddc6b6f4e9710e19261f62ff')
sha512sums_armv6h=('136e361c6880502f9e06def699c0f3a68c889cbdd02801021f7223779cea27dfe8e40616ec471b19baee758bce46e7bb5ec9a8618ec46effc0549ba08aa0011e')
sha512sums_armv7h=('ccdd591b6a3a2c0953e436ed16135e4d0c02bde5f86b73f730a0e9909083518a95204eb94e3410fe1d030d636886fa31ef52ab731ccab84685f564d5a3049dee')
sha512sums_aarch64=('64bd3e62301a1b7a2181c3dd8d1da9a8ecd0324f8a38cc1cf688044283dd9722d74d41f2528e146fec201f0491cae898527ddc10edfbcdb937f30f6b8fbe2de6')

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

