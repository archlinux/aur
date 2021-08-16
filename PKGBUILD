# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>

### BUILD OPTIONS
# Set the next two variables to ANYTHING that is not null to enable them

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.
# See, https://bugs.archlinux.org/task/31187
_NUMAdisable=y
#enable winesync
_winesync=y
### Set performance governor as default
_per_gov=
### Running with a 2000 HZ, 1000HZ or 500HZ tick rate
_2k_HZ_ticks=
_1k_HZ_ticks=y
_500_HZ_ticks=
### Enable protect file mappings under memory pressure
_mm_protect=y
### Enable Linux Random Number Generator
_lrng_enable=y
# Tweak kernel options prior to a build via nconfig
_makenconfig=
## Setting some security options
use_selinux=n
use_tomoyo=n
use_yama=n
use_apparmor=

# Only compile active modules to VASTLY reduce the number of modules built and
# the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD reads the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
_use_current=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-cacule-llvm
pkgname=("${pkgbase}" "${pkgbase}-headers")
pkgver=5.13.11
pkgrel=2
_gittag=v${pkgver%.*}-${pkgver##*.}
pkgdesc='Linux-CacULE Kernel by Hamad Marri and with some other patchsets with FULL LTO optimization'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/hamadmarri/cacule-cpu-scheduler"
license=('GPL2')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick' 'pahole' 'cpio' 'perl' 'tar' 'xz' 'clang' 'llvm' 'lld' 'python' 'llvm-libs')
options=('!strip')
_patchsource="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/5.13"
_caculepatches="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/CacULE"
source=(
    "https://cdn.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-${pkgver}.tar.xz"
    "config"
    "${_patchsource}/arch-patches-v5/0001-arch-patches.patch"
    "${_caculepatches}/v5.13/cacule-5.13.patch"
    "${_patchsource}/cpu-patches/0001-cpu-patches.patch"
    "${_patchsource}/futex-patches/0001-futex-resync-from-gitlab.collabora.com.patch"
    "${_patchsource}/futex2-xanmod-patches-v3/0001-futex2-resync-from-gitlab.collabora.com.patch"
    "${_patchsource}/winesync/5.13-winesync.patch"
    "${_patchsource}/xanmod-patches-v2/0001-xanmod-patches.patch"
    "${_patchsource}/zen-patches/0001-zen-patches.patch"
    "${_patchsource}/lqx-patches-v3/0001-lqx-patches.patch"
    "${_patchsource}/bfq-patches-v6/0001-bfq-patches.patch"
    "${_patchsource}/block-patches-v2/0001-block-patches.patch"
    "${_patchsource}/fixes-miscellaneous/0001-fixes-miscellaneous.patch"
    "${_patchsource}/bbr2-patches-v2/0001-bbr2-patches.patch"
    "${_patchsource}/btrfs-patches-v2/0001-btrfs-patches.patch"
    "${_patchsource}/android-patches/0001-android-export-symbold-and-enable-building-ashmem-an.patch"
    "${_patchsource}/pf-patches-v9/0001-pf-patches.patch"
    "${_patchsource}/lru-patches-v7/0001-lru-patches.patch"
    "${_patchsource}/ntfs3-patches-v2/0001-ntfs3-patches.patch"
    "${_patchsource}/lrng-patches/0001-lrng-patches-v2.patch"
    "${_patchsource}/security-patches/0001-security-patches.patch"
    "${_patchsource}/alsa-patches/0001-alsa-patches.patch"
    "${_patchsource}/zstd-upstream-patches/0001-zstd-upstream-patches.patch"
    "${_patchsource}/zstd-patches-v5/0001-zstd-patches.patch"
    "${_patchsource}/clearlinux-patches-v2/0001-clearlinux-patches.patch"
    "${_patchsource}/v4l2loopback-patches-v2/0001-v4l2loopback-patches.patch"
    "auto-cpu-optimization.sh"
  )
  BUILD_FLAGS=(
        LLVM=1
        LLVM_IAS=1
      )
export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd "${srcdir:?}/linux-${pkgver}" || (
    echo -e "\E[1;31mCan't cd to ${srcdir:?}/linux-${pkgver} directory! Prepare failed! \E[0m"
    exit 1
  )

  ### Setting version
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

    # Let's user choose microarchitecture optimization in GCC
    sh "${srcdir}"/auto-cpu-optimization.sh

      ### Optionally set tickrate to 2000HZ
        if [ -n "$_2k_HZ_ticks" ]; then
          echo "Setting tick rate to 2k..."
          scripts/config --disable CONFIG_HZ_300
          scripts/config --enable CONFIG_HZ_2000
          scripts/config --set-val CONFIG_HZ 2000
        fi

      ### Optionally set tickrate to 1000
         if [ -n "$_1k_HZ_ticks" ]; then
          echo "Setting tick rate to 1k..."
          scripts/config --disable CONFIG_HZ_300
          scripts/config --enable CONFIG_HZ_1000
          scripts/config --set-val CONFIG_HZ 1000
         fi

      ### Optionally set tickrate to 500HZ
        if [ -n "$_500_HZ_ticks" ]; then
          echo "Setting tick rate to 500HZ..."
          scripts/config --disable CONFIG_HZ_300
          scripts/config --enable CONFIG_HZ_500
          scripts/config --set-val CONFIG_HZ 500
        fi

    ### Optionally disable NUMA for 64-bit kernels only
      # (x86 kernels do not support NUMA)
        if [ -n "$_NUMAdisable" ]; then
          echo "Disabling NUMA from kernel config..."
          scripts/config --disable CONFIG_NUMA
        fi

        if [ -n "$_winesync" ]; then
          echo "Enable winesync support"
          scripts/config --module CONFIG_WINESYNC
        fi

    ### Set performance governor
        if [ -n "$_per_gov" ]; then
          echo "Setting performance governor..."
          scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
          scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
          echo "Disabling uneeded governors..."
          scripts/config --enable CONFIG_CPU_FREQ_GOV_ONDEMAND
          scripts/config --disable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
          scripts/config --disable CONFIG_CPU_FREQ_GOV_USERSPACE
          scripts/config --disable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
        fi

      ### Enable protect file mappings under memory pressure
          if [ -n "$_mm_protect" ]; then
            echo "Enabling protect file mappings under memory pressure..."
            scripts/config --enable CONFIG_UNEVICTABLE_FILE
            scripts/config --set-val CONFIG_UNEVICTABLE_FILE_KBYTES_LOW 262144
            scripts/config --set-val CONFIG_UNEVICTABLE_FILE_KBYTES_MIN 131072
            scripts/config --enable CONFIG_UNEVICTABLE_ANON
            scripts/config --set-val CONFIG_UNEVICTABLE_ANON_KBYTES_LOW 65536
            scripts/config --set-val CONFIG_UNEVICTABLE_ANON_KBYTES_MIN 32768
          fi

          if [ "$use_selinux" = "n" ]; then
            echo "Disabling SELinux..."
            scripts/config --disable CONFIG_SECURITY_SELINUX
          fi

          if [ "$use_tomoyo" = "n" ]; then
            echo "Disabling TOMOYO..."
            scripts/config --disable CONFIG_SECURITY_TOMOYO
          fi

          if [ "$use_apparmor" = "n" ]; then
            echo "Disabling AppArmor..."
            scripts/config --disable CONFIG_SECURITY_APPARMOR
            scripts/config --set-str CONFIG_LSM lockdown,yama,integrity
          fi

          if [ "$use_yama" = "n" ]; then
            echo "Disabling YAMA..."
            scripts/config --disable CONFIG_SECURITY_YAMA
            scripts/config --set-str CONFIG_LSM lockdown,integrity,apparmor
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

          echo "Enable Anbox"
          scripts/config --module  CONFIG_ASHMEM
          scripts/config --enable  CONFIG_ANDROID_BINDER_IPC_SELFTEST
          scripts/config --enable  CONFIG_ANDROID
          scripts/config --enable  CONFIG_ANDROID_BINDER_IPC
          scripts/config --enable  CONFIG_ANDROID_BINDERFS
          scripts/config --set-str CONFIG_ANDROID_BINDER_DEVICES binder,hwbinder,vndbinder
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

    make ${BUILD_FLAGS[*]} olddefconfig

    make ${BUILD_FLAGS[*]} -s kernelrelease > version
    echo "Prepared $pkgbase version $(<version)"

    [[ -z "$_makenconfig" ]] || make ${BUILD_FLAGS[*]} nconfig

    ### Save configuration for later reuse
    cp -Tf ./.config "${startdir}/config-${pkgver}-${pkgrel}${pkgbase#linux}"
}

build() {
  cd "${srcdir:?}/linux-${pkgver}" || (
    echo -e "\E[1;31mCan't cd to ${srcdir:?}/linux-${pkgver} directory! Build failed! \E[0m"
    exit 1
  )
    make ${BUILD_FLAGS[*]} all
}

package_linux-cacule-llvm() {
  pkgdesc="The ${pkgdesc} and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=('crda: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)

    cd "${srcdir:?}/linux-${pkgver}" || (
      echo -e "\E[1;31mCan't cd to ${srcdir:?}/linux-${pkgver} directory! Package linux kernel failed! \E[0m"
      exit 1
    )

    local kernver="$(<version)"
    local modulesdir="${pkgdir:?}/usr/lib/modules/$kernver"

    echo "Installing boot image..."
    # systemd expects to find the kernel here to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 "$(make -s image_name)" "${modulesdir}/vmlinuz"

    # Used by mkinitcpio to name the kernel
    echo "${pkgbase}" | install -Dm644 /dev/stdin "${modulesdir}/pkgbase"

    echo "Installing modules..."
    make INSTALL_MOD_PATH="${pkgdir:?}/usr" INSTALL_MOD_STRIP=1 modules_install

    # remove build and source links
    rm "${modulesdir}/"{source,build}
}

package_linux-cacule-llvm-headers() {

  pkgdesc="Headers and scripts for building modules for the ${pkgdesc}"
  depends=("linux-cacule-llvm=${pkgver}" "pahole")

  cd "${srcdir:?}/linux-${pkgver}" || (
    echo -e "\E[1;31mCan't cd to ${srcdir:?}/linux-${pkgver} directory! Package linux headers failed! \E[0m"
    exit 1
  )

  local builddir="${pkgdir:?}/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "${builddir}" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "${builddir}/kernel" -m644 kernel/Makefile
  install -Dt "${builddir}/arch/x86" -m644 arch/x86/Makefile
  cp -t "${builddir}" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "${builddir}/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "${builddir}"/{fs/xfs,mm}

  echo "Installing headers..."
  cp -t "${builddir}" -a include
  cp -t "${builddir}/arch/x86" -a arch/x86/include
  install -Dt "${builddir}/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "${builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${builddir}/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "${builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "${builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "${builddir}/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "${builddir}/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "${builddir}"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "${builddir}/Documentation"

  echo "Removing broken symlinks..."
  find -L "${builddir}" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "${builddir}" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
    application/x-sharedlib\;*) # Libraries (.so)
      strip -v "${STRIP_SHARED}" "$file" ;;
    application/x-archive\;*) # Libraries (.a)
      strip -v "${STRIP_STATIC}" "$file" ;;
    application/x-executable\;*) # Binaries
      strip -v "${STRIP_BINARIES}" "$file" ;;
    application/x-pie-executable\;*) # Relocatable binaries
      strip -v "${STRIP_SHARED}" "$file" ;;
    esac
  done < <(find "${builddir}" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Stripping vmlinux..."
  strip -v "${STRIP_STATIC}" "${builddir}/vmlinux"

  echo "Adding symlink..."
  mkdir -p "${pkgdir:?}/usr/src"
  ln -sr "${builddir}" "${pkgdir:?}/usr/src/${pkgbase}"

}

md5sums=('89020a90124a6798054a03c7a2ead059'
         '5fef4ec9c05a8c360f84da843e90c0f3'
         '9f9b916ed39dc125db45d0bff672f4c0'
         '078da517ec2d54283af81d7da3af671a'
         '7640a753a7803248543675a6edc75e08'
         '85f4be6562ee033b83814353a12b61bd'
         '3ec9a8784a9e73462def2e9c33de9a1e'
         '9573b92353399343db8a691c9b208300'
         'e15a64663e6221ea40b02aeb8517e70a'
         '1217799f33d6ba822152a0e2fb6f2e34'
         '31c897f53b91f98532321cd24928c0d7'
         '698d661fa23611933146b83e0fa9cade'
         '4f9e72e7edb909da5cd650afe13aadb6'
         '9bbbd88f0303ccd59064648eaaf80edd'
         '1bd37d8e71b2a7aae8ebd2853a08f445'
         '65a4399a10b2abd0f327145d479db12d'
         '81f27f12e20971c7d7fc3a53ffb6842c'
         'f9b3c2263204ebfae89f29b83278b54b'
         'e84f0dadb9e7487fac39541c5bd85d7a'
         'b6623f818462d08b03fdc1b573c90e9f'
         '2b2be59407dd342f1cea80602a93b6c0'
         '9977ba0e159416108217a45438ebebb4'
         '92e9db1a7777666a1e6353b4760f1275'
         '9e5114dba6da65e8d444aa225b109a21'
         '2aa4d3664fc16dac2f18fe8c22ba1df1'
         '7dd37a74d7926f4c5ae3b3f76d7172a2'
         '08590776013d05bc7a96ef5557c54200'
         '7cf0b5c39d16da18451d1e7e7523d992')
