# Contributor: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Maintainer: ptr1337 <admin@ptr1337.dev>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.
# See, https://bugs.archlinux.org/task/31187
_NUMAdisable=y
# Enable fsync
_fsync=y
#enable futex2
_futex2=
#enable winesync
_winesync=
### Set performance governor as default
_per_gov=y
### Disable Deadline I/O scheduler
_deadline_disable=y
### Disable Kyber I/O scheduler
_kyber_disable=y
### Running with a 2000 HZ, 1000HZ or 500HZ tick rate
_2k_HZ_ticks=
_1k_HZ_ticks=
_750_HZ_ticks=y
_mm_protect=y
_lrng_enable=
## Apply Kernel automatic Optimization
_use_optimization=y
## Apply Kernel Optimization selecting
_use_optimization_select=

## compiling with LLVM/LTO
_use_llvm_lto=

# Compile ONLY used modules to VASTLYreduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
_use_current=

### Do not edit below this line unless you know what you're doing

pkgbase=linux-cacule-rc
# pkgname=('linux-cacule' linux-cacule-headers)
_major=5.15
#_minor=1
#_minorc=$((_minor+1))
_rcver=rc3
pkgver=${_major}.${_rcver}
#_stable=${_major}.${_minor}
_stablerc=${_major}-${_rcver}
_srcname=linux-${_stablerc}
pkgrel=1
pkgdesc='Linux-CacULE Kernel-RC by Hamad Marri and with some other patchsets'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/hamadmarri/cacule-cpu-scheduler"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick' 'pahole' 'cpio' 'perl' 'tar' 'xz')
_caculepatches="https://raw.githubusercontent.com/ptr1337/kernel-patches/master/CacULE"
_patchsource="https://raw.githubusercontent.com/ptr1337/kernel-patches/master/5.15"
source=("https://git.kernel.org/torvalds/t/linux-${_stablerc}.tar.gz"
        "config"
        "${_patchsource}/arch-patches/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_caculepatches}/v5.15/cacule-5.15.patch"
        "${_patchsource}/misc/0007-v5.15-fsync.patch"
        "${_patchsource}/misc/0003-glitched-cfs.patch"
        "${_patchsource}/misc/more-uarches-for-kernel-5.15+.patch"
        "${_patchsource}/misc/le9ec-5.15-rc2.patch"
        "${_patchsource}/misc/0002-clear-patches.patch"
        "${_patchsource}/misc/amd/0006-amd-cppc.patch"
        "${_patchsource}/misc/0001-zstd-upstream-patches.patch"
        "${_patchsource}/misc/0002-init-Kconfig-enable-O3-for-all-arches.patch"
        "${_patchsource}/0001-bbr2.patch"
        "auto-cpu-optimization.sh"
      )
if [ -n "$_use_llvm_lto" ]; then
  BUILD_FLAGS=(
        LLVM=1
        LLVM_IAS=1
      )
fi
export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd $_srcname

    ### Setting version
        echo "Setting version..."
        sed -e "/^EXTRAVERSION =/s/=.*/=/" -i Makefile
        scripts/setlocalversion --save-scmversion
        echo "-$pkgrel" > localversion.10-pkgrel
        echo "${pkgbase#linux}" > localversion.20-pkgname

    ### Patching sources
        local src
        for src in "${source[@]}"; do
            src="${src%%::*}"
            src="${src##*/}"
            [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
        done

    ### Setting config
        echo "Setting config..."
        cp ../config .config


    ### Microarchitecture Optimization (GCC/CLANG)
      if [ -n "$_use_optimization" ]; then
       sh "${srcdir}"/auto-cpu-optimization.sh
      fi

      if [ -n "$_use_optimization_select" ]; then
        source "${startdir}"/configure

        cpu_arch
      fi

              ### Enable Linux Random Number Generator
          	if [ -n "$_lrng_enable" ]; then
          		echo "Enabling Linux Random Number Generator ..."
          		scripts/config --enable CONFIG_LRNG
          		scripts/config --disable CONFIG_LRNG_OVERSAMPLE_ENTROPY_SOURCES
          		scripts/config --set-val CONFIG_CONFIG_LRNG_OVERSAMPLE_ES_BITS 0
          		scripts/config --set-val CONFIG_LRNG_SEED_BUFFER_INIT_ADD_BITS 0
          		scripts/config --enable CONFIG_LRNG_CONTINUOUS_COMPRESSION_ENABLED
          		scripts/config --disable CONFIG_LRNG_CONTINUOUS_COMPRESSION_DISABLED
          		scripts/config --disable CONFIG_LRNG_SWITCHABLE_CONTINUOUS_COMPRESSION
          		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_32
          		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_256
          		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_512
          		scripts/config --enable CONFIG_LRNG_COLLECTION_SIZE_1024
          		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_2048
          		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_4096
          		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_8192
          		scripts/config --set-val CONFIG_LRNG_COLLECTION_SIZE 1024
          		scripts/config --disable CONFIG_LRNG_HEALTH_TESTS
          		scripts/config --set-val CONFIG_LRNG_RCT_CUTOFF 31
          		scripts/config --set-val CONFIG_LRNG_APT_CUTOFF 325
          		scripts/config --set-val CONFIG_LRNG_IRQ_ENTROPY_RATE 256
          		scripts/config --enable CONFIG_LRNG_JENT
          		scripts/config --set-val CONFIG_LRNG_JENT_ENTROPY_RATE 16
          		scripts/config --set-val CONFIG_LRNG_CPU_ENTROPY_RATE 8
          		scripts/config --disable CONFIG_LRNG_DRNG_SWITCH
          		scripts/config --disable CONFIG_LRNG_DRBG
          		scripts/config --disable CONFIG_LRNG_TESTING_MENU
          		scripts/config --disable CONFIG_LRNG_SELFTEST
          	fi
              echo "Disabling TCP_CONG_CUBIC..."
              scripts/config --module CONFIG_TCP_CONG_CUBIC
              scripts/config --disable CONFIG_DEFAULT_CUBIC
              echo "Enabling TCP_CONG_BBR2..."
              scripts/config --enable CONFIG_TCP_CONG_BBR2
              scripts/config --enable CONFIG_DEFAULT_BBR2
              scripts/config --set-str CONFIG_DEFAULT_TCP_CONG bbr2
              echo "Enable VHBA-Module"
              scripts/config --module CONFIG_VHBA
              ### Enabling ZSTD COMPRESSION ##
              echo "Set module compression to ZSTD"
              scripts/config --enable CONFIG_MODULE_COMPRESS
              scripts/config --disable CONFIG_MODULE_COMPRESS_XZ
              scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD
              scripts/config --set-val CONFIG_MODULE_COMPRESS_ZSTD_LEVEL 19
              scripts/config --disable CONFIG_KERNEL_ZSTD_LEVEL_ULTRA
              echo "Enabling KBUILD_CFLAGS -O3..."
              scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
              scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3

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
            make ${BUILD_FLAGS[*]} LSMOD=$HOME/.config/modprobed.db localmodconfig
        else
            echo "No modprobed.db data found"
            exit
        fi
    fi

    make ${BUILD_FLAGS[*]} olddefconfig

    make ${BUILD_FLAGS[*]} -s kernelrelease > version
    echo "Prepared $pkgbase version $(<version)"

    [[ -z "$_makenconfig" ]] || make ${BUILD_FLAGS[*]} nconfig

    ### Save configuration for later reuse
    cp -Tf ./.config "${startdir}/config-${pkgver}-${pkgrel}${pkgbase#linux}"

}

build() {
  cd $_srcname

make ${BUILD_FLAGS[*]} all
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=('crda: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')


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
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
    depends=('linux-cacule-rt-rc' 'pahole')

  cd $_srcname
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


md5sums=('f996cb6694304111742d60480aafd522'
         'aed2897ca8daff3174f1e34f739d21c2'
         'cf26387aadf2a90428350ac246b070c9'
         '0783aae3228c2a709cbd7afc86717ebe'
         '6236a665dd6c93c5de76c1c658c99910'
         'd3ffe87474459e33c901f6141a047c95'
         'ff4b20b981d9ae0bdda68f012b03e756'
         'b5aca6a351809cd67c039ae547fc6ec4'
         '31a83ad2d5c11e560c7bfdfd59659c84'
         '430972ae1e936f99d8dc2a1f4fdaf774'
         '74db4069a1c3985e5de43cf28f44e693'
         'ceb9020f754c9a0c3f526b38abc714dd'
         '422fe01f2e2b1ba1c2b9174fa1a75e40'
         '21c98f19e883879dd3336c1fa143fd31')
