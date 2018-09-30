# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Optionally select a sub architecture by number if building in a clean chroot
# Leaving this entry blank will require user interaction during the build 
# which will cause a failure to build if using makechrootpkg. Note that the
# generic (default) option is 26.
#
#  1. AMD Opteron/Athlon64/Hammer/K8 (MK8)
#  2. AMD Opteron/Athlon64/Hammer/K8 with SSE3 (MK8SSE3)
#  3. AMD 61xx/7x50/PhenomX3/X4/II/K10 (MK10)
#  4. AMD Barcelona (MBARCELONA)
#  5. AMD Bobcat (MBOBCAT)
#  6. AMD Jaguar (MJAGUAR)
#  7. AMD Bulldozer (MBULLDOZER)
#  8. AMD Piledriver (MPILEDRIVER)
#  9. AMD Steamroller (MSTEAMROLLER)
#  10. AMD Excavator (MEXCAVATOR)
#  11. AMD Zen (MZEN)
#  12. Intel P4 / older Netburst based Xeon (MPSC)
#  13. Intel Atom (MATOM)
#  14. Intel Core 2 (MCORE2)
#  15. Intel Nehalem (MNEHALEM)
#  16. Intel Westmere (MWESTMERE)
#  17. Intel Silvermont (MSILVERMONT)
#  18. Intel Sandy Bridge (MSANDYBRIDGE)
#  19. Intel Ivy Bridge (MIVYBRIDGE)
#  20. Intel Haswell (MHASWELL)
#  21. Intel Broadwell (MBROADWELL)
#  22. Intel Skylake (MSKYLAKE)
#  23. Intel Skylake X (MSKYLAKEX)
#  24. Intel Cannon Lake (MCANNONLAKE)
#  25. Intel Ice Lake (MICELAKE)
#  26. Generic-x86-64 (GENERIC_CPU)
#  27. Native optimizations autodetected by GCC (MNATIVE)
_subarch=

# NUMA is optimized for multi-socket motherboards. A single multi-core CPU can
# actually run slower with NUMA enabled. Most users will want to set this option
# to enabled ... in other words, do not use NUMA on a single CPU system.
#
# It has been reported that users of CUDA require NUMA to be enabled, therefore
# if you require CUDA support, be sure the variable below is set to a null
# See: https://bbs.archlinux.org/viewtopic.php?id=239174
_NUMAdisable=y

# Compile ONLY probed modules
# As of mainline 2.6.32, running with this option will only build the modules
# that you currently have probed in your system VASTLY reducing the number of
# modules built and the build time to do it.
#
# WARNING - ALL modules must be probed BEFORE you begin making the pkg!
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD will call it directly to probe all the modules you have logged!
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-ck
_srcver=4.18.11-arch1
pkgver=${_srcver%-*}
pkgrel=1
_ckpatchversion=1
arch=(x86_64)
url="https://wiki.archlinux.org/index.php/Linux-ck"
license=(GPL2)
makedepends=(kmod inetutils bc libelf)
options=('!strip')
_ckpatchname="patch-4.18-ck${_ckpatchversion}"
_gcc_more_v='20180509'
source=(
  "https://www.kernel.org/pub/linux/kernel/v4.x/linux-$pkgver.tar".{xz,sign}
  config         # the main kernel config file
  60-linux.hook  # pacman hook for depmod
  90-linux.hook  # pacman hook for initramfs regeneration
  linux.preset   # standard config files for mkinitcpio ramdisk
  "enable_additional_cpu_optimizations-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_gcc_patch/archive/$_gcc_more_v.tar.gz" # enable_additional_cpu_optimizations_for_gcc
  "http://ck.kolivas.org/patches/4.0/4.18/4.18-ck${_ckpatchversion}/${_ckpatchname}.xz"
  Fix_MuQSS_full_dynticks_build.patch::https://github.com/ckolivas/linux/commit/abb4fd30fa127a0e8178b975343eb01713bc2b18.patch
  0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
  0002-Arch-Linux-kernel-v4.18.11-arch1.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('36d319f5a6caf5dd6ab2a4802b800799b56ef5963d742f2d147fabadf4822c8c'
            'SKIP'
            '9f2454dae08fbd96059fe79ec05933d724cd2c9b383f5be092c7871ac1551649'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65'
            '226e30068ea0fecdb22f337391385701996bfbdba37cdcf0f1dbf55f1080542d'
            '0354083492adb3785dd31d2d4bf7dc805110aceffb369deed6cbded121f8a3d3'
            '6e1f3cc3eb9a1e30a69ef1999f9aa6ad7f2f9fe4af7ba5dabe25d4ff19ee6740'
            '941cb67a8b4af8598c1696a4ece30432a48b7b829f16c33ace072637a5423593'
            '2740b962fb6af8c24763a1f285c293e9f3064c09819e828d2269b7ebdd4c6f6e')

_kernelname=${pkgbase#linux}
: ${_kernelname:=-ARCH}

prepare() {
  cd linux-${pkgver}

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "$_kernelname" > localversion.20-pkgname

  # fix naming schema in EXTRAVERSION of ck patch set
  sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "../${_ckpatchname}"

  msg2 "Patching with ck patchset..."
  patch -Np1 -i "$srcdir/${_ckpatchname}"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  msg2 "Setting config..."
  cp ../config .config

  ### Optionally disable NUMA
  if [ -n "$_NUMAdisable" ]; then
    msg2 "Disabling NUMA from kernel config..."
    sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
      -i -e '/CONFIG_AMD_NUMA=y/d' \
      -i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
      -i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
      -i -e '/# CONFIG_NUMA_EMU is not set/d' \
      -i -e '/CONFIG_NODES_SHIFT=6/d' \
      -i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
      -i -e '/# CONFIG_MOVABLE_NODE is not set/d' \
      -i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
      -i -e '/CONFIG_ACPI_NUMA=y/d' ./.config
  fi

  # https://github.com/graysky2/kernel_gcc_patch
  msg2 "Patching to enabled additional gcc CPU optimizatons..."
  patch -Np1 -i "$srcdir/kernel_gcc_patch-$_gcc_more_v/enable_additional_cpu_optimizations_for_gcc_v8.1+_kernel_v4.13+.patch"

  if [ -n "$_subarch" ]; then
    yes "$_subarch" | make oldconfig
  else
    make prepare
  fi

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "$_localmodcfg" ]; then
      msg "If you have modprobed-db installed, running it in recall mode now"
      if [ -e /usr/bin/modprobed-db ]; then
        [[ -x /usr/bin/sudo ]] || {
        echo "Cannot call modprobe with sudo. Install sudo and configure it to work with this user."
        exit 1; }
        sudo /usr/bin/modprobed-db recall
      fi
      msg "Running Steven Rostedt's make localmodconfig now"
      make localmodconfig
    fi
  # do not run `make olddefconfig` as it sets default options
  yes "" | make config >/dev/null

  make -s kernelrelease > ../version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<../version)"

  [[ -z "$_makenconfig" ]] || make nconfig

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"
}

build() {
  cd linux-${pkgver}
  make bzImage modules
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the ck1 patchset featuring MuQSS CPU scheduler v0.173"
  #_Kpkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the ck1 patchset featuring MuQSS CPU scheduler v0.173"
  #pkgdesc="${_Kpkgdesc}"
  depends=(coreutils linux-firmware kmod mkinitcpio)
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("linux-ck=${pkgver}")
  backup=("etc/mkinitcpio.d/$pkgbase.preset")
  install=linux.install
  #groups=('ck-generic')

  local kernver="$(<version)"

  cd linux-${pkgver}

  msg2 "Installing boot image..."
  install -Dm644 "$(make -s image_name)" "$pkgdir/boot/vmlinuz-$pkgbase"

  msg2 "Installing modules..."
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"
  mkdir -p "$modulesdir"
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # a place for external modules,
  # with version file for building modules and running depmod from hook
  local extramodules="extramodules$_kernelname"
  local extradir="$pkgdir/usr/lib/modules/$extramodules"
  install -Dt "$extradir" -m644 ../version
  ln -sr "$extradir" "$modulesdir/extramodules"

  # remove build and source links
  rm "$modulesdir"/{source,build}

  msg2 "Installing hooks..."
  # sed expression for following substitutions
  local subst="
    s|%PKGBASE%|$pkgbase|g
    s|%KERNVER%|$kernver|g
    s|%EXTRAMODULES%|$extramodules|g
  "

  # hack to allow specifying an initially nonexisting install file
  sed "$subst" "$startdir/$install" > "$startdir/$install.pkg"
  true && install=$install.pkg

  # fill in mkinitcpio preset and pacman hooks
  sed "$subst" ../linux.preset | install -Dm644 /dev/stdin \
    "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
  sed "$subst" ../60-linux.hook | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/60-$pkgbase.hook"
  sed "$subst" ../90-linux.hook | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/90-$pkgbase.hook"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  #_Hpkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  #pkgdesc="${_Hpkgdesc}"
  depends=('linux-ck') # added to keep kernel and headers packages matched
  provides=("linux-ck-headers=${pkgver}" "linux-headers=${pkgver}")
  #groups=('ck-generic')

 local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

 cd linux-${pkgver}



  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 Makefile .config Module.symvers System.map vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  # ???
  mkdir "$builddir/.tmp_versions"

  msg2 "Installing headers..."
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

  msg2 "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg2 "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg2 "Removing documentation..."
  rm -r "$builddir/Documentation"

  msg2 "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg2 "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg2 "Stripping build tools..."
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

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase-$pkgver"

  msg2 "Fixing permissions..."
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
