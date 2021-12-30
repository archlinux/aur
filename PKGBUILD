# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>


### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=y

_enable_gcc_more_v="y"
# Optionally select a sub architecture by number or leave blank which will
# require user interaction during the build. Note that the generic (default)
# option is 36.
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
#  13. AMD Zen 3 (MZEN3)
#  14. Intel P4 / older Netburst based Xeon (MPSC)
#  15. Intel Core 2 (MCORE2)
#  16. Intel Atom (MATOM)
#  17. Intel Nehalem (MNEHALEM)
#  18. Intel Westmere (MWESTMERE)
#  19. Intel Silvermont (MSILVERMONT)
#  20. Intel Goldmont (MGOLDMONT)
#  21. Intel Goldmont Plus (MGOLDMONTPLUS)
#  22. Intel Sandy Bridge (MSANDYBRIDGE)
#  23. Intel Ivy Bridge (MIVYBRIDGE)
#  24. Intel Haswell (MHASWELL)
#  25. Intel Broadwell (MBROADWELL)
#  26. Intel Skylake (MSKYLAKE)
#  27. Intel Skylake X (MSKYLAKEX)
#  28. Intel Cannon Lake (MCANNONLAKE)
#  29. Intel Ice Lake (MICELAKE)
#  30. Intel Cascade Lake (MCASCADELAKE)
#  31. Intel Cooper Lake (MCOOPERLAKE)
#  32. Intel Tiger Lake (MTIGERLAKE)
#  33. Intel Sapphire Rapids (MSAPPHIRERAPIDS)
#  34. Intel Rocket Lake (MROCKETLAKE)
#  35. Intel Alder Lake (MALDERLAKE)
#  36. Generic-x86-64 (GENERIC_CPU)
#  37. Generic-x86-64-v2 (GENERIC_CPU2)
#  38. Generic-x86-64-v3 (GENERIC_CPU3)
#  39. Generic-x86-64-v4 (GENERIC_CPU4)
#  40. Intel-Native optimizations autodetected by GCC (MNATIVE_INTEL)
#  41. AMD-Native optimizations autodetected by GCC (MNATIVE_AMD)
_subarch=36

# Only compile active modules to VASTLY reduce the number of modules built and
# the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD reads the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=y

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
_use_current=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-mini
pkgver=5.15.12
pkgrel=1
pkgdesc='Linux kernel and modules with minimal configuration'

url="https://www.kernel.org/"
arch=(x86_64)
license=(GPL2)
makedepends=(
  'bc' 'kmod' 'libelf' 'pahole' 'cpio' 'perl' 'tar' 'xz'
  'xmlto' 'python-sphinx' 'python-sphinx_rtd_theme' 'graphviz' 'imagemagick'
  'git'
)
options=('!strip')
_gcc_more_v='20211114'
source=(
  "https://www.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-${pkgver:0:4}.tar".{xz,sign}
  "https://cdn.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/patch-${pkgver}.xz"
  "more-uarches-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_compiler_patch/archive/$_gcc_more_v.tar.gz"
  config         # the main kernel config file
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30'  # Jan Alexander Steffens (heftig)
)
b2sums=('3921274b23f7938abdf3ed9334534b4581e13d7484303d3a5280eddb038999aaa8b836666a487472d9c4a219af0f06b9fecccaf348fb5510ab8762f4ef4b7e83'
        'SKIP'
        '8ac09e5cff7465641818e24e846a014bc936e2e2f61b7d1973319d5665d45acd6be24d28430173b5646e80cf67351044165b949575baf76ccdfb46ae34fc1468'
        '534091fb5034226d48f18da2114305860e67ee49a1d726b049a240ce61df83e840a9a255e5b8fa9279ec07dd69fb0aea6e2e48962792c2b5367db577a4423d8d'
        '28540af4732569d0638c4b2525cbc3701aec60330d8ac4b081a62145a20226725c1444521cd750ae9cd18ff0f469ce40f8db451588ba0d85c6e0d388f1d82c3b')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  # https://bbs.archlinux.org/viewtopic.php?id=26511
  if [[ ! -f "$srcdir/patch-${pkgver}" ]]; then
    xz -dc "$SRCDEST/patch-${pkgver}.xz" > "patch-${pkgver}"
  fi
  cd linux-${pkgver:0:4}

  ### Add upstream patches
        echo "Add upstream patches"
        patch -Np1 -i ../patch-${pkgver}

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

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
  make olddefconfig


### Enable extra stuff from arch kernel
        echo "Enable extra stuff from arch kernel..."

        # General setup
        scripts/config --enable IKCONFIG \
                       --enable IKCONFIG_PROC \
                       --enable-after IKCONFIG IKCONFIG_PROC \
                       --undefine RT_GROUP_SCHED

        # Power management and ACPI options
        scripts/config --enable ACPI_REV_OVERRIDE_POSSIBLE \
                       --enable ACPI_TABLE_UPGRADE

        # Enable loadable module support
        scripts/config --undefine MODULE_SIG_FORCE \
                       --enable MODULE_COMPRESS \
                       --enable-after MODULE_COMPRESS MODULE_COMPRESS_XZ

        # Networking support
        scripts/config --enable NETFILTER_INGRESS

        # Device Drivers
        scripts/config --enable FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER \
                       --enable DELL_SMBIOS_SMM \
                       --enable NET_VENDOR_AQUANTIA \
                       --module PATA_JMICRON \
                       --enable-after SOUND SOUND_OSS_CORE \
                       --enable SND_OSSEMUL \
                       --module-after SND_OSSEMUL SND_MIXER_OSS \
                       --module-after SND_MIXER_OSS SND_PCM_OSS \
                       --enable-after SND_PCM_OSS SND_PCM_OSS_PLUGINS \
                       --module AGP --module-after AGP AGP_INTEL --module-after AGP_INTEL AGP_VIA
                       # fix for FS#72645 FS#72658
        scripts/config --undefine SYSFB_SIMPLEFB \
                       --enable FB_VESA \
                       --enable FB_EFI \
                       --enable FB_MODE_HELPERS \
                       --enable FB_TILEBLITTING

        # Kernel hacking -> Compile-time checks and compiler options -> Make section mismatch errors non-fatal
        scripts/config --enable SECTION_MISMATCH_WARN_ONLY

        # File systems
        scripts/config --module NTFS3_FS \
                       --enable NTFS3_LZX_XPRESS \
                       --enable NTFS3_FS_POSIX_ACL

        # Security options
        scripts/config --enable SECURITY_SELINUX \
                       --enable SECURITY_SELINUX_BOOTPARAM \
                       --enable-after SECURITY_SELINUX SECURITY_SELINUX_BOOTPARAM \
                       --enable SECURITY_SMACK \
                       --enable-after SECURITY_SMACK SECURITY_SMACK_BRINGUP \
                       --enable-after SECURITY_SMACK_BRINGUP SECURITY_SMACK_NETFILTER \
                       --enable-after SECURITY_SMACK_NETFILTER SECURITY_SMACK_APPEND_SIGNALS \
                       --enable SECURITY_TOMOYO \
                       --enable SECURITY_APPARMOR \
                       --enable SECURITY_YAMA

        # Library routines
        scripts/config --enable FONT_TER16x32

        make olddefconfig

    	### Patch source to unlock additional gcc CPU optimizations
        # https://github.com/graysky2/kernel_gcc_patch
        if [ "${_enable_gcc_more_v}" = "y" ]; then
        echo "Patching to enable GCC optimization for other uarchs..."
        patch -Np1 -i "$srcdir/kernel_compiler_patch-$_gcc_more_v/more-uarches-for-kernel-5.15+.patch"
        fi

		### Get kernel version
        if [ "${_enable_gcc_more_v}" = "y" ] || [ -n "${_subarch}" ]; then
        yes "$_subarch" | make oldconfig
        else
        make prepare
        fi


        ### Prepared version
		make -s kernelrelease > version
		echo "Prepared $pkgbase version $(<version)"


### Optionally use running kernel's config
    # code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
    if [ -n "$_use_current" ]; then
        if [[ -s /proc/config.gz ]]; then
            echo "Extracting config from /proc/config.gz..."
            # modprobe configs
            zcat /proc/config.gz > ./.config
        else
            warning "Your kernel was not compiled with IKCONFIG_PROC!"
            warning "You cannot read the current config!"
            warning "Aborting!"
            exit
        fi
    fi

    ### Optionally load needed modules for the make localmodconfig
        # See https://aur.archlinux.org/packages/modprobed-db
        if [ -n "$_localmodcfg" ]; then
          if [ -e $HOME/.config/modprobed.db ]; then
            echo "Running Steven Rostedt's make localmodconfig now"
            make LSMOD=$HOME/.config/modprobed.db localmodconfig
          else
            echo "No modprobed.db data found"
            exit
          fi
        fi

    ### do not run `make olddefconfig` as it sets default options
        yes "" | make config >/dev/null

    ### Running make nconfig

        [[ -z "$_makenconfig" ]] || make nconfig

    ### Save configuration for later reuse

        cp -Tf ./.config "${startdir}/config-${pkgver}-${pkgrel}${pkgbase#linux}"


}

build() {
  cd linux-${pkgver:0:4}
  make all
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=('coreutils' 'kmod' 'initramfs')
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices'
              'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  replaces=(virtualbox-guest-modules-arch wireguard-arch)

  cd linux-${pkgver:0:4}
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=('pahole')

  cd linux-${pkgver:0:4}
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

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

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
