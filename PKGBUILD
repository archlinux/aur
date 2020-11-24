# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=uboot-tinkerboard
pkgver=20.11.0
pkgrel=1
pkgdesc="U-Boot for Tinker Board / S"
arch=('armv7h')
url="https://github.com/redchenjs/armbian-ci"
license=('GPL2')
makedepends=('curl')
depends=('uboot-tools')
provides=('uboot' 'uboot-tinkerboard')
install=$pkgname.install
_kernel=5.8.18
backup=(
    'boot/boot.cmd'
)
source=(
    'boot.cmd'
    "$pkgname.install"
    "https://github.com/redchenjs/armbian-ci/releases/download/v$_kernel-rockchip/linux-u-boot-current-tinkerboard_$pkgver-trunk_armhf.deb"
)
sha512sums=(
    '4aa7a981240add9fdf1e5a14524e2584616e98ae3783c2ed081af441f438ff6fc9ff3b61cc1c7a5c382e42c78c2f2b9a7fa44c0574c16fce89a30466ffc45f08'
    'f23ea74c26e9059a50c3d2411cbcd2412b35d1bc5c27ba6b71508183cdce743b25faeb79d4456191fed07308a002da0e765e9e316a4611acbf871a0a4fa9d626'
    "$(curl -s -L https://github.com/redchenjs/armbian-ci/releases/download/v$_kernel-rockchip/linux-u-boot-current-tinkerboard_$pkgver-trunk_armhf.deb.sha512sum)"
)
noextract=("${source[@]##*/}")

prepare() {
    cd "$srcdir"

    rm -rf $(find -mindepth 1 -maxdepth 1 -type d)
}

package() {
    cd "$srcdir"

    ar x "linux-u-boot-current-tinkerboard_$pkgver-trunk_armhf.deb"
    tar -xf data.tar.xz

    mkdir -p "$pkgdir/usr/lib"
    mv "usr/lib/u-boot" "$pkgdir/usr/lib/u-boot"

    install -Dm644 boot.cmd "$pkgdir/boot/boot.cmd"
    install -Dm644 "usr/lib/linux-u-boot-current-tinkerboard_$pkgver-trunk_armhf/u-boot-rockchip-with-spl.bin" "$pkgdir/usr/lib/u-boot/u-boot-rockchip-with-spl.bin"

    sed -i 's# > /dev/null 2>&1.*##' "$pkgdir/usr/lib/u-boot/platform_install.sh"
    sed -i 's#DIR=.*#DIR=/usr/lib/u-boot#' "$pkgdir/usr/lib/u-boot/platform_install.sh"
    echo 'write_uboot_platform $DIR $1' >> "$pkgdir/usr/lib/u-boot/platform_install.sh"
}
