# Maintainer: Jan Keith Darunday <aur@jkcdarunday.mozmail.com>
# Contributor: Jack Chen <redchenjs@live.com>

_target=rockchip-rk3588
_pkgbase="linux-$_target"
pkgbase="$_pkgbase-bin"
pkgname=("$pkgbase" "$pkgbase-headers")
pkgver=5.10.72
_armbver=22.11.1
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
    'ef4a796a80d017aea5c7cc52bf5c692e95d840fb201012def323ebbb40e30e8ad27b446d2c34289fc8470aa71795d03291a681b2a9faf8d57de7440d283f30ee'
    'fbb12e71630604669d701a27d6e4da569763dfb00eeb359fc10ded860d34bc9d688bdb09122ef91645dfbf3e79f4cf10fc82ba25cbc25df69a3026aa68233089'
    '598ea3bfdd0e9397a8bed7186354884a9c2aa8b84d6770cc977892ded5af0dc1addcdae2f5ff975996c66b18c55a3ae1cb85c5a0e5b06f2c7cc29336fe8e42c7'
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
