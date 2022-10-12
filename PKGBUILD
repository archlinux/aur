# This PKGBUILD is based on linux-aarch64 from archlinuxarm: https://github.com/archlinuxarm/PKGBUILDs/blob/master/core/linux-aarch64/PKGBUILD
# Patches are from the Libreelec project
# Maintainer: mmustermann

buildarch=8

pkgbase=linux-aarch64-rockpro64
_srcname=linux-6.0
_kernelname=${pkgbase#linux}
_libreelec_patch_commit=fcd644f0173a04df19356813c25d48a97ddb2c04
pkgdesc="AArch64 with patches for PINE64's ROCKPro64"
pkgver=6.0.1
pkgrel=1
arch=('aarch64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'dtc')
options=('!strip')
source=("http://www.kernel.org/pub/linux/kernel/v6.x/${_srcname}.tar.xz"
        "http://www.kernel.org/pub/linux/kernel/v6.x/patch-${pkgver}.xz"
        '0001-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch'
#        '0002-arm64-dts-rockchip-disable-pwm0-on-rk3399-firefly.patch'
        'config'
        'linux.preset'
        '60-linux.hook'
        '90-linux.hook'
        "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/linux/default/linux-0001-rockchip-from-6.1.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/linux/default/linux-0002-rockchip-from-list.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/linux/default/linux-0011-v4l2-from-list.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/linux/default/linux-0020-drm-from-list.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/linux/default/linux-1000-drm-rockchip.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/linux/default/linux-1001-v4l2-rockchip.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/linux/default/linux-1002-for-libreelec.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/linux/default/linux-2000-v4l2-wip-rkvdec-hevc.patch"
        "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/linux/default/linux-2001-v4l2-wip-iep-driver.patch"
)
sha256sums=('5c2443a5538de52688efb55c27ab0539c1f5eb58c0cfd16a2b9fbb08fd81788e'
            '483447baa17bb08dfeb1b966c9b93bd0a7cac096d8086b0bbd09fb0d4968fe1e'
            '5ac741733d6b117d9f837c1d88043aa14dedfbfe40d6a17c9a5ba8e67dce6d57'
            '2996843f5c08b7e05182c77bb73fb8465682f049d1e6b42ad590931aec945cde'
            '6837b3e2152f142f3fff595c6cbd03423f6e7b8d525aac8ae3eb3b58392bd255'
            '452b8d4d71e1565ca91b1bebb280693549222ef51c47ba8964e411b2d461699c'
            '71df1b18a3885b151a3b9d926a91936da2acc90d5e27f1ad326745779cd3759d'
            '2920b0d0a236ea6f12ea2a4e0d8c0b24ac72203229e3f6e2d5d386636938516e'
            '9a49febdd90414c9bdb91f0d09d1f4087ba42d2f3f6131d7a160741211e9e35c'
            '06586bc6bfcff6dbdd962e1bf709b5a9a4f6472628bd9c4842d684e95a5f6ed1'
            'd72e7d45d3815d76f61830838665cd31dbb4e99932e440241676aa035192eb08'
            'c054a4f23af3cba47fb1e0c08a7cb700fea251566cb68c37a64b137f0b71fac2'
            'f9bc85d319ad8fc2e675f1755dadf9f4d9ae84ab56b4e14f3e856f7b130c5f91'
            '9b1010af3539ca37d139ba494e140a4ce27dd315e4c17f41f4a712704fd49913'
            'c292579795d856bb459cb94a4ed410379b6220f90758f390e20f8a18c538f642'
            '58925a7e8a9d59d48b72af8bb7017c115ed2fc9b763cdd472fba03001728181c')

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
#  git apply -v ../0002-arm64-dts-rockchip-disable-pwm0-on-rk3399-firefly.patch

  #Libreelec Patches
  #cat ../linux-1000-drm-rockchip.patch | tail -n 3691 > ../linux-1000-drm-rockchip.patch.mod
  git apply -v ../linux-0001-rockchip-from-6.1.patch
  git apply -v ../linux-0002-rockchip-from-list.patch
  git apply -v ../linux-0011-v4l2-from-list.patch
  git apply -v ../linux-0020-drm-from-list.patch
#  git apply -v ../linux-1000-drm-rockchip.patch.mod
  git apply -v ../linux-1000-drm-rockchip.patch
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
  pkgdesc="The Linux Kernel and modules - $pkgdesc"
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
  pkgdesc="Header files and scripts for building modules for linux kernel - $pkgdesc"
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
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
