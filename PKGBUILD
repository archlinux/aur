# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Optionally select a sub architecture by number if building in a clean chroot
# Leaving this entry blank will require user interaction during the build
# which will cause a failure to build if using makechrootpkg. Note that the
# generic (default) option is 30.
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
#  12. AMD Zen 2 (MZEN2)
#  13. Intel P4 / older Netburst based Xeon (MPSC)
#  14. Intel Atom (MATOM)
#  15. Intel Core 2 (MCORE2)
#  16. Intel Nehalem (MNEHALEM)
#  17. Intel Westmere (MWESTMERE)
#  18. Intel Silvermont (MSILVERMONT)
#  19. Intel Goldmont (MGOLDMONT)
#  20. Intel Goldmont Plus (MGOLDMONTPLUS)
#  21. Intel Sandy Bridge (MSANDYBRIDGE)
#  22. Intel Ivy Bridge (MIVYBRIDGE)
#  23. Intel Haswell (MHASWELL)
#  24. Intel Broadwell (MBROADWELL)
#  25. Intel Skylake (MSKYLAKE)
#  26. Intel Skylake X (MSKYLAKEX)
#  27. Intel Cannon Lake (MCANNONLAKE)
#  28. Intel Ice Lake (MICELAKE)
#  29. Intel Cascade Lake (MCASCADELAKE)
#  30. Intel Cooper Lake (MCOOPERLAKE)
#  31. Intel Tiger Lake (MTIGERLAKE)
#  32. Generic-x86-64 (GENERIC_CPU)
#  33. Native optimizations autodetected by GCC (MNATIVE)
_subarch=

# Compile ONLY used modules to VASTLYreduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-mainline-bcachefs
pkgver=5.6.14
_sublevel=14
pkgrel=1
arch=(x86_64)
url="https://wiki.archlinux.org/index.php/bcachefs"
license=(GPL2)
makedepends=(
  bc kmod libelf
)
options=('!strip')

_reponame="bcachefs"
_repo_url="https://github.com/koverstreet/$_reponame"

source=(
  "https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar".{xz,sign}
  config
  0000-sphinx-workaround.patch
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  "https://github.com/Frogging-Family/linux-tkg/raw/master/linux56-tkg/linux56-tkg-patches/0002-clear-patches.patch"
  "https://github.com/Frogging-Family/linux-tkg/raw/master/linux56-tkg/linux56-tkg-patches/0003-glitched-base.patch"
  "https://github.com/Frogging-Family/linux-tkg/raw/master/linux56-tkg/linux56-tkg-patches/0007-v5.6-fsync.patch"
  "https://github.com/Frogging-Family/linux-tkg/raw/master/linux56-tkg/linux56-tkg-patches/0008-5.6-bcachefs.patch"
)


validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
md5sums=('1941f86c38e5c81b87dddeb808710b9f'
         'SKIP'
         'b93393f3e437c3b43f0eb9f446a95b02'
         '2cebdad39da582fd6a0c01746c8adb42'
         'b31b27f8a6a8f5fb79a6a6f4e1f07cc4'
         'b10e4c612d5240d66fad8f1c50fe3242'
         '40e097c2afbcc1dceb07f85a7cb63b96'
         '228b33d0cb13cab162b3e051ec9bb88d'
         '9ed187660600a7884284aa6b3ddb08c6')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd linux-${pkgver}
  
#  git init

#  git fetch --tags

#  git remote add $_reponame $_repo_url || true
#  git fetch --prune --jobs=5 $_reponame master
#  git reset --hard $_reponame/master

#  export EDITOR=true

#  git rebase bcachefs/master

  # fix pkgver to chosen pkgver
  sed -i "s/SUBLEVEL = 0/SUBLEVEL = $_sublevel/g" $srcdir/linux-${pkgver}/Makefile

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname
    
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = 000*.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  
  echo "Setting config..."
  cp ../config .config
  
  # Inject cpuopts options
  echo "# CONFIG_MK8SSE3 is not set" >> ./.config
  echo "# CONFIG_MK10 is not set" >> ./.config
  echo "# CONFIG_MBARCELONA is not set" >> ./.config
  echo "# CONFIG_MBOBCAT is not set" >> ./.config
  echo "# CONFIG_MJAGUAR is not set" >> ./.config
  echo "# CONFIG_MBULLDOZER is not set" >> ./.config
  echo "# CONFIG_MPILEDRIVER is not set" >> ./.config
  echo "# CONFIG_MSTEAMROLLER is not set" >> ./.config
  echo "# CONFIG_MEXCAVATOR is not set" >> ./.config
  echo "# CONFIG_MZEN is not set" >> ./.config
  echo "# CONFIG_MZEN2 is not set" >> ./.config
  echo "# CONFIG_MATOM is not set" >> ./.config
  echo "# CONFIG_MNEHALEM is not set" >> ./.config
  echo "# CONFIG_MWESTMERE is not set" >> ./.config
  echo "# CONFIG_MSILVERMONT is not set" >> ./.config
  echo "# CONFIG_MSANDYBRIDGE is not set" >> ./.config
  echo "# CONFIG_MIVYBRIDGE is not set" >> ./.config
  echo "# CONFIG_MHASWELL is not set" >> ./.config
  echo "# CONFIG_MBROADWELL is not set" >> ./.config
  echo "# CONFIG_MSKYLAKE is not set" >> ./.config
  echo "# CONFIG_MSKYLAKEX is not set" >> ./.config
  echo "# CONFIG_MCANNONLAKE is not set" >> ./.config
  echo "# CONFIG_MICELAKE is not set" >> ./.config
  echo "# CONFIG_MGOLDMONT is not set" >> ./.config
  echo "# CONFIG_MGOLDMONTPLUS is not set" >> ./.config
  echo "# CONFIG_MCASCADELAKE is not set" >> ./.config
  echo "# CONFIG_MCOOPERLAKE is not set" >> ./.config
  echo "# CONFIG_MTIGERLAKE is not set" >> ./.config
  
  # cpu opt
  if [ -n "$_subarch" ] && [ "$_subarch" != "33" ]; then
    echo "# CONFIG_MNATIVE is not set" >> ./.config
  fi

  if [ -n "$_subarch" ] && [ "$_subarch" != "32" ]; then
    sed -i -e 's/CONFIG_GENERIC_CPU=y/# CONFIG_GENERIC_CPU is not set/' ./.config
  fi

  if [ "$_subarch" == "33" ] || [ "$_subarch" == "" ]; then
    echo "CONFIG_MNATIVE=y" >> ./.config
  elif [ "$_subarch" == "1" ]; then
    sed -i -e 's/# CONFIG_MK8 is not set/CONFIG_MK8=y/' ./.config
  elif [ "$_subarch" == "2" ]; then
    sed -i -e 's/# CONFIG_MK8SSE3 is not set/CONFIG_MK8SSE3=y/' ./.config
  elif [ "$_subarch" == "3" ]; then
    sed -i -e 's/# CONFIG_MK10 is not set/CONFIG_MK10=y/' ./.config
  elif [ "$_subarch" == "4" ]; then
    sed -i -e 's/# CONFIG_MBARCELONA is not set/CONFIG_MBARCELONA=y/' ./.config
  elif [ "$_subarch" == "5" ]; then
    sed -i -e 's/# CONFIG_MBOBCAT is not set/CONFIG_MBOBCAT=y/' ./.config
  elif [ "$_subarch" == "6" ]; then
    sed -i -e 's/# CONFIG_MJAGUAR is not set/CONFIG_MJAGUAR=y/' ./.config
  elif [ "$_subarch" == "7" ]; then
    sed -i -e 's/# CONFIG_MBULLDOZER is not set/CONFIG_MBULLDOZER=y/' ./.config
  elif [ "$_subarch" == "8" ]; then
    sed -i -e 's/# CONFIG_MPILEDRIVER is not set/CONFIG_MPILEDRIVER=y/' ./.config
  elif [ "$_subarch" == "9" ]; then
    sed -i -e 's/# CONFIG_MSTEAMROLLER is not set/CONFIG_MSTEAMROLLER=y/' ./.config
  elif [ "$_subarch" == "10" ]; then
    sed -i -e 's/# CONFIG_MEXCAVATOR is not set/CONFIG_MEXCAVATOR=y/' ./.config
  elif [ "$_subarch" == "11" ]; then
    sed -i -e 's/# CONFIG_MZEN is not set/CONFIG_MZEN=y/' ./.config
  elif [ "$_subarch" == "12" ]; then
    sed -i -e 's/# CONFIG_MZEN2 is not set/CONFIG_MZEN2=y/' ./.config
  elif [ "$_subarch" == "13" ]; then
    sed -i -e 's/# CONFIG_MPSC is not set/CONFIG_MPSC=y/' ./.config
  elif [ "$_subarch" == "14" ]; then
    sed -i -e 's/# CONFIG_MATOM is not set/CONFIG_MATOM=y/' ./.config
  elif [ "$_subarch" == "15" ]; then
    sed -i -e 's/# CONFIG_MCORE2 is not set/CONFIG_MCORE2=y/' ./.config
  elif [ "$_subarch" == "16" ]; then
    sed -i -e 's/# CONFIG_MNEHALEM is not set/CONFIG_MNEHALEM=y/' ./.config
  elif [ "$_subarch" == "17" ]; then
    sed -i -e 's/# CONFIG_MWESTMERE is not set/CONFIG_MWESTMERE=y/' ./.config
  elif [ "$_subarch" == "18" ]; then
    sed -i -e 's/# CONFIG_MSILVERMONT is not set/CONFIG_MSILVERMONT=y/' ./.config
  elif [ "$_subarch" == "19" ]; then
    sed -i -e 's/# CONFIG_MGOLDMONT is not set/CONFIG_MGOLDMONT=y/' ./.config
  elif [ "$_subarch" == "20" ]; then
    sed -i -e 's/# CONFIG_MGOLDMONTPLUS is not set/CONFIG_MGOLDMONTPLUS=y/' ./.config
  elif [ "$_subarch" == "21" ]; then
    sed -i -e 's/# CONFIG_MSANDYBRIDGE is not set/CONFIG_MSANDYBRIDGE=y/' ./.config
  elif [ "$_subarch" == "22" ]; then
    sed -i -e 's/# CONFIG_MIVYBRIDGE is not set/CONFIG_MIVYBRIDGE=y/' ./.config
  elif [ "$_subarch" == "23" ]; then
    sed -i -e 's/# CONFIG_MHASWELL is not set/CONFIG_MHASWELL=y/' ./.config
  elif [ "$_subarch" == "24" ]; then
    sed -i -e 's/# CONFIG_MBROADWELL is not set/CONFIG_MBROADWELL=y/' ./.config
  elif [ "$_subarch" == "25" ]; then
    sed -i -e 's/# CONFIG_MSKYLAKE is not set/CONFIG_MSKYLAKE=y/' ./.config
  elif [ "$_subarch" == "26" ]; then
    sed -i -e 's/# CONFIG_MSKYLAKEX is not set/CONFIG_MSKYLAKEX=y/' ./.config
  elif [ "$_subarch" == "27" ]; then
    sed -i -e 's/# CONFIG_MCANNONLAKE is not set/CONFIG_MCANNONLAKE=y/' ./.config
  elif [ "$_subarch" == "28" ]; then
    sed -i -e 's/# CONFIG_MICELAKE is not set/CONFIG_MICELAKE=y/' ./.config
  elif [ "$_subarch" == "29" ]; then
    sed -i -e 's/# CONFIG_MCASCADELAKE is not set/CONFIG_MCASCADELAKE=y/' ./.config
  elif [ "$_subarch" == "30" ]; then
    sed -i -e 's/# CONFIG_MCOOPERLAKE is not set/CONFIG_MCOOPERLAKE=y/' ./.config
  elif [ "$_subarch" == "31" ]; then
    sed -i -e 's/# CONFIG_MTIGERLAKE is not set/CONFIG_MTIGERLAKE=y/' ./.config
  fi
  
  make prepare
  
  # https://bbs.archlinux.org/viewtopic.php?pid=1824594#p1824594
  sed -i -e 's/# CONFIG_PSI_DEFAULT_DISABLED is not set/CONFIG_PSI_DEFAULT_DISABLED=y/' ./.config

  # https://bbs.archlinux.org/viewtopic.php?pid=1863567#p1863567
  sed -i -e '/CONFIG_LATENCYTOP=/ s,y,n,' \
      -i -e '/CONFIG_SCHED_DEBUG=/ s,y,n,' ./.config

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "$_localmodcfg" ]; then
      if [ -f $HOME/.config/modprobed.db ]; then
        echo "Running Steven Rostedt's make localmodconfig now"
        make LSMOD=$HOME/.config/modprobed.db localmodconfig
      else
        echo "No modprobed.db data found"
        exit
      fi
    fi

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"

  [[ -z "$_makenconfig" ]] || make nconfig

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"
}

build() {
  cd linux-${pkgver}
  make all
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with bcachefs"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=("linux-mainline-bcachefs=${pkgver}")
  #groups=('ck-generic')

  cd linux-${pkgver}

  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  #install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
  #
  # hard-coded path in case user defined CC=xxx for build which causes errors
  # see this FS https://bugs.archlinux.org/task/64315
  install -Dm644 arch/x86/boot/bzImage "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  depends=('linux-mainline-bcachefs') # added to keep kernel and headers packages matched
  provides=("linux-mainline-bcachefs-headers=${pkgver}" "linux-headers=${pkgver}")
  #groups=('ck-generic')

  cd linux-${pkgver}
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
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

}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
