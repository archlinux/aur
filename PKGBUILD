# Maintainer:  antman666 <945360554@qq.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>

### BUILD OPTIONS
# Set the next two variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Only compile active modules to VASTLY reduce the number of modules built and
# the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD reads the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# Optionally select a sub architecture by number or leave blank which will
# require user interaction during the build.
#
#  1. AMD Opteron/Athlon64/Hammer/K8 (MK8)
#  2. AMD Opteron/Athlon64/Hammer/K8 with SSE3 (MK8SSE3) (NEW)
#  3. AMD 61xx/7x50/PhenomX3/X4/II/K10 (MK10) (NEW)
#  4. AMD Barcelona (MBARCELONA) (NEW)
#  5. AMD Bobcat (MBOBCAT) (NEW)
#  6. AMD Jaguar (MJAGUAR) (NEW)
#  7. AMD Bulldozer (MBULLDOZER) (NEW)
#  8. AMD Piledriver (MPILEDRIVER) (NEW)
#  9. AMD Steamroller (MSTEAMROLLER) (NEW)
#  10. AMD Excavator (MEXCAVATOR) (NEW)
#  11. AMD Zen (MZEN) (NEW)
#  12. AMD Zen 2 (MZEN2) (NEW)
#  13. AMD Zen 3 (MZEN3) (NEW)
#  14. Intel P4 / older Netburst based Xeon (MPSC)
#  15. Intel Core 2 (MCORE2)
#  16. Intel Atom (MATOM)
#  17. Intel Nehalem (MNEHALEM) (NEW)
#  18. Intel Westmere (MWESTMERE) (NEW)
#  19. Intel Silvermont (MSILVERMONT) (NEW)
#  20. Intel Goldmont (MGOLDMONT) (NEW)
#  21. Intel Goldmont Plus (MGOLDMONTPLUS) (NEW)
#  22. Intel Sandy Bridge (MSANDYBRIDGE) (NEW)
#  23. Intel Ivy Bridge (MIVYBRIDGE) (NEW)
#  24. Intel Haswell (MHASWELL) (NEW)
#  25. Intel Broadwell (MBROADWELL) (NEW)
#  26. Intel Skylake (MSKYLAKE) (NEW)
#  27. Intel Skylake X (MSKYLAKEX) (NEW)
#  28. Intel Cannon Lake (MCANNONLAKE) (NEW)
#  29. Intel Ice Lake (MICELAKE) (NEW)
#  30. Intel Cascade Lake (MCASCADELAKE) (NEW)
#  31. Intel Cooper Lake (MCOOPERLAKE) (NEW)
#  32. Intel Tiger Lake (MTIGERLAKE) (NEW)
#  33. Intel Sapphire Rapids (MSAPPHIRERAPIDS) (NEW)
#  34. Intel Rocket Lake (MROCKETLAKE) (NEW)
#  35. Intel Alder Lake (MALDERLAKE) (NEW)
#  36. Generic-x86-64 (GENERIC_CPU)
#  37. Generic-x86-64-v2 (GENERIC_CPU2) (NEW)
#  38. Generic-x86-64-v3 (GENERIC_CPU3) (NEW)
#  39. Generic-x86-64-v4 (GENERIC_CPU4) (NEW)
#  40. Intel-Native optimizations autodetected by GCC (MNATIVE_INTEL) (NEW)
#  41. AMD-Native optimizations autodetected by GCC (MNATIVE_AMD) (NEW)
## It will select by itself
if [ -z ${_subarch+x} ]; then
  cpu=`grep vendor_id /proc/cpuinfo | awk -F: '{print $2}' | tail -1`
  if [ $cpu == 'GenuineIntel' ]; then
    _subarch=40
  elif [ $cpu == 'AuthenticAMD' ]; then
    _subarch=41
  else
    _subarch=36
  fi
fi

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-ck-uksm
pkgver=5.16.8
pkgrel=1
_major=5.16
arch=(x86_64)
url="https://wiki.archlinux.org/index.php/Linux-ck"
license=(GPL2)
makedepends=(
  bc kmod libelf cpio perl tar xz
)
options=('!strip')

_gcc_more_v=20211114
_patches_url="https://gitlab.com/sirlucjan/kernel-patches/-/raw/master/${_major}"
_jobs=$(nproc)
# https://ck-hack.blogspot.com/2021/08/514-and-future-of-muqss-and-ck-once.html
# thankfully xanmod keeps the hrtimer patches up to date
_commit=6b08df20f31708099a7fbccf5448958b4836118f
_xan=linux-5.15.y-xanmod

source=("https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar".{xz,sign}
        config         # the main kernel config file
        "more-uarches-${_gcc_more_v}.tar.gz::https://github.com/graysky2/kernel_compiler_patch/archive/${_gcc_more_v}.tar.gz"
        "xanmod-patches-from-ck-${_commit}.tar.gz::https://github.com/xanmod/linux-patches/archive/${_commit}.tar.gz"
        0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
        0002-Bluetooth-btintel-Fix-bdaddress-comparison-with-garb.patch
        0003-Bluetooth-Read-codec-capabilities-only-if-supported.patch
        0004-Bluetooth-fix-deadlock-for-RFCOMM-sk-state-change.patch
        "0005-UKSM.patch::${_patches_url}/uksm-patches/0001-UKSM-for-${_major}.patch"
        "0006-bbr2.patch::${_patches_url}/bbr2-patches/0001-bbr2-${_major}-introduce-BBRv2.patch"
        "0007-block.patch::${_patches_url}/block-patches/0001-block-patches.patch"
        "0008-btrfs.patch::${_patches_url}/btrfs-patches-v6/0001-btrfs-patches.patch"
        "0009-amd.patch::${_patches_url}/amd64-patches/0001-amd64-patches.patch"
        "0010-f2fs.patch::${_patches_url}/f2fs-patches-v2/0001-f2fs-patches.patch"
)

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)

b2sums=('6df3328fd48c422deb1b5bc9f3a98cc0a9d82c1d10ed87d64ca78823fa30ea5434ab85c0cde064849547b2f030189a6953a1666f82d4464f1dd690770cfe02a3'
        'SKIP'
        '0673ce184a6f3765b93eb4299bea54bc27b20002de724757cea18b81d26e8a280b0927bc5c776568658fe98693d3d83e227557c27fc3fc43a4d962bb6c27b85f'
        '534091fb5034226d48f18da2114305860e67ee49a1d726b049a240ce61df83e840a9a255e5b8fa9279ec07dd69fb0aea6e2e48962792c2b5367db577a4423d8d'
        '7e12da62ddc8535b044f57447e15b550dc2d1421bba4fc830dfad7b328b01f21190f63c5534b9af6a8c09f56bfb9c21014b07645569a6c7b93b950aca07ade5a'
        '163ca2dc04f259cc99a58bc9ef25a54757b82ddc68ac40fdf21fa9f877d901aacf5081f6a44d2b2041ad731afaeac863549834f652a9622eaa84db44965525ec'
        '0d264914102c22a3addd23ae94dbf8eba666c833ffd2c78d1a4f2633407365c4e5c5a84c95576f37ddf37759820b05d26ee80de2120f71e04b75559793a90385'
        'b18b3d5d005bc9cb1479899534f35dc3797e0094fd1304ef57ef5e6e786ec7fbe7364a4421769ab4a4098a6150db0b93ae36043504c4f78251fef8ca2cc4791e'
        'bca4fc5afe454e5dd8c1e8f667747a56bc5915b43b04c08753f4922087a92f545071c41d57218b52364c9030cfc077104715c7884c20e5db44a0939032d7957e'
        '9139215eb0d7af1448c1b1722059430f8aa95b4c8d7611776599cc94064e9ec7e09b02c2fd07487a3aa1b73ecefad09c7944eec73a2f0a422cda049aaed58847'
        'c744ca79e711adf08c65c73f7ab08a95a8c62ab8fd869a8db27add9874a559e226582823660d236ffb56d839d868f1c39bb82b77dbdb0bbdae93d4336a7decb5'
        'ede2f6ade748cac8e2ed46e092c7551f93cebe32b98b61911908d7d3ab2ee0ea08091b17723ebb2016c92b0488c74bb13b4c4453ea4fcc57c3cf38231c7eefbf'
        '595d4980f7c9a73a4398b35689fa84bd71a1a7fd6d8f9935f736c1425a043eaa829aeb41d18520a6dff7b9a3148ea32286d95f830d495bc6e7f4f9a49a066403'
        'eae5453f2ff6f3d7258be9838d8eaf3ea42741dde28f5e85644438fa2725ca45db122eb7298ebadc2c1379309dc3712083013d2439b8c02ce076333b58866dd5'
        'e2ffef303a48cf9c275cbea124dad62120ba5568b1f295b7e6f62fe65d2f9cfd069efb9442fd746df987915eb12f1d8245207f7e6c91e0a26090631c0538b079')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd linux-${pkgver}

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = 0*.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  msg2 "Setting config..."
  cp ../config .config

  # disable CONFIG_DEBUG_INFO=y at build time otherwise memory usage blows up
  # and can easily overwhelm a system with 32 GB of memory using a tmpfs build
  # partition ... this was introduced by FS#66260, see:
  # https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/linux&id=663b08666b269eeeeaafbafaee07fd03389ac8d7
  scripts/config --disable CONFIG_DEBUG_INFO
  scripts/config --disable CONFIG_CGROUP_BPF
  scripts/config --disable CONFIG_BPF_LSM
  scripts/config --disable CONFIG_BPF_PRELOAD
  scripts/config --disable CONFIG_BPF_LIRC_MODE2
  scripts/config --disable CONFIG_BPF_KPROBE_OVERRIDE

  # https://bbs.archlinux.org/viewtopic.php?pid=1824594#p1824594
  scripts/config --enable CONFIG_PSI_DEFAULT_DISABLED

  # https://bbs.archlinux.org/viewtopic.php?pid=1863567#p1863567
  scripts/config --disable CONFIG_LATENCYTOP
  scripts/config --disable CONFIG_SCHED_DEBUG

  # FS#66613
  # https://bugzilla.kernel.org/show_bug.cgi?id=207173#c6
  scripts/config --disable CONFIG_KVM_WERROR
  scripts/config --enable CONFIG_HZ_1000

  scripts/config --enable CONFIG_FTRACE
  scripts/config --enable CONFIG_FTRACE_SYSCALLS

  # ck patchset itself
  msg2 "Patching with ck hrtimer patches..."
  for i in ../linux-patches-"$_commit"/"$_xan"/ck-hrtimer/0*.patch; do
    patch -Np1 -i $i
  done

  # non-interactively apply ck1 default options
  # this isn't redundant if we want a clean selection of subarch below
  msg2 "Applying config..."
  make olddefconfig

  # https://github.com/graysky2/kernel_gcc_patch
  # make sure to apply after olddefconfig to allow the next section
  msg2 "Patching to enable GCC optimization for other uarchs..."
  patch -Np1 -i "$srcdir/kernel_compiler_patch-$_gcc_more_v/more-uarches-for-kernel-5.15+.patch"

  if [ -n "$_subarch" ]; then
    # user wants a subarch so apply choice defined above interactively via 'yes'
    yes "$_subarch" | make oldconfig
  else
    # no subarch defined so allow user to pick one
    make oldconfig
  fi

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
  msg2 "Prepared $pkgbase version $(<version)"

  [[ -z "$_makenconfig" ]] || make nconfig

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"

  # uncomment if you want to build with distcc
  ### sed -i '/HAVE_GCC_PLUGINS/d' arch/x86/Kconfig
}

build() {
  cd linux-${pkgver}
  make -j${_jobs} all
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with ck's hrtimer,bbr2 patches,etc"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
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
  #make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install
  # not needed since not building with CONFIG_DEBUG_INFO=y

  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  depends=("$pkgbase") # added to keep kernel and headers packages matched
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

  #echo "Stripping vmlinux..."
  #strip -v $STRIP_STATIC "$builddir/vmlinux"
  # not needed since not building with CONFIG_DEBUG_INFO=y

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
