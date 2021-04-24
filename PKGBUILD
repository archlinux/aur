# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=uboot-tinkerboard
pkgver=21.02.3
pkgrel=1
pkgdesc="U-Boot for Tinker Board / S"
arch=('armv7h')
url="https://github.com/armbian/build"
license=('GPL2')
backup=('boot/boot.txt')
makedepends=('uboot-tools')
install="$pkgname.install"
source=(
  "mkscr"
  "boot.txt"
  "https://apt.armbian.com/pool/main/l/linux-u-boot-tinkerboard-current/linux-u-boot-current-tinkerboard_${pkgver}_armhf.deb"
)
sha512sums=(
  '7046ab4d88efbba636be049be2f660e18c05e48d161d39437c1580b12795ba4d9197ad57ac4572398f80a38d4777507b57228abf4cc41f0081d196ece27ea9d0'
  '5a5c4bf4fdabc30644a79844064eb77ff570ceb560a53cc919c1b57ca9511f980ca1d7207acae1aea6e965ded9d853177b5e8047b45c56ed73a5e982d23ccd0f'
  'SKIP'
)
noextract=("${source[@]##*/}")

prepare() {
  cd "$srcdir"

  rm -rf $(find -mindepth 1 -maxdepth 1 -type d)
}

package() {
  cd "$srcdir"

  ar x "linux-u-boot-current-tinkerboard_${pkgver}_armhf.deb"
  tar -xf data.tar.xz

  install -Dm755 mkscr "$pkgdir/boot/mkscr"
  install -Dm644 "usr/lib/linux-u-boot-current-tinkerboard_${pkgver}_armhf/u-boot-rockchip-with-spl.bin" "$pkgdir/boot/rksd_loader.img"

  major="$(mountpoint -d / | cut -f 1 -d ':')"
  minor="$(mountpoint -d / | cut -f 2 -d ':')"
  device="$(cat /proc/partitions | awk {'if ($1 == "'$major'" && $2 == "'$minor'") print $4 '})"
  sed "s|%ROOTDEV%|$device|g" boot.txt | install -Dm644 /dev/stdin "$pkgdir/boot/boot.txt"
}
