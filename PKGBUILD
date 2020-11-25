# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=uboot-tinkerboard
pkgver=20.11.0
_kernel=5.8.18
pkgrel=1
pkgdesc="U-Boot for Tinker Board / S"
arch=('armv7h')
url="https://github.com/armbian/build"
license=('GPL2')
backup=('boot/boot.txt' 'boot/boot.scr')
makedepends=('curl' 'uboot-tools')
install="$pkgname.install"
source=(
  'mkscr'
  'boot.txt'
  "armbian-uboot_$pkgver-$_kernel.deb::https://github.com/redchenjs/armbian-ci/releases/download/v$_kernel-rockchip/linux-u-boot-current-tinkerboard_$pkgver-trunk_armhf.deb"
)
sha512sums=(
  '7046ab4d88efbba636be049be2f660e18c05e48d161d39437c1580b12795ba4d9197ad57ac4572398f80a38d4777507b57228abf4cc41f0081d196ece27ea9d0'
  '7f6d83d746579f6485c1603389972e9833f4ce0a71fa2b27e2036cf502bacff030d09ba7fc9adbeb5da41b12de2c4d258c1b8aed3862444f703f58e80df5429c'
  "$(curl -s -L https://github.com/redchenjs/armbian-ci/releases/download/v$_kernel-rockchip/linux-u-boot-current-tinkerboard_$pkgver-trunk_armhf.deb.sha512sum)"
)
noextract=("${source[@]##*/}")

prepare() {
  cd "$srcdir"

  rm -rf $(find -mindepth 1 -maxdepth 1 -type d)
}

package() {
  cd "$srcdir"

  ar x "armbian-uboot_$pkgver-$_kernel.deb"
  tar -xf data.tar.xz

  install -Dm755 mkscr "$pkgdir/boot/mkscr"
  install -Dm644 "usr/lib/linux-u-boot-current-tinkerboard_$pkgver-trunk_armhf/u-boot-rockchip-with-spl.bin" "$pkgdir/boot/rksd_loader.img"

  major="$(mountpoint -d / | cut -f 1 -d ':')"
  minor="$(mountpoint -d / | cut -f 2 -d ':')"
  device="$(cat /proc/partitions | awk {'if ($1 == "'$major'" && $2 == "'$minor'") print $4 '})"
  sed "s|%ROOTDEV%|$device|g" boot.txt |
    install -Dm644 /dev/stdin "$pkgdir/boot/boot.txt"

  mkimage -A arm -O linux -T script -C none -n "U-Boot boot script" -d boot.txt "$pkgdir/boot/boot.scr"
}
