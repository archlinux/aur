# Maintainer: Petter K. <netp.kpocc6akkh AT mail DOT ru> 
# Thanks to: Edward Shishkin, for providing his Reiser4FS patchset to the public.
#            graysky for providing the GCC CPU patchset and linux-ck builds.
#            Con Kolivas for creating his -ck1 patchset and making it available.             

### Options
# Set these variables to y or leave blank for default

# Configure kernel options prior to a build via nconfig, otherwise the default config + the selected options below will be used (with -march=native)
# Recommended for experienced users (default=)
_makenconfig=

# Enable AMD CPU support (default=) 
# WARNING: If you intend to run and compile the kernel on a AMD CPU, please enable. DEFAULT IS INTEL *ONLY*.
_amdcpu=

# Enable -march=native CPU optimization (detection via GCC).
_enable_native=y

# Enable Reiser4 filesystem support (default=y) - A plugin-based, high-performance, multi-function filesystem.
_reiser4=y

# Disable NUMA support (default=y). Changing this adds no additional benefits for a regular desktop system unless your system has more than one physical CPU (not thread/core).
_disable_numa=y

# Disable Nouveau driver support (default=y, useful for proprietary NVIDIA-driver users) which many users end up having to blacklist anyway.
_disable_nouveau=y

# Enable watchdog timer support (default=). Leaving this disabled is useful for avoiding the compilation of watchdog drivers and having to blacklist modules later.
_enable_watchdog=

# Enable the -ck performance patchset by Con Kolivas (default=y). Very useful for interactivity and responsiveness while under heavy workloads (even for laptops).
_enable_ck=y

# Enable the MuQSS scheduler provided by the ck patchset (default=y)
_enable_muqss=y

# Optionally enable a custom, very lightweight, fast and optimized kernel configuration for Dell Precision >=5520/Dell XPS 15 >=9560 laptops.
# Use at your own risk! (default=). 
# If enabled, leave all other options above at their defaults, except for maybe _makenconfig=y to configure the kernel options you might want to enable.
# Note that this config has disabled btrfs, tablet and touchscreen support and only supports Intel WiFi. 
# Set _makenconfig=y to configure drivers for touchscreen and if needed, enable btrfs under "File Systems".
# You have been warned.
_dellconfig=

### Do no edit below this line.

pkgbase=linux-ck-reiser4
_srcver=5.0.13-arch1
pkgver=${_srcver%-*}
pkgrel=1
_ckpatchversion=1
arch=(x86_64)
url="https://wiki.archlinux.org/index.php/Reiser4"
license=(GPL2)
makedepends=(kmod inetutils bc libelf git)
options=('!strip')
_ckpatch="patch-5.0-ck${_ckpatchversion}"
_reiser4patch="reiser4-for-5.0.0.patch.gz"
_gcc_more_v='20180509'
source=(
  "https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar".{xz,sign}
  config
  config-dell
  "reiser4-for-5.0.0.patch.gz::https://downloads.sourceforge.net/project/reiser4/reiser4-for-linux-5.x/reiser4-for-5.0.0.patch.gz"
  60-linux.hook
  90-linux.hook
  linux.preset
  "enable_additional_cpu_optimizations-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_gcc_patch/archive/$_gcc_more_v.tar.gz"
  "http://ck.kolivas.org/patches/5.0/5.0/5.0-ck${_ckpatchversion}/$_ckpatch.xz"
  0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('bcfd52bf1faa24f5f712146a873959461e001656ad67717e80b947aa6ad53479'
            'SKIP'
            'SKIP'
            'SKIP'
            '4b799d175ee37d0210685cd0625fef51b19e91f88e6cc0f17bcb9a1ca7fb5668'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            'c043f3033bb781e2688794a59f6d1f7ed49ef9b13eb77ff9a425df33a244a636'
            '1156e8a7c9494af9b197669c2f300ed44edda7202d2367e627564673400e73f7'
            '226e30068ea0fecdb22f337391385701996bfbdba37cdcf0f1dbf55f1080542d'
            '661f64bbd8bf49afcc7c760c4148b2e2108511a1eadcae917cfe6056a83d8476'
            '91fafa76bf9cb32159ac7f22191b3589278b91e65bc4505cf2fc6013b8037bf3')

_kernelname=${pkgbase#linux}
: ${_kernelname:=-ARCH}

prepare() {
  cd linux-${pkgver}
  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "$_kernelname" > localversion.20-pkgname

  # Optionally enable the ck1 patchset by Con Kolivas
  if [ -n "$_enable_ck" ]; then
    sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "../${_ckpatch}"
    msg2 "Patching the kernel with the ck1 patchset..."
    sed -i '/-CFLAGS/ s/$/ \$(LIBELF_FLAGS)/' "$srcdir/patch-5.0-ck1"
    patch -F 3 -Np1 -i "$srcdir/${_ckpatch}"
  else
    msg2 "Skipping the -ck1 patchset..."
  fi

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # Create initial config   
  msg2 "Creating config..."
  cp "${srcdir}/config" .config

  # https://bbs.archlinux.org/viewtopic.php?pid=1824594#p1824594
  sed -i -e 's/# CONFIG_PSI_DEFAULT_DISABLED is not set/CONFIG_PSI_DEFAULT_DISABLED=y/' ./.config

  # Optionally enable the MuQSS scheduler in kernel
  if [ -n "$_enable_muqss" ]; then
    msg2 "Enabling the MuQSS scheduler in kernel config..."
  else
    sed -i -e 's/CONFIG_SCHED_MUQSS=y/# CONFIG_SCHED_MUQSS is not set' ./.config
    msg2 "Disabling MuQSS scheduler support in kernel config..."
  fi

  # Optionally enable AMD CPU support (default is Intel only)
  if [ -n "$_amdcpu" ]; then
    msg2 "Enabling AMD CPU support in kernel config..."
    sed -i -e 's/# CONFIG_CPU_SUP_AMD is not set/CONFIG_CPU_SUP_AMD=y/' \
      -i -e 's/# CONFIG_X86_AMD_PLATFORM_DEVICE is not set/CONFIG_X86_AMD_PLATFORM_DEVICE=y/' \ 
      -i -e 's/# CONFIG_MICROCODE_AMD is not set/CONFIG_MICROCODE_AMD=y/' \
      -i -e 's/# CONFIG_KVM_AMD is not set/CONFIG_KVM_AMD=m/' \
      -i -e 's/# CONFIG_HW_RANDOM_AMD is not set/CONFIG_HW_RANDOM_AMD=m/' \
      -i -e 's/# CONFIG_PINCTRL_AMD is not set/CONFIG_PINCTRL_AMD=m/' \
      -i -e 's/# CONFIG_GPIO_AMDPT is not set/CONFIG_GPIO_AMDPT=m/' \
      -i -e 's/# CONFIG_AMD_IOMMU is not set/CONFIG_AMD_IOMMU=y/' \
      -i -e 's/# CONFIG_AMD_IOMMU_V2 is not set/CONFIG_AMD_IOMMU_V2=m/' \
      -i -e 's/# CONFIG_X86_POWERNOW_K8 is not set/CONFIG_X86_POWERNOW_K8=m/' \
      -i -e 's/# CONFIG_GPIO_AMDPT is not set/CONFIG_GPIO_AMDPT=m/' ./.config 
  else
    msg2 "Disabling AMD CPU support in kernel config..."
  fi

  # Detect what's actually "native"
  if [ -n "$_enable_native" ]; then
    case $(cat /proc/cpuinfo | grep "vendor_id" | uniq | awk {'print $3'}) in
      "GenuineIntel") magic=$(gcc -march=native -Q --help=target| grep march | awk {'print $2'} | awk '{print toupper($0)}' | awk '{print "M"$0}')
      sed -i -e "s|\# CONFIG_$magic is not set|CONFIG_$magic=y|" ./.config
      ;;
      "AuthenticAMD") sed -i -e 's/# CONFIG_MNATIVE is not set/CONFIG_MNATIVE=y/' ./.config ;;
    esac
    msg2 "Detected march=native and enabling it in kernel config..."
  fi
    
  # Optionally enable Reiser4 filesystem support
  if [ -n "$_reiser4" ]; then
    msg2 "Patching kernel with Reiser4 patches..."
    gzip -dc "$srcdir/${_reiser4patch}" | patch -p1
    cd "$srcdir/linux-$pkgver/fs/"
    rm -rf reiser4
    msg2 "Cloning the latest Reiser4 patches from git and replacing fs/reiser4 directory..."
    git clone https://github.com/edward6/reiser4/
    cd "../"
    msg2 "Enabling Reiser4 FS support in kernel config..."
    sed -i -e 's/# CONFIG_REISER4_FS is not set/CONFIG_REISER4_FS=y/' \
      -i -e '/# CONFIG_REISER4_DEBUG is not set/d' ./.config
  else
    msg2 "Disabling Reiser4 FS support in kernel config..."
    sed -i -e '/CONFIG_REISER4_FS=y/d' \
      -i -e '/# CONFIG_REISER4_DEBUG is not set/d' ./.config
  fi

  # Optionally disable NUMA
  if [ -n "$_disable_numa" ]; then
    msg2 "Disabling NUMA in kernel config..."
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
  else
    msg2 "Enabling NUMA in kernel config..."
    sed -i -e 's/# CONFIG_NUMA is not set/CONFIG_NUMA=y/' ./.config
  fi

  # Optionally enable Watchdog support (default is disabled)
  if [ -n "$_enable_watchdog" ]; then
    msg2 "Enabling watchdog support from kernel config..."
    sed -i -e 's/# CONFIG_WATCHDOG is not set/CONFIG_WATCHDOG=y/' \
      -i -e 's/# CONFIG_WATCHDOG_CORE is not set/CONFIG_WATCHDOG_CORE=y/' \
      -i -e 's/# CONFIG_RTC_DRV_DS1374_WDT is not set/CONFIG_RTC_DRV_DS1374_WDT=y/' \
      -i -e 's/# CONFIG_RTC_DRV_M41T80_WDT is not set/CONFIG_RTC_DRV_M41T80_WDT=y/' \
      -i -e 's/# CONFIG_COMEDI_ADDI_WATCHDOG is not set/CONFIG_COMEDI_ADDI_WATCHDOG=m/' \
      -i -e 's/# CONFIG_COMEDI_ADDI_APCI_1516 is not set/CONFIG_COMEDI_ADDI_APCI_1516=m/' \
      -i -e 's/# CONFIG_COMEDI_ADDI_APCI_1564 is not set/CONFIG_COMEDI_ADDI_APCI_1564=m/' \
      -i -e 's/# CONFIG_COMEDI_ADDI_APCI_2032 is not set/CONFIG_COMEDI_ADDI_APCI_2032=m/' \
      -i -e 's/# CONFIG_COMEDI_ADDI_APCI_2200 is not set/CONFIG_COMEDI_ADDI_APCI_2200=m/' \
      -i -e 's/# CONFIG_IPMI_WATCHDOG is not set/CONFIG_IPMI_WATCHDOG=m/' \
      -i -e 's/# CONFIG_ACPI_WATCHDOG is not set is not set/CONFIG_ACPI_WATCHDOG=y/' ./.config
  else
    msg2 "Disabling watchdog support in kernel config..."
  fi

  # Optionally disable the Nouveau driver
  if [ -n "$_disable_nouveau" ]; then
    msg2 "Disabling Nouveau from kernel config..."
    sed -i -e 's/CONFIG_DRM_NOUVEAU=m/# CONFIG_DRM_NOUVEAU is not set/' \
      -i -e '/CONFIG_NOUVEAU_DEBUG=5/d' \
      -i -e '/CONFIG_NOUVEAU_DEBUG_DEFAULT=3/d' \
      -i -e '/CONFIG_DRM_NOUVEAU_BACKLIGHT=y/d' \
      -i -e '/# CONFIG_NOUVEAU_DEBUG_MMU is not set/d' \
      -i -e '/CONFIG_DRM_NOUVEAU_BACKLIGHT=y/d' ./.config
  else
    msg2 "Enabling Nouveau driver support in kernel config..."
    sed -i -e 's/# CONFIG_DRM_NOUVEAU is not set/CONFIG_DRM_NOUVEAU=m/' ./.config
  fi

  if [ -n "$_dellconfig" ]; then
    msg2 "Using Dell XPS 15/Precision 55xx optimized kernel config..."
    cp "${srcdir}/config-dell" .config
  fi

  # https://github.com/graysky2/kernel_gcc_patch
  msg2 "Applying patch for more CPU specific optimization options..."
  patch -Np1 -i "$srcdir/kernel_gcc_patch-$_gcc_more_v/enable_additional_cpu_optimizations_for_gcc_v8.1+_kernel_v4.13+.patch"

  # do not run `make olddefconfig` as it sets default options
  yes "" | make config >/dev/null

  make -s kernelrelease > ../version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<../version)"

  [[ -z "$_makenconfig" ]] || make nconfig

  # Save .config file
  cat .config > "${startdir}/config.last"
}

build() {
  cd linux-${pkgver}
  make bzImage modules
}

_package() {
  pkgdesc="A Linux-ck based kernel and modules with the -ck1 patchset featuring MuQSS CPU scheduler v0.190 and the latest Reiser4 filesystem patches"
  #_Kpkgdesc="A Linux-ck based kernel and modules with the -ck1 patchset featuring MuQSS CPU scheduler v0.190 and the latest Reiser4 filesystem patches"
  #pkgdesc="${_Kpkgdesc}"
  depends=(coreutils linux-firmware kmod mkinitcpio)
  optdepends=(
  'crda: To set the correct wireless channels of your country' 
  'reiser4progs: Utilities for creating/checking/debugging Reiser4 filesystems'
  'dkms: To automatically update kernel modules on upgrades'
  'lz4: To compress the ramdisk with LZ4 compression'
  )
  provides=("linux-ck-reiser4=${pkgver}" "linux=${pkgver}")
  backup=("etc/mkinitcpio.d/$pkgbase.preset")
  install=linux.install

  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  cd linux-${pkgver}

  msg2 "Installing boot image..."
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
  install -Dm644 "$modulesdir/vmlinuz" "$pkgdir/boot/vmlinuz-$pkgbase"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # Set location for extramodules
  local extramodules="extramodules$_kernelname"
  local extradir="$pkgdir/usr/lib/modules/$extramodules"
  install -Dt "$extradir" -m644 ../version
  ln -sr "$extradir" "$modulesdir/extramodules"

  # Remove build and source build files
  rm "$modulesdir"/{source,build}

  msg2 "Creating hooks..."
  # sed expression for following substitutions
  local subst="
    s|%PKGBASE%|$pkgbase|g
    s|%KERNVER%|$kernver|g
    s|%EXTRAMODULES%|$extramodules|g
  "

  # hack to allow specifying an initially nonexisting install file
  sed "$subst" "$startdir/$install" > "$startdir/$install.pkg"
  true && install=$install.pkg

  # Create mkinitcpio preset and pacman hooks
  sed "$subst" ../linux.preset | install -Dm644 /dev/stdin \
    "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
  sed "$subst" ../60-linux.hook | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/60-$pkgbase.hook"
  sed "$subst" ../90-linux.hook | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/90-$pkgbase.hook"

  msg2 "Setting permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Headers for building modules for the ${pkgbase/linux/Linux} kernel"
  #_Hpkgdesc="Headers for building modules for the ${pkgbase/linux/Linux} kernel"
  #pkgdesc="${_Hpkgdesc}"
  depends=('linux-ck-reiser4')
  provides=("linux-ck-reiser4-headers=${pkgver}" "linux-headers=${pkgver}")

  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  cd linux-${pkgver}

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 Makefile .config Module.symvers System.map vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # Install objtool for external module building support
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # Install XFS and shmem for AUFS
  mkdir -p "$builddir"/{fs/xfs,mm}

  # Set temporary versioning
  mkdir "$builddir/.tmp_versions"

  msg2 "Installing linux headers..."
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

  msg2 "Removing unused architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg2 "Removing kernel documentation..."
  rm -r "$builddir/Documentation"

  msg2 "Deleting invalid symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg2 "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg2 "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libs (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libs (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Bins
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable bins
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  msg2 "Creating symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase-$pkgver"

  msg2 "Setting new permissions..."
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
