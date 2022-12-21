# Maintainer: Jan Keith Darunday <aur@jkcdarunday.mozmail.com>
# Contributor: Jack Chen <redchenjs@live.com>

_target=rockchip-rk3588
_pkgbase="linux-$_target"
pkgbase="$_pkgbase-bin"
pkgname=("$pkgbase" "$pkgbase-headers")
pkgver=5.10.110
_armbver=22.11.2
_kernver="$pkgver-$_target"
pkgrel=4
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
    '27ff3c018433a5bb05e66778a05bc8711ce579fc280284eabd2882346bc5317ec8c570d9132e20563df43819a163490e3b04a72b2f7f290907ee8702aef6457a'
    '352b99578e0eb2f38c2f2f4ac7f2105a8bebcd91a949382a9bac5fef5c4890cd2ee8ebfa3c2d1bd7a03538b0046ac628fb88f4ca9c5b13eeaa05c259c97cf8cc'
    'dd15832abc7e227bf1b40454b754374d2787868c77025f17b7062bc42a810e536118d86e1661ac19c5994aa1198b040f31d67b7a8795199605b35fe69361938b'
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
