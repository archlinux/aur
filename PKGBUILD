# Maintainer: Jat-faan Wong
# Contributor Joshua Riek

_target=rockchip
_pkgbase="linux-$_target"
pkgbase="$_pkgbase-joshua-bin"
pkgname=("$pkgbase" "$pkgbase-headers")
_pkgver=6.1.43
_date="$(date -u +%Y%m%d)"
pkgver="${_pkgver}.${_date}"
pkgrel=1
_kernver="${_pkgver}-${_target}"
arch=('aarch64')
_desc="version ${pkgver} for $_target on aarch64 multi-platform built by joshua with nightly build."
url="https://github.com/wyf9661/ubuntu-rockchip/releases/download/Nightly"
license=('GPL2')
options=('!strip')
provides=("$_pkgbase")

source=(
  "${url}/linux-image-${_pkgver}-rockchip_${_pkgver}-rockchip-1_arm64.deb"
  "${url}/linux-headers-${_pkgver}-rockchip_${_pkgver}-rockchip-1_arm64.deb"
  "linux.preset"
)
sha512sums=(
  'SKIP'
  'SKIP'
  'a492aae17ee4a316ce03faf9f1b284b2529c485f4b092cc4a1f865a6c68d482fd356fd30efa296c116975a3bdf3922f5bf03912a8d0e76f4ab24aa6ab9f8c276'
)
noextract=("${source[@]##*/}")

prepare() {
  cd "$srcdir"
  rm -rf $(find -mindepth 1 -maxdepth 1 -type d)
}

_package() {
  pkgdesc="The Linux Kernel and modules - $_desc"
  depends=('coreutils' 'linux-firmware' 'kmod')
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/$_pkgbase.preset")

  cd "$srcdir"

  ar x "linux-image-${_pkgver}-rockchip_${_pkgver}-rockchip-1_arm64.deb"

  tar -xI unzstd -f data.tar.zst

  install -dm755 "$pkgdir/boot"

  mkdir -p "${pkgdir}/boot/dtbs/${_pkgbase}/rockchip"
  cp -r usr/lib/linux-image-${_pkgver}-rockchip/rockchip/* "${pkgdir}/boot/dtbs/${_pkgbase}/rockchip"

  cp -r boot/vmlinuz-$_kernver "$pkgdir/boot/vmlinuz-$_pkgbase"

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

  cd "$srcdir"

  ar x "linux-image-${_pkgver}-rockchip_${_pkgver}-rockchip-1_arm64.deb"
  tar -xI unzstd -f data.tar.zst
  ar x "linux-headers-${_pkgver}-rockchip_${_pkgver}-rockchip-1_arm64.deb"
  tar -xI unzstd -f data.tar.zst

  install -dm755 "$pkgdir/usr/lib/modules/$_kernver"
  cp -r "usr/src/linux-headers-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build"

  install -Dm644 "boot/config-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build/.config"
  install -Dm644 "boot/System.map-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build/System.map"

  # add real version for building modules and running depmod from hook
  echo "$_kernver" |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules/$_kernver/build/version"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src/${_pkgbase}"
  ln -sr "$pkgdir/lib/modules/$_kernver/build" "$pkgdir/usr/src/${_pkgbase}"
}

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
