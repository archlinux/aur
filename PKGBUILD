# Maintainer: Jack Chen <redchenjs@live.com>

_target=rockchip64
pkgbase="linux-$_target"
pkgname=("$pkgbase" "$pkgbase-headers")
pkgver=5.9.13
_armbver=21.02.0
_armbrel=16
_kernver="$pkgver-$_target"
pkgrel=1
arch=('aarch64')
_desc="AArch64 multi-platform $_target"
url="https://github.com/armbian/build"
license=('GPL2')
options=('!strip')
source=(
  "linux.preset"
  "60-linux.hook"
  "90-linux.hook"
  "https://beta.armbian.com/pool/main/l/linux-$_kernver/linux-dtb-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
  "https://beta.armbian.com/pool/main/l/linux-$_kernver/linux-image-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
  "https://beta.armbian.com/pool/main/l/linux-$_kernver/linux-headers-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
)
sha512sums=(
  'f683c0639fc20e813e309df99b9b850b1f55de3fc02489d64a7d66e84df19d7836ea32042090597f1df17baed46a3ae1dfcf341c8aff206be9a1b06ee394dc3f'
  '7ad5be75ee422dda3b80edd2eb614d8a9181e2c8228cd68b3881e2fb95953bf2dea6cbe7900ce1013c9de89b2802574b7b24869fc5d7a95d3cc3112c4d27063a'
  'b2cdb620fcc6f0b430b0cf0c844887c2c1e290844ea330750cad52c9ec04e835ead973b664c7613d147037c388120affe97dfd2f2e0f9ae224db52aaa4cb8814'
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
  provides=("linux=$pkgver" "WIREGUARD-MODULE")
  conflicts=('linux')
  install="$pkgname.install"

  cd "$srcdir"

  ar x "linux-dtb-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
  tar -xf data.tar.xz
  ar x "linux-image-current-${_target}_${_armbver}-trunk.${_armbrel}_arm64.deb"
  tar -xf data.tar.xz

  install -Dm644 "boot/vmlinuz-$_kernver" "$pkgdir/boot/Image"
  cp -r "boot/dtb-$_kernver" "$pkgdir/boot/dtbs"

  install -dm755 "$pkgdir/usr"
  cp -r lib "$pkgdir/usr/lib"

  # make room for external modules
  local _extramodules="extramodules-$(echo $_kernver | sed -r 's|^([0-9]+.[0-9]+).*|\1|')-aarch64"
  ln -s "../$_extramodules" "$pkgdir/usr/lib/modules/$_kernver/extramodules"

  # add real version for building modules and running depmod from hook
  echo "$_kernver" |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules/$_extramodules/version"

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|$pkgbase|g
    s|%KERNVER%|$_kernver|g
    s|%EXTRAMODULES%|$_extramodules|g
  "

  # install mkinitcpio preset file
  sed "$_subst" ../linux.preset |
    install -Dm644 /dev/stdin "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"

  # install pacman hooks
  sed "$_subst" ../60-linux.hook |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/libalpm/hooks/60-$pkgbase.hook"
  sed "$_subst" ../90-linux.hook |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/libalpm/hooks/90-$pkgbase.hook"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for linux kernel - $_desc"
  provides=("linux-headers=$pkgver")
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
}

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
