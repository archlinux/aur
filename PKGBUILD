# Maintainer: Fermín Olaiz <ferminolaiz@gmail.com>

# Things to do research about:
# - OP-TEE
# - Reproducible builds
# - .install
# - Testing with qemu ?
# - provides 'uboot' ?

pkgname=uboot-rockchip-rk3566-powkiddy-x55
pkgver=2026.04
pkgrel=1
pkgdesc="U-Boot for the Powkiddy X55 handheld (rockchip rk3566 based)"
arch=('x86_64' 'aarch') # Should work on riscv64 too
url="https://github.com/u-boot/u-boot"
license=('SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) AND LicenseRef-scancode-rockchip-proprietary-2023')
depends=()
makedepends=('git')
makedepends_x86_64=('aarch64-linux-gnu-gcc')
source=("git+${url}.git#tag=v${pkgver}"
        "https://github.com/rockchip-linux/rkbin/raw/refs/heads/master/bin/rk35/rk3568_ddr_1056MHz_v1.23.bin"
        "https://github.com/rockchip-linux/rkbin/raw/refs/heads/master/bin/rk35/rk3568_bl31_v1.45.elf")
sha256sums=('4dae81ba4e943a4edda2850da41b35f3f03a5f9035a19d1a00c29bd71ec62b1a'
            '20e4bb076847bd019fcdeb7bdc15bd249890f07ecc76e9937101f22e50950982'
            '76634f10e535bbe981fb9132fd6815a71586cc1b96aae1159bec6797579e5b9f')

prepare() {
    cd "${srcdir}/u-boot"
    make powkiddy-x55-rk3566_defconfig
}

build() {
    cd "${srcdir}/u-boot"
    if [[ "${CARCH}" != "aarch64" ]]; then
        export CROSS_COMPILE=aarch64-linux-gnu-
    fi
    make ROCKCHIP_TPL=../rk3568_ddr_1056MHz_v1.23.bin BL31=../rk3568_bl31_v1.45.elf
}

package() {
    cd "${srcdir}/u-boot"
    install -Dm644 -t "${pkgdir}/usr/lib/uboot/rockchip/rk3566/powkiddy-x55" idbloader.img
    install -Dm644 -t "${pkgdir}/usr/lib/uboot/rockchip/rk3566/powkiddy-x55" u-boot.itb
}
