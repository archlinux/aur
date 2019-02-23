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
# Note - the march=native option is unavailable by this method, use the nconfig
# and manually select it.
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
_subarch=

# Compile ONLY probed modules
# Build in only the modules that you currently have probed in your system VASTLY
# reducing the number of modules built and the build time.
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
_srcver=4.20.12-arch1
pkgver=${_srcver%-*}
pkgrel=4
_ckpatchversion=1
arch=(x86_64)
url="https://wiki.archlinux.org/index.php/Linux-ck"
license=(GPL2)
makedepends=(kmod inetutils bc libelf)
options=('!strip')
_ckpatch="patch-4.20-ck${_ckpatchversion}"
_gcc_more_v='20180509'
source=(
  "https://www.kernel.org/pub/linux/kernel/v4.x/linux-$pkgver.tar".{xz,sign}
  config         # the main kernel config file
  60-linux.hook  # pacman hook for depmod
  90-linux.hook  # pacman hook for initramfs regeneration
  linux.preset   # standard config files for mkinitcpio ramdisk
  "enable_additional_cpu_optimizations-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_gcc_patch/archive/$_gcc_more_v.tar.gz"
  "http://ck.kolivas.org/patches/4.0/4.20/4.20-ck${_ckpatchversion}/$_ckpatch.xz"
  0000-unfuck-ck1-for-kvm-intel-symbol.patch
  0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
  0002-exec-Fix-mem-leak-in-kernel_read_file.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('1cf544308195250805e0731c716691bea4c1ed29e03e6f9ae5be6dc16785a504'
            'SKIP'
            '4ff10c16fa729f808e812e3ff53ef8087ab9c220c84d860676d3bfb5c1c63c5d'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            'c043f3033bb781e2688794a59f6d1f7ed49ef9b13eb77ff9a425df33a244a636'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65'
            '226e30068ea0fecdb22f337391385701996bfbdba37cdcf0f1dbf55f1080542d'
            '4bd614333fcbe509118b5362889f76d241e1d33e1ee691bd24fd82384ce7f2de'
            '3e8c7d3015bb593e8a861be0b2b9f1de74fcb25e00c6e3eacee3165c6bec6f64'
            '55823bb3ca652d917ba79860d595b479ec20c22a7c6854cbef901d44b4196316'
            'bbf31b3a6af1db882cb63bd5e5385f174f2345272acaf18f129712a0a726689b')

_kernelname=${pkgbase#linux}
: ${_kernelname:=-ARCH}

prepare() {
  cd linux-${pkgver}

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "$_kernelname" > localversion.20-pkgname

  # fix naming schema in EXTRAVERSION of ck patch set
  sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "../${_ckpatch}"

  msg2 "Patching with ck patchset..."
  patch -Np1 -i "$srcdir/${_ckpatch}"

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

  # https://bbs.archlinux.org/viewtopic.php?pid=1824594#p1824594
  sed -i -e 's/# CONFIG_PSI_DEFAULT_DISABLED is not set/CONFIG_PSI_DEFAULT_DISABLED=y/' ./.config

  # https://github.com/graysky2/kernel_gcc_patch
  msg2 "Applying enable_additional_cpu_optimizations_for_gcc_v8.1+_kernel_v4.13+ patch..."
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
        make localmodconfig
      fi
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
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the ck1 patchset featuring MuQSS CPU scheduler v0.185"
  #_Kpkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the ck1 patchset featuring MuQSS CPU scheduler v0.185"
  #pkgdesc="${_Kpkgdesc}"
  depends=(coreutils linux-firmware kmod mkinitcpio)
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("linux-ck=${pkgver}")
  backup=("etc/mkinitcpio.d/$pkgbase.preset")
  install=linux.install
  #groups=('ck-generic')

  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  cd linux-${pkgver}

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
  install -Dm644 "$modulesdir/vmlinuz" "$pkgdir/boot/vmlinuz-$pkgbase"

  msg2 "Installing modules..."
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
