# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=uboot-tinkerboard
pkgver=20.11.0
pkgrel=1
pkgdesc="U-Boot for Tinker Board / S from Armbian"
arch=('armv7h')
url="https://github.com/redchenjs/armbian-ci"
license=('GPL2')
makedepends=('findutils' 'curl')
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
    '6a83f5b62703079691df948ba5e134009053157d72f7cbc46dfa4218d88ae97386b39af988c94e8bc6022ad6332339e5e4c443a79b18e5eb3772129e847ec861'
    'eec4e277d7d7d9a303c6a8a706fc07c4cfb6b99e8db8e819fc56d150f7d4fb1fdaf07c43452dfe9f93bdebd1698800e57a64e5498a131e9f488be0ea25606502'
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
    sed -r -i 's#DIR=.*#DIR=/usr/lib/u-boot#' "$pkgdir/usr/lib/u-boot/platform_install.sh"
}
