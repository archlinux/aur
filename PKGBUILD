# This PKGBUILD is based on linux-aarch64 from archlinuxarm: https://github.com/archlinuxarm/PKGBUILDs/blob/master/core/linux-aarch64/PKGBUILD
# Patches are from the Libreelec project
# Maintainer: mmustermann

buildarch=8

pkgbase=linux-aarch64-rockpro64
_srcname=linux-5.19
_kernelname=${pkgbase#linux}
_desc="AArch64 with patches for PINE64's ROCKPro64"
pkgdesc=${_desc}
pkgver=5.19.12
pkgrel=1
arch=('aarch64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'dtc')
options=('!strip')
source=("http://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "http://www.kernel.org/pub/linux/kernel/v5.x/patch-${pkgver}.xz"
        '0001-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch'
        '0002-arm64-dts-rockchip-disable-pwm0-on-rk3399-firefly.patch'
        'config'
        'linux.preset'
        '60-linux.hook'
        '90-linux.hook'
        "https://github.com/LibreELEC/LibreELEC.tv/raw/master/projects/Rockchip/patches/linux/default/linux-0002-rockchip-from-list.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/master/projects/Rockchip/patches/linux/default/linux-0011-v4l2-from-list.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/master/projects/Rockchip/patches/linux/default/linux-0020-drm-from-list.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/master/projects/Rockchip/patches/linux/default/linux-1000-drm-rockchip.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/master/projects/Rockchip/patches/linux/default/linux-1001-v4l2-rockchip.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/master/projects/Rockchip/patches/linux/default/linux-1002-for-libreelec.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/master/projects/Rockchip/patches/linux/default/linux-2000-v4l2-wip-rkvdec-hevc.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/master/projects/Rockchip/patches/linux/default/linux-2001-v4l2-wip-iep-driver.patch"
)
md5sums=('f91bfe133d2cb1692f705947282e123a'
         '2f9945a50613017d430f7091be9939f8'
         'e0514a3e8f7383c1304faeff0121dfb5'
         '965c9f68072084cdbf1e083779d2ef0e'
         '417932cd6167ff0b47c6dc297e3eb3fb'
         '41cb5fef62715ead2dd109dbea8413d6'
         '0a5f16bfec6ad982a2f6782724cca8ba'
         '3dc88030a8f2f5a5f97266d99b149f77'
         '7f45e67fe9eafa578b6ddad598b1ef7d'
         'bd40c808030c856d52bd3f82df2e19a7'
         '8328bcc4d8c8f00e9ebb6186f2dd22df'
         'e27dbd3847f68f24cf9ebb5e0b8f8f9f'
         '35235baaf83cdd1091212f5c78935ddd'
         'f0f8ca23b89c026b6ed8f877d075e586'
         '79b113b50829169c168bcf54435914bb'
         '7bf9d397ebd8b10b0e254bb1cda80d88')

prepare() {
  cd $_srcname

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  # add upstream patch
  git apply -v --whitespace=nowarn ../patch-${pkgver}

  # ALARM patches
  git apply -v ../0001-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch
  git apply -v ../0002-arm64-dts-rockchip-disable-pwm0-on-rk3399-firefly.patch

  #Libreelec Patches
  cat ../linux-1000-drm-rockchip.patch | tail -n 3691 > ../linux-1000-drm-rockchip.patch.mod
  git apply -v ../linux-0002-rockchip-from-list.patch
  git apply -v ../linux-0011-v4l2-from-list.patch
  git apply -v ../linux-0020-drm-from-list.patch
  git apply -v ../linux-1000-drm-rockchip.patch.mod
  git apply -v ../linux-1001-v4l2-rockchip.patch
  git apply -v ../linux-1002-for-libreelec.patch
  git apply -v ../linux-2000-v4l2-wip-rkvdec-hevc.patch
  git apply -v ../linux-2001-v4l2-wip-iep-driver.patch

  cat "${srcdir}/config" > ./.config
}

build() {
  cd ${_srcname}

  # get kernel version
  make prepare
  make -s kernelrelease > version

  # build!
  unset LDFLAGS
  make ${MAKEFLAGS} Image Image.gz modules
  # Generate device tree blobs with symbols to support applying device tree overlays in U-Boot
  make ${MAKEFLAGS} DTC_FLAGS="-@" dtbs
}

_package() {
  pkgdesc="The Linux Kernel and modules - ${_desc}"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('wireless-regdb: to set the correct wireless channels of your country')
  provides=("linux=${pkgver}" "WIREGUARD-MODULE")
  conflicts=('linux' 'linux-aarch64')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=${pkgname}.install

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image and dtbs..."
  install -Dm644 arch/arm64/boot/Image{,.gz} -t "${pkgdir}/boot"
  make INSTALL_DTBS_PATH="${pkgdir}/boot/dtbs" dtbs_install

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

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
  pkgdesc="Header files and scripts for building modules for linux kernel - ${_desc}"
  provides=("linux-headers=${pkgver}")
  conflicts=('linux-headers' 'linux-aarch64-headers')

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/arm64" -m644 arch/arm64/Makefile
  cp -t "$builddir" -a scripts

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/arm64" -a arch/arm64/include
  install -Dt "$builddir/arch/arm64/kernel" -m644 arch/arm64/kernel/asm-offsets.s
  mkdir -p "$builddir/arch/arm"
  cp -t "$builddir/arch/arm" -a arch/arm/include

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
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */arm64/ || $arch == */arm/ ]] && continue
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

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    _package${_p#${pkgbase}}
  }"
done
