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
pkgver=5.14.12
pkgrel=1
_major=5.14
_gcc_more_v=20210914
_patches_url="https://gitlab.com/sirlucjan/kernel-patches/-/raw/master/${_major}"
_jobs=$(nproc)
arch=(x86_64)
url="https://wiki.archlinux.org/index.php/Linux-ck"
license=(GPL2)
makedepends=(
  bc kmod libelf cpio perl tar xz
)
options=('!strip')

# https://ck-hack.blogspot.com/2021/08/514-and-future-of-muqss-and-ck-once.html
# thankfully xanmod keeps the hrtimer patches up to date
_commit=e2d48df5def86f498766b22e836a9c2f1bcb3809
_xan=linux-5.14.y-xanmod
source=("https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar".{xz,sign}
        config         # the main kernel config file
        "more-uarches-${_gcc_more_v}.tar.gz::https://github.com/graysky2/kernel_compiler_patch/archive/${_gcc_more_v}.tar.gz"
        "xanmod-patches-from-ck-${_commit}.tar.gz::https://hub.fastgit.org/xanmod/linux-patches/archive/${_commit}.tar.gz"
        0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
        0002-Bluetooth-btusb-Add-support-for-IMC-Networks-Mediate.patch
        0003-Bluetooth-btusb-Add-support-for-Foxconn-Mediatek-Chi.patch
        0004-ALSA-pcm-Check-mmap-capability-of-runtime-dma-buffer.patch
        0005-ALSA-pci-rme-Set-up-buffer-type-properly.patch
        0006-ALSA-pci-cs46xx-Fix-set-up-buffer-type-properly.patch
        "0007-UKSM.patch::${_patches_url}/uksm-patches-v2/0001-UKSM-for-${_major}.patch"
        "0008-bbr2.patch::${_patches_url}/bbr2-patches/0001-bbr2-5.14-introduce-BBRv2.patch"
        "0009-lru.patch::${_patches_url}/lru-patches-v4/0001-lru-patches.patch"
        "0010-block.patch::${_patches_url}/block-patches/0001-block-patches.patch"
        "0011-bfq.patch::${_patches_url}/bfq-patches-v2/0001-bfq-patches.patch"
)

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)

b2sums=('854c3160a327a38ba0e8e35a2952029670429d829e903ba4fda659aa7cc7b88014b5dbdeefd2e0cc95e0311875fc7dae4c5fad825bff72102a894624845acbb8'
        'SKIP'
        '1e1a466bef6fe16a5fc2b67ba66b7757a8048f07cb831d10b355d0ec5342a13590552ca41b0e3e88ef1a7c56f00cb5d09c7b2366c67811c47e72e1fd8f3b683a'
        'd1c083f96f645679c5214e05f906b47f17ac6a8b3dd2faeb219e3ceda3a008e3fe47c4a79b0345978cec5c5e28da9b20727970cf5c788d52c3782dc5b36aa211'
        'bd20774ee2c9856601af2c89a3af95c6abc812b71253368090e9c252edcce452f416bfeed54ced0886d401b5a9e1cb72c16ea5f04a72d8ded596c0d083f80e42'
        '99706dd57b5620066bdfcb46ccd07de489dea59d5eeda10932f11abe7a43a6a354e7759638d75bc14e115a252eea6ab0a68163c23e45989d6bae820c4d772691'
        '45f51985ca1450fcd8669db715ae7ee105f6f8331acf56d747d1dd93b420a6e6fb8159e4d5e3575ab1a55ace6df42185b97f9bb1476e7ab43b9aadd3e924b715'
        'c5fd318fc4d2aef30f9ebf4b724e2aa26966384db8762eaff82137dc6161d0148798e8181207d0f8ba52f94ca1853bc7817efdf3cbbf996c5cc1a3da1868cef7'
        'a9f502ad881fb115a90ee3133feab8f5ab0927a415df4f5140e4d61f45a69bb53e0c7af20b35078f75fd3898c3cd1056f4a0c0ff372b5e10e1d52c9d5afd3473'
        '1877429274d65accf2e8684078d052a9b44b0ef9f7b5fae13a679877f6a3b8b4749fcfd4223648907cf53e0e89cf229abefaf1e40494d6a8866a7258ad6c5800'
        'f0337c83077501734e40663a3bb2e0da31ba1921960e40c3c6040a9265a63707f7fd524fc9e3eb3e1b23f6c5f9cd883348b6fdf7bc085b3e30565a8669006f19'
        '8f6d6263f0e517b6e7a1809fc57e01cc4b13dd261f778041026ec510f48257d4f525c3cb0b0935e291293960c9191282f5765ca0af3d948838e8f865c7deafcc'
        'e263f1cf228d5a2c26340f37fa1b4a6d6c643b1a22378f37c96b68f5ec10372d65e2bf96716aec0722b18d76ca752b9debf82f621896e03917c977d8db2a4b21'
        '29ef7be0f224ba79f1cd69cd61e21142fbf29b5717e9a1cf41a01f35def29c4e02bf138a06c09eab5b066dd54865c29acc219405572184ab213a41a72dbbef81'
        'cfe0d9e00a2b8b47f92e61e851eb45243de4928b55708ec67f5558aa48ae62e580b85b58afadc8f6a301f44a14293274efe87f850af0c305e26647c3d9713239'
        'fdb2c0b59e34b85a5859cbd3a8de707170cd235b91a092d338b91a7d4ada3da17a43b63f76b71b5c148ca3d97bb0534f339f9d4045156e1a0d0a9dce9047cd7e')

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
  patch -Np1 -i "$srcdir/kernel_compiler_patch-$_gcc_more_v/more-uarches-for-kernel-5.8-5.14.patch"

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
