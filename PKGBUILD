# Maintainer: Fermín Olaiz <fermin@olaiz.net>

# Things to do research about:
# - OP-TEE
# - Reproducible builds
# - .install
# - Testing with qemu ?
# - provides 'uboot' ?

pkgname=uboot-rockchip-rk3566-powkiddy-x55
pkgver=2026.10
pkgrel=1
pkgdesc="U-Boot for the Powkiddy X55 handheld (rockchip rk3566 based)"
arch=('x86_64' 'aarch64') # Should work on riscv64 too
url="https://github.com/u-boot/u-boot"
license=('(GPL-2.0-or-later OR BSD-3-Clause) AND LicenseRef-scancode-rockchip-proprietary-2023')
makedepends=('git' 'python3' 'python-pyelftools' 'python-setuptools' 'swig')
makedepends_x86_64=('aarch64-linux-gnu-gcc')
source=("git+${url}.git#tag=v${pkgver}"
        "https://github.com/rockchip-linux/rkbin/raw/3e288fe814e059dd06833495f845cab04ac20a5c/bin/rk35/rk3568_ddr_1056MHz_v1.26.bin"
        "https://github.com/rockchip-linux/rkbin/raw/3e288fe814e059dd06833495f845cab04ac20a5c/bin/rk35/rk3568_bl31_v1.46.elf"
        "rkbin.LICENSE::https://raw.githubusercontent.com/rockchip-linux/rkbin/refs/heads/master/LICENSE")
sha256sums=('ead6c9d53c9c34a1154f8d797df9341533f5319cc367f79ce2848414899556ec'
            '1af305b6930af4d7afe3af8ddc88d1b353427dae451bfdb4a2e1dbc52488f725'
            'c81ac7e8e1fd727cf7f0db62a9aaea760bde2b270e34d98eb264a264b86df749'
            'd2765124a2c24d71aba3cbc6cdd6975a5a297821264eb6c26378a4c16cd16e92')

prepare() {
    cd "${srcdir}/u-boot"
    make powkiddy-x55-rk3566_defconfig
}

build() {
    cd "${srcdir}/u-boot"
    if [[ "${CARCH}" != "aarch64" ]]; then
        export CROSS_COMPILE=aarch64-linux-gnu-
    fi
    make ROCKCHIP_TPL=../rk3568_ddr_1056MHz_v1.26.bin BL31=../rk3568_bl31_v1.46.elf
}

package() {
    cd "${srcdir}/u-boot"

    install -Dm644 -t "${pkgdir}/usr/lib/uboot/rockchip/rk3566/powkiddy-x55" idbloader.img
    install -Dm644 -t "${pkgdir}/usr/lib/uboot/rockchip/rk3566/powkiddy-x55" u-boot.itb

    install -Dm644 -t "${pkgdir}/usr/share/licenses/uboot-rockchip-rk3566-powkiddy-x55/uboot/" 'Licenses/bsd-3-clause.txt'
    install -Dm644 -t "${pkgdir}/usr/share/licenses/uboot-rockchip-rk3566-powkiddy-x55/uboot/" 'Licenses/gpl-2.0.txt'
    install -Dm644 '../rkbin.LICENSE' "${pkgdir}/usr/share/licenses/uboot-rockchip-rk3566-powkiddy-x55/rkbin/LICENSE"
}
