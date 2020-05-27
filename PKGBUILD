# Maintainer: David P. <megver83@parabola.nu>

# NOTE: This PKGBUILD will only work with Hyperbola GNU/Linux-libre. Not Parabola, not Arch.
# I made this package for users who need a 5.x kernel, but still want LTS software.
# It is made for the old mkinitcpio version that is shipped in Hyperbola and follows the FHS.
# This PKGBUILD aims to be simple and minimalist, so it doesn't come with the -docs package
# (which produced errors when building, as I was told by some 'hyperusers' :P)

_replacesarchkernel=() # '%' gets replaced with kernel suffix
_replacesoldkernels=() # '%' gets replaced with kernel suffix
_replacesoldmodules=() # '%' gets replaced with kernel suffix

pkgbase=linux-libre-hyperbola
pkgver=5.4.42
pkgrel=2
pkgdesc='Linux-libre 5.4 LTS'
url='https://linux-libre.fsfla.org/'
arch=(x86_64)
license=(GPL-2)
makedepends=(
  bc kmod libelf
)
options=('!strip')
_srcname=linux-5.4
source=(
  "https://linux-libre.fsfla.org/pub/linux-libre/releases/${_srcname##*-}-gnu/linux-libre-${_srcname##*-}-gnu.tar.xz"{,.sign}
  "https://linux-libre.fsfla.org/pub/linux-libre/releases/$pkgver-gnu/patch-${_srcname##*-}-gnu-$pkgver-gnu.xz"{,.sign}
  "https://git.hyperbola.info:50100/culture/linux-libre_logos.git/plain/logo_linux_"{clut224.ppm,vga16.ppm,mono.pbm}{,.sig}
  config         # the main kernel config file
  linux.preset   # standard config files for mkinitcpio ramdisk
  90-linux.hook  # pacman hook for initramfs regeneration

  # maintain the TTY over USB disconnects
  # http://www.coreboot.org/EHCI_Gadget_Debug
  0001-usb-serial-gadget-no-TTY-hangup-on-USB-disconnect-WI.patch
  # fix Atmel maXTouch touchscreen support
  # https://labs.parabola.nu/issues/877
  # http://www.fsfla.org/pipermail/linux-libre/2015-November/003202.html
  0002-fix-Atmel-maXTouch-touchscreen-support.patch
)
validpgpkeys=(
  '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
  '684D54A189305A9CC95446D36B888913DDB59515' # Márcio Silva
)
sha512sums=('0d0915133864eb031adfc6700066147dcf3e768a50a31c39754950c95ef4fd322dc701cd50af49c403ef0325adfcb07e354d5e46c1be3dcdd719a7a55c963f37'
            'SKIP'
            '278f12bb0a8e9a0628d6e7e8d1c1a541cf0a83f68a8c237334c5198a1970f006d7b695bae6c0813335f069946d5aa35f37114daf1f9ef888e4bfc575387d6df8'
            'SKIP'
            '13cb5bc42542e7b8bb104d5f68253f6609e463b6799800418af33eb0272cc269aaa36163c3e6f0aacbdaaa1d05e2827a4a7c4a08a029238439ed08b89c564bb3'
            'SKIP'
            '7a3716bfe3b9f546da309c7492f3e08f8f506813afeb1c737a474c83313d5c313cf4582b65215c2cfce3b74d9d1021c96e8badafe8f6e5b01fe28d2b5c61ae78'
            'SKIP'
            '267295aa0cea65684968420c68b32f1a66a22d018b9d2b2c1ef14267bcf4cb68aaf7099d073cbfefe6c25c8608bdcbbd45f7ac8893fdcecbf1e621abdfe9ecc1'
            'SKIP'
            'a923bb36ff24d3f2326b0b6bccb8cdfe2ed2ab2acdae17dfcaf9beb269995a52bfba751ad7e616544ef4b98dd9487a66fe04dae2ec2e7d724f8ac47382ee71bd'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf'
            '38ddc517f33fe41dec63b31313a82e0e8c05788e9db5e448d23a01605c50fe3422927cfd902e81c3b0eae17502db06f48e7f713e1ba1c9c76fd26f1473b02983'
            '6a87c0bb2a2f352917eab8a029a89ee1a504b41d73ae536be1d508248e0f280b586e1cf2669cd6501a392d97e1963a806545a1635be9de446e0c9affe61ee56f'
            'c7776361aafe2cec753fdda96eca5c1f4460cb78fb4dfe3d78e92f68387ec80bd1a4d83362af40b33c05e1501f31c83b1ef6115c790f8bf9d6ecd5642b829af8')

_replacesarchkernel=("${_replacesarchkernel[@]/\%/${pkgbase#linux-libre}}")
_replacesoldkernels=("${_replacesoldkernels[@]/\%/${pkgbase#linux-libre}}")
_replacesoldmodules=("${_replacesoldmodules[@]/\%/${pkgbase#linux-libre}}")

export KBUILD_BUILD_HOST=hyperbola
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  if [ "${_srcname##*-}" != "$pkgver" ]; then
    echo "Applying upstream patch..."
    patch -Np1 < "../patch-${_srcname##*-}-gnu-$pkgver-gnu"
  fi

  echo "Adding freedo as boot logo..."
  install -m644 -t drivers/video/logo \
    ../logo_linux_{clut224.ppm,vga16.ppm,mono.pbm}

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux-libre}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config .config
  make olddefconfig

  make -s kernelrelease > version
  echo "Prepared %s version %s" "$pkgbase" "$(<version)"
}

build() {
  cd $_srcname
  make all
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(coreutils kmod 'mkinitcpio=<25')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("${_replacesarchkernel[@]/%/=$pkgver}" WIREGUARD-MODULE)
  conflicts=("${_replacesarchkernel[@]}" "${_replacesoldkernels[@]}" "${_replacesoldmodules[@]}" wireguard-dkms)
  replaces=("${_replacesarchkernel[@]}" "${_replacesoldkernels[@]}" "${_replacesoldmodules[@]}")
  backup=("etc/mkinitcpio.d/$pkgbase.preset")
  install=linux.install

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/lib/modules/$kernver"

  echo "Installing boot image..."
  install -Dm644 "$(make -s image_name)" "$pkgdir/boot/vmlinuz-$pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir" modules_install

  echo "Install mkinitcpio preset file for kernel..."
  sed "s|%PKGBASE%|$pkgbase|g" "$srcdir/linux.preset" |
    install -D -m644 /dev/stdin "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"

  echo "Install pacman hook for initramfs regeneration..."
  sed "s|%PKGBASE%|$pkgbase|g" "$srcdir/90-linux.hook" |
    install -D -m644 /dev/stdin "$pkgdir/usr/share/libalpm/hooks/90-$pkgbase.hook"

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  provides=("${_replacesarchkernel[@]/%/-headers=$pkgver}")
  conflicts=("${_replacesarchkernel[@]/%/-headers}" "${_replacesoldkernels[@]/%/-headers}")
  replaces=("${_replacesarchkernel[@]/%/-headers}" "${_replacesoldkernels[@]/%/-headers}")

  cd $_srcname
  local builddir="$pkgdir/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "$builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
