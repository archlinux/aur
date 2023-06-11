# Maintainer: rern <rernrern@gmail.us>

buildarch=20

pkgbase=linux-rpi-legacy
_commit=bb63dc31e48948bc2649357758c7a152210109c4
_srcname=linux-${_commit}
_kernelname=${pkgbase#linux}
_desc="RPi 1/Zero/Zero W only"
pkgver=6.1.32
pkgrel=1
pkgdesc='Linux'
url="http://www.kernel.org/"
arch=(armv6h armv7h)
license=(GPL2)
makedepends=(
  bc kmod inetutils
)
options=('!strip' '!distcc')
source=("linux-$pkgver-${_commit:0:10}.tar.gz::https://github.com/raspberrypi/linux/archive/${_commit}.tar.gz"
        cmdline.txt
        config.txt
        config
        linux.preset
        60-linux.hook
        90-linux.hook
)
md5sums=('20c3f8379959e8b482e2e897a36f9754'
         '31c02f4518d46deb5f0c2ad1f8b083cd'
         '7c2cace68dd229483b28ba7147347811'
         '8c9f4df9503130411595ddd7b482d885'
         '86d4a35722b5410e3b29fc92dae15d4b'
         '0a5f16bfec6ad982a2f6782724cca8ba'
         '69e1db90d78f691dc446fe2ab94727eb')

# setup vars
if [[ $CARCH == "armv6h" ]]; then
  _kernel=kernel.img
elif [[ $CARCH == "armv7h" ]]; then
  _kernel=kernel7.img
fi
_image=zImage
_config=config
_bconfig=config.txt
KARCH=arm

prepare() {
  cd "${srcdir}/${_srcname}"

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  echo "Setting config..."
  cp ../"$_config" .config
  make olddefconfig

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd "${srcdir}/${_srcname}"

  make "$_image" modules dtbs
}

_package() {
  pkgdesc="RPi Foundation patched Linux kernel and modules - ${_desc}"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7' 'firmware-raspberrypi')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=('kernel26' "linux=${pkgver}" 'WIREGUARD-MODULE')
  conflicts=('kernel26' 'linux')
  install=${pkgname}.install
  backup=('boot/config.txt' 'boot/cmdline.txt')
  replaces=('linux-raspberrypi-latest' 'linux-raspberrypi')

  cd "${srcdir}/${_srcname}"

  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  echo "Installing Arch ARM specific stuff..."
  mkdir -p "${pkgdir}"/boot
  make INSTALL_DTBS_PATH="${pkgdir}/boot" dtbs_install

  cp arch/$KARCH/boot/$_image "${pkgdir}/boot/$_kernel"
  cp arch/$KARCH/boot/dts/overlays/README "${pkgdir}/boot/overlays"
  install -m644 ../$_bconfig "${pkgdir}/boot/config.txt"
  install -m644 ../cmdline.txt "${pkgdir}/boot"

  if [[ $CARCH == "armv6h" ]]; then
    rm -f "${pkgdir}"/boot/bcm{2836,2837,2838,2709,2710,2711}*.dtb
  elif [[ $CARCH == "armv7h" ]]; then
    rm -f "${pkgdir}"/boot/bcm{2835,2838,2708,2711}*.dtb
  fi

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|${pkgbase}|g
    s|%KERNVER%|${kernver}|g
  "

  # install mkinitcpio preset file
  sed "${_subst}" ../linux.preset |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hooks
  sed "${_subst}" ../60-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" ../90-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"
}

_package-headers() {
  pkgdesc="RPi Foundation header and scripts for building modules for Linux kernel - ${_desc}"
  provides=("linux-headers=${pkgver}")
  conflicts=('linux-headers')
  replaces=('linux-raspberrypi-latest-headers' 'linux-raspberrypi-headers')

  cd ${_srcname}
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/$KARCH" -m644 "arch/$KARCH/Makefile"
  cp -t "$builddir" -a scripts

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/$KARCH" -a "arch/$KARCH/include"
  install -Dt "$builddir/arch/$KARCH/kernel" -m644 "arch/$KARCH/kernel/asm-offsets.s"

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local _arch
  for _arch in "$builddir"/arch/*/; do
    [[ $_arch = */"$KARCH"/ ]] && continue
    echo "Removing $(basename "$_arch")"
    rm -r "$_arch"
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
  done < <(find "$builddir" -type f -perm -u+x)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    _package${_p#${pkgbase}}
  }"
done
