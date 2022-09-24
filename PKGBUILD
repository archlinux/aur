# Maintainer: Jack Chen <redchenjs@live.com>

_target=rockchip
_pkgbase="linux-$_target"
pkgbase="$_pkgbase-bin"
pkgname=("$pkgbase" "$pkgbase-headers")
pkgver=5.15.69
_armbver=22.08.2
_kernver="$pkgver-$_target"
pkgrel=1
arch=('armv7h')
_desc="ARMv7 multi-platform $_target"
url="https://github.com/armbian/build"
license=('GPL2')
options=('!strip')
provides=("$_pkgbase")
conflics=("$_pkgbase")
source=(
  "linux.preset"
  "https://apt.armbian.com/pool/main/l/linux-$_kernver/linux-dtb-current-${_target}_${_armbver}_armhf.deb"
  "https://apt.armbian.com/pool/main/l/linux-$_kernver/linux-image-current-${_target}_${_armbver}_armhf.deb"
  "https://apt.armbian.com/pool/main/l/linux-$_kernver/linux-headers-current-${_target}_${_armbver}_armhf.deb"
)
sha512sums=(
  'a492aae17ee4a316ce03faf9f1b284b2529c485f4b092cc4a1f865a6c68d482fd356fd30efa296c116975a3bdf3922f5bf03912a8d0e76f4ab24aa6ab9f8c276'
  'SKIP'
  'SKIP'
  'SKIP'
)
noextract=("${source[@]##*/}")

prepare() {
  cd "$srcdir"

  rm -rf $(find -mindepth 1 -maxdepth 1 -type d)
}

_package() {
  pkgdesc="The Linux Kernel and modules - $_desc"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/$_pkgbase.preset")
  provides=('WIREGUARD-MODULE')
  conflicts=('linux')

  cd "$srcdir"

  ar x "linux-dtb-current-${_target}_${_armbver}_armhf.deb"
  tar -xf data.tar.xz
  ar x "linux-image-current-${_target}_${_armbver}_armhf.deb"
  tar -xf data.tar.xz

  install -dm755 "$pkgdir/boot"
  cp -r "boot/dtb-$_kernver" "$pkgdir/boot/dtbs"

  ln -s "vmlinuz-$_pkgbase" "$pkgdir/boot/zImage"

  install -dm755 "$pkgdir/usr"
  cp -r lib "$pkgdir/usr/lib"

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|$_pkgbase|g
    s|%KERNVER%|$_kernver|g
  "

  # install mkinitcpio preset file
  sed "$_subst" linux.preset |
    install -Dm644 /dev/stdin "$pkgdir/etc/mkinitcpio.d/$_pkgbase.preset"

  # install boot image
  install -Dm644 "boot/vmlinuz-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/vmlinuz"

  # used by mkinitcpio to name the kernel
  echo "$_pkgbase" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules/$_kernver/pkgbase"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for linux kernel - $_desc"
  conflicts=('linux-headers')

  cd "$srcdir"

  ar x "linux-image-current-${_target}_${_armbver}_armhf.deb"
  tar -xf data.tar.xz
  ar x "linux-headers-current-${_target}_${_armbver}_armhf.deb"
  tar -xf data.tar.xz

  install -dm755 "$pkgdir/usr/lib/modules/$_kernver"
  cp -r "usr/src/linux-headers-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build"

  install -Dm644 "boot/config-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build/.config"
  install -Dm644 "boot/System.map-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build/System.map"

  # add real version for building modules and running depmod from hook
  echo "$_kernver" |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules/$_kernver/build/version"
}

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
