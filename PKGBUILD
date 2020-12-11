# Maintainer: Jack Chen <redchenjs@live.com>

_target=sunxi64
pkgbase="linux-$_target"
pkgname=("$pkgbase" "$pkgbase-headers")
pkgver=5.9.12
_armbver=21.02.0
_armbrel=13
_kernver="$pkgver-$_target"
pkgrel=1
arch=('aarch64')
_desc="AArch64 multi-platform $_target"
url="https://github.com/armbian/build"
license=('GPL2')
options=('!strip')
source=(
  "linux.preset"
  "https://beta.armbian.com/pool/main/l/linux-$_kernver/linux-dtb-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
  "https://beta.armbian.com/pool/main/l/linux-$_kernver/linux-image-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
  "https://beta.armbian.com/pool/main/l/linux-$_kernver/linux-headers-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
)
sha512sums=(
  'aca591b5a2e838754e3c5fd2c0e50098ad54c2d0f990de5bf9cff8608e881daf0e37132294ed1a0e0a7b9e1c194c0b89f95da001d94febdb25a01c409060e3ac'
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
  backup=("etc/mkinitcpio.d/$pkgbase.preset")
  provides=('WIREGUARD-MODULE')
  conflicts=('linux')

  cd "$srcdir"

  ar x "linux-dtb-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
  tar -xf data.tar.xz
  ar x "linux-image-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
  tar -xf data.tar.xz

  install -dm755 "$pkgdir/boot"
  cp -r "boot/dtb-$_kernver" "$pkgdir/boot/dtbs"

  ln -s "vmlinuz-$pkgbase" "$pkgdir/boot/Image"
  ln -s "initramfs-$pkgbase.img" "$pkgdir/boot/Initrd"

  install -dm755 "$pkgdir/usr"
  cp -r lib "$pkgdir/usr/lib"

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|$pkgbase|g
    s|%KERNVER%|$_kernver|g
    s|%EXTRAMODULES%|$_extramodules|g
  "

  # install mkinitcpio preset file
  sed "$_subst" ../linux.preset |
    install -Dm644 /dev/stdin "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"

  # install boot image
  install -Dm644 "boot/vmlinuz-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/vmlinuz"

  # used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules/$_kernver/pkgbase"
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
