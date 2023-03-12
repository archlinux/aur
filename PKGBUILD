# Maintainer: Jan Keith Darunday <aur@jkcdarunday.mozmail.com>
# Contributor: Jack Chen <redchenjs@live.com>

_target=rockchip-rk3588
_pkgbase="linux-$_target"
pkgbase="$_pkgbase-bin"
pkgname=("$pkgbase" "$pkgbase-headers")
pkgver=5.10.110
_armbver=23.02.2
_kernver="$pkgver-$_target"
pkgrel=5
arch=('aarch64')
_desc="AArch64 multi-platform $_target"
url="https://github.com/armbian/build"
license=('GPL2')
options=('!strip')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=(
  "linux.preset"
  "https://apt.armbian.com/pool/main/l/linux-$_kernver/linux-dtb-legacy-${_target}_${_armbver}_arm64.deb"
  "https://apt.armbian.com/pool/main/l/linux-$_kernver/linux-image-legacy-${_target}_${_armbver}_arm64.deb"
  "https://apt.armbian.com/pool/main/l/linux-$_kernver/linux-headers-legacy-${_target}_${_armbver}_arm64.deb"
)
sha512sums=(
  '15a035013f7cc21f8a4250d50f297d9bdef271ee06e83b4b5193432319ba45d1c892e79ec77f4e97ecdf9e7f90ef33f29454b53fa1653fe212054557afe2b91b'
  '972e527b1877ae4f377f6a30175647d025ca5d81b85c466be0f4af99e0aab24a7da531dd5ac0128184a3adfebf04a129ac4cf6768e760301b5e203c1ce7dd3df'
  '2f5cfe6118ae7cfd1ef6c0ff225cffb95a19e99a91e3bf17fafb8ccc0686398d0618bd7b44025553daffb9df08f6d3fcb9034c11461833616ef683c93863e627'
  'f33ed660cfb561bc0463f7901254e7ee8419deb7c13cded3277eaf43ec41db5d313f7cb60d6d1b22d3100cd54b7da11b8224215b67968dbddf9f59aef66edcbe'
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
  provides=("linux=${pkgver}" 'WIREGUARD-MODULE')
  replaces=('linux-armv8')
  conflicts=('linux')

  cd "$srcdir"

  ar x "linux-dtb-legacy-${_target}_${_armbver}_arm64.deb"
  tar -xf data.tar.xz
  ar x "linux-image-legacy-${_target}_${_armbver}_arm64.deb"
  tar -xf data.tar.xz

  install -dm755 "$pkgdir/boot"
  cp -r "boot/dtb-$_kernver" "$pkgdir/boot/dtbs"

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
  provides=("linux-headers=${pkgver}")
  conflicts=('linux-headers')

  cd "$srcdir"

  ar x "linux-image-legacy-${_target}_${_armbver}_arm64.deb"
  tar -xf data.tar.xz
  ar x "linux-headers-legacy-${_target}_${_armbver}_arm64.deb"
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
