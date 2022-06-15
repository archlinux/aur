# Maintainer: Jack Chen <redchenjs@live.com>

_target=rockchip64
_pkgbase="linux-$_target"
pkgbase="$_pkgbase-bin"
pkgname=("$pkgbase" "$pkgbase-headers")
pkgver=5.15.47
_armbver=22.08.0-trunk.0017
_armbrel=1
_kernver="$pkgver-$_target"
pkgrel=1
arch=('aarch64')
_desc="AArch64 multi-platform $_target"
url="https://github.com/armbian/build"
license=('GPL2')
options=('!strip')
provides=("$_pkgbase")
conflics=("$_pkgbase")
source=(
  "linux.preset"
  "https://beta.armbian.com/pool/main/l/linux-$_kernver/linux-dtb-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
  "https://beta.armbian.com/pool/main/l/linux-$_kernver/linux-image-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
  "https://beta.armbian.com/pool/main/l/linux-$_kernver/linux-headers-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
)
sha512sums=(
  'f01e7925b262d2874a8a991b1f27d057356a2a384d2012b61be5a631d4e4d7cf87461c8fb9e7f183831f5a829ad204897f1f0545a52df6288a0e04a5c2e31b96'
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

  ar x "linux-dtb-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
  tar -xf data.tar.xz
  ar x "linux-image-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
  tar -xf data.tar.xz

  install -dm755 "$pkgdir/boot"
  cp -r "boot/dtb-$_kernver" "$pkgdir/boot/dtbs"

  ln -s "vmlinuz-$_pkgbase" "$pkgdir/boot/Image"
  ln -s "initramfs-$_pkgbase.img" "$pkgdir/boot/Initrd"

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

  ar x "linux-image-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
  tar -xf data.tar.xz
  ar x "linux-headers-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
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
