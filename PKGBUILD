#
# Maintainer: Mikael Eriksson <mikael_eriksson at miffe dot org>
# Maintainer: Filippo Falezza <filippo.falezza at outlook dot it> 
#
# Based on the linux package by:
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens at gmail dot com>
# Maintainer: Tobias Powalowski <tpowa at archlinux dot org>
# Maintainer: Thomas Baechler <thomas at archlinux dot org>

_pkgsuffix=lantian
pkgbase="linux-xanmod-$_pkgsuffix"

_srctag=5.16.11-xanmod1
pkgver=${_srctag//-/.}
pkgrel=1

pkgdesc="Linux Lan Tian Custom Build"
arch=(x86_64)
#url="https://github.com/xanmod/linux/commits/$_srctag"
url="https://github.com/xddxdd/pkgbuild/tree/master/linux-xanmod-lantian"
license=(GPL2)
makedepends=(
  bc kmod libelf pahole
  xmlto
  git
)
options=('!strip')
_srcname="linux-xanmod-$_pkgsuffix"
source=(
  "$_srcname::git+https://github.com/xanmod/linux.git#tag=$_srctag"
  0001-drm-i915-gvt-Add-virtual-option-ROM-emulation.patch::https://raw.githubusercontent.com/effeffe/pkgbuild/master/linux-xanmod-lantian/0001-drm-i915-gvt-Add-virtual-option-ROM-emulation.patch
  0002-qcserial.patch::https://raw.githubusercontent.com/effeffe/pkgbuild/master/linux-xanmod-lantian/0002-qcserial.patch
  0003-intel-drm-use-max-clock.patch::https://raw.githubusercontent.com/effeffe/pkgbuild/master/linux-xanmod-lantian/0003-intel-drm-use-max-clock.patch
  0004-hp-omen-fourzone.patch::https://raw.githubusercontent.com/effeffe/pkgbuild/master/linux-xanmod-lantian/0004-hp-omen-fourzone.patch
  0005-cjktty.patch::https://raw.githubusercontent.com/effeffe/pkgbuild/master/linux-xanmod-lantian/0005-cjktty.patch
  0006-uksm.patch::https://gitlab.com/sirlucjan/kernel-patches/-/raw/master/5.16/uksm-patches/0001-UKSM-for-5.16.patch
  0007-vfio-pci-d3cold.patch::https://raw.githubusercontent.com/effeffe/pkgbuild/master/linux-xanmod-lantian/0007-vfio-pci-d3cold.patch
  config
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30'  # Jan Alexander Steffens (heftig)
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

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
  scripts/config --set-str CONFIG_LOCALVERSION "-$_pkgsuffix"
  make olddefconfig

  scripts/config --set-str CONFIG_LOCALVERSION "-$_pkgsuffix"

  make -s kernelrelease > version
  echo "Prepared %s version %s" "$pkgbase" "$(<version)"
}

build() {
  cd $_srcname
  make all
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm -f "$modulesdir"/{source,build}

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

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

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
