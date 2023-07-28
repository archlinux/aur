# Maintainer:   Jesse Codling <codling@umich.edu>
# Contributor:  Jack Chen <redchenjs@live.com>

_target=rockchip64
_pkgbase="linux-$_target"
pkgbase="$_pkgbase-edge-bin"
pkgname=("$pkgbase" "$pkgbase-headers")
pkgver=6.1.11
_armbver=23.02.2
_kernver="$pkgver-$_target"
pkgrel=1
arch=('aarch64')
_desc="AArch64 multi-platform $_target (from Armbian-edge)"
url="https://github.com/armbian/build"
license=('GPL2')
options=('!strip')
provides=("$_pkgbase")
conflics=("$_pkgbase")
source=(
  "linux.preset"
  "https://apt.armbian.com/pool/main/l/linux-$_kernver/linux-dtb-edge-${_target}_${_armbver}_arm64.deb"
  "https://apt.armbian.com/pool/main/l/linux-$_kernver/linux-image-edge-${_target}_${_armbver}_arm64.deb"
  "https://apt.armbian.com/pool/main/l/linux-$_kernver/linux-headers-edge-${_target}_${_armbver}_arm64.deb"
)
sha512sums=('a492aae17ee4a316ce03faf9f1b284b2529c485f4b092cc4a1f865a6c68d482fd356fd30efa296c116975a3bdf3922f5bf03912a8d0e76f4ab24aa6ab9f8c276'
            '184e9b91fcdc28b9558e3e1c850ab7c20262a576d503a5fa9b5fd33be1e7815242938dad483ea7256e5317c858208ee2a62982a9e223dc41a73c265f69271c0f'
            '29937139108690079fbb5c00526783a3d613dfb110d8c650f11f6cb569d7cc2a609dd0ab98299db2ced0e65f71bc342061dfd3be4e39b4d0d25b773f7de32478'
            '09482c8b07805c337555e7e16c4a339578c7cb6808b70e87c3eb4bcf41818bd29beaa49546625803259bfa895408021b87a0afc6bac17a577bc4a2f7e28eb2a0')
noextract=("${source[@]##*/}")

prepare() {
  cd "$srcdir"

  rm -rf $(find -mindepth 1 -maxdepth 1 -type d)
}

_package() {
  pkgdesc="The Linux Kernel and modules - $_desc"
  depends=('coreutils' 'kmod' 'mkinitcpio>=0.7')
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed by some devices'
  )
  backup=("etc/mkinitcpio.d/$_pkgbase.preset")
  provides=('WIREGUARD-MODULE' "linux=$pkgver")
  conflicts=('linux')

  cd "$srcdir"

  ar x "linux-dtb-current-${_target}_${_armbver}_arm64.deb"
  tar -xf data.tar.xz
  ar x "linux-image-current-${_target}_${_armbver}_arm64.deb"
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
  install -Dm644 "boot/vmlinuz-$_kernver" "$pkgdir/boot/Image"

  # used by mkinitcpio to name the kernel
  echo "$_pkgbase" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules/$_kernver/pkgbase"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for linux kernel - $_desc"
  provider=("linux-headers=$pkgver")
  conflicts=('linux-headers')

  cd "$srcdir"

  ar x "linux-image-current-${_target}_${_armbver}_arm64.deb"
  tar -xf data.tar.xz
  ar x "linux-headers-current-${_target}_${_armbver}_arm64.deb"
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
