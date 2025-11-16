# Maintainer: micros24 <jasperjano.ph at protonmail dot com>
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

##
## The following variables can be customized at build time. Use env or export to change at your wish
##
##   Example: env _microarchitecture=98 _use_numa=n _use_tracers=n makepkg -sc
##
## Look inside 'choose-gcc-optimization.sh' to choose your microarchitecture
## Valid numbers between: 0 to 99
## Default is: 0 => generic
## Good option if your package is for one machine: 98 (Intel native) or 99 (AMD native)
if [ -z ${_microarchitecture+x} ]; then
  _microarchitecture=0
fi

## Disable NUMA since most users do not have multiple processors. Breaks CUDA/NvEnc.
## Archlinux and Xanmod enable it by default.
## Set variable "_use_numa" to: n to disable (possibly increase performance)
##                             y to enable  (stock default)
if [ -z ${_use_numa+x} ]; then
  _use_numa=n
fi

## Since upstream disabled CONFIG_STACK_TRACER (limits debugging and analyzing of the kernel)
## you can enable them setting this option. Caution, because they have an impact in performance.
## Stock Archlinux has this enabled. 
## Set variable "_use_tracers" to: n to disable (possibly increase performance, XanMod default)
##                                y to enable  (Archlinux default)
if [ -z ${_use_tracers+x} ]; then
  _use_tracers=y
fi

# Unique compiler supported upstream is GCC
## Choose between GCC and CLANG config (default is GCC)
## Use the environment variable "_compiler=clang"
if [ "${_compiler}" = "clang" ]; then
  _compiler_flags="CC=clang HOSTCC=clang LLVM=1 LLVM_IAS=1"
fi

# Choose between the 3 main configs for stable branch. Default x86-64-v1 which use CONFIG_GENERIC_CPU2:
# Possible values: config_x86-64-v2 (default) / config_x86-64-v3 / config_x86-64-v4
# This will be overwritten by selecting any option in microarchitecture script
# Source files: https://github.com/xanmod/linux/tree/5.17/CONFIGS/xanmod/gcc
#if [ -z ${_config+x} ]; then
  _config=config
#fi

# Compress modules with ZSTD (to save disk space)
if [ -z ${_compress_modules+x} ]; then
  _compress_modules=n
fi

# Compile ONLY used modules to VASTLY reduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
if [ -z ${_localmodcfg} ]; then
  _localmodcfg=n
fi

# Set the hertz of the tickrate (1000, 500, 300, 100)
if [ -z ${_tickrate_HZ+x} ]; then
  _tickrate_HZ=500
fi

# Set the tickrate handling between (tickless, idle, constant)
if [ -z ${_tickrate+x} ]; then
  _tickrate=tickless
fi

# Set the preemption model (preemptible, voluntary, server)
if [ -z ${_preemptmodel+x} ]; then
  _preemptmodel=preemptible
fi

# Use O3 (y, n)
if [ -z ${_use_O3+x} ]; then
  _use_O3=y
fi

# Tweak kernel options prior to a build via nconfig
if [ -z ${_makenconfig} ]; then
  _makenconfig=n
fi

### IMPORTANT: Do no edit below this line unless you know what you're doing
pkgbase=linux-xanmod-bore
_major=6.17
pkgver=${_major}.8
_branch=6.x
xanmod=1
_revision=
_sf_branch=main
pkgrel=${xanmod}
pkgdesc='Linux Xanmod (Stable) with BORE CPU scheduler and tickrate customizations'
url="http://www.xanmod.org/"
arch=('x86_64')
license=(GPL2)
makedepends=(
  bc
  cpio
  gettext
  libelf
  pahole
  perl
  python
  tar
  xz
)
if [ "${_compiler}" = "clang" ]; then
  makedepends+=(clang llvm lld)
fi
options=('!strip')
_srcname="linux-${pkgver}-xanmod${xanmod}"
source=("https://cdn.kernel.org/pub/linux/kernel/v${_branch}/linux-${_major}.tar."{xz,sign}
        "patch-${pkgver}-xanmod${xanmod}${_revision}.xz::https://sourceforge.net/projects/xanmod/files/releases/${_sf_branch}/${pkgver}-xanmod${xanmod}${_revision}/patch-${pkgver}-xanmod${xanmod}.xz"
        choose-gcc-optimization.sh
        "https://raw.githubusercontent.com/micros24/linux-xanmod-bore/${_major}/0001-bore.patch"
        "https://raw.githubusercontent.com/micros24/linux-xanmod-bore/${_major}/0002-prefer-the-previous-cpu-for-wakeup-v3.patch"
        "https://raw.githubusercontent.com/micros24/linux-xanmod-bore/${_major}/0003-glitched-cfs.patch"
        "https://raw.githubusercontent.com/micros24/linux-xanmod-bore/${_major}/0004-glitched-eevdf-additions.patch"
        "https://raw.githubusercontent.com/micros24/linux-xanmod-bore/${_major}/0005-o3-optimization.patch"
)
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

# Archlinux patches
_commit="ec9e9a4219fe221dec93fa16fddbe44a34933d8d"
_patches=()
for _patch in ${_patches[@]}; do
    source+=("${_patch}::https://raw.githubusercontent.com/archlinux/svntogit-packages/${_commit}/trunk/${_patch}")
done
sha256sums=('9b607166a1c999d8326098121222feb080a20a3253975fcdfa2de96ba7f757a7' # kernel
            'SKIP'                                                             # kernel signature
            'dba37b97a4b11ea5f919b2ae69921a4fab2c6b949f400982f74643932f273cf7' # xanmod patch
            'a8b38eb482eb685944757182c4886404abc12703e5e56ec39c7d61298d17d71f' # choose-gcc-optimization.sh
            '72523a25fe6d53bcbfad2025c86f01846e690ebbf3a00e1ec8f2bec4fe38e5bb' # 0001-bore.patch
            '7aee0975e5f17c18c4e99dd1f88a45c9b311085e6560bb6ed6d12ede21cf1691' # 0002-prefer-the-previous-cpu-for-wakeup-v3.patch
            '1f3258ce1842156fcc35ca4775f6ba50f08f8f339b8cfbc3395949bb0e368872' # 0003-glitched-cfs.patch
            '27b01429b372c00ba40bda4c9cdfaf45ec192f3a5018011bc5061ebbc28ee717' # 0004-glitched-eevdf-additions.patch
            '1c86e1667217d1278c72883769eb2c652a5d36fa36556cbeb6343fd235e8d26e' # 0005-o3-optimization.patch
)

export KBUILD_BUILD_HOST=${KBUILD_BUILD_HOST:-archlinux}
export KBUILD_BUILD_USER=${KBUILD_BUILD_USER:-makepkg}
export KBUILD_BUILD_TIMESTAMP=${KBUILD_BUILD_TIMESTAMP:-$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})}

prepare() {
  cd linux-${_major}

  # Apply Xanmod patch
  patch -Np1 -i ../patch-${pkgver}-xanmod${xanmod}${_revision}

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux-xanmod}" > localversion.20-pkgname

  # Archlinux patches
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # Applying configuration
  cp -vf CONFIGS/x86_64/${_config} .config

  # enable LTO_CLANG_THIN
  echo "Enabling LTO_CLANG_THIN..."
  if [ "${_compiler}" = "clang" ]; then
    scripts/config --disable LTO_CLANG_FULL \
                   --disable LTO_NONE \
                   --enable LTO \
                   --enable LTO_CLANG \
                   --enable ARCH_SUPPORTS_LTO_CLANG \
                   --enable ARCH_SUPPORTS_LTO_CLANG_THIN \
                   --enable HAS_LTO_CLANG \
                   --enable LTO_CLANG_THIN 
  fi

  # Disable features not needed for desktop use
  echo "Disabling features not needed for desktop use..."
  scripts/config --disable X86_EXTENDED_PLATFORM \
                 --disable BLK_DEBUG_FS \
                 --disable MEMORY_HOTPLUG \
                 --disable CONFIG_ANDROID_BINDER_IPC \
                 --disable ACPI_DEBUGGER

  # Setting features for desktop use
  echo "Setting features for desktop use..."
  scripts/config --set-val CONFIG_BLK_DEV_LOOP_MIN_COUNT 0 \
                 --enable SCHED_BORE

  # Setting HZ tick rate
  echo "Setting Tickrate HZ..."
  if [ "$_tickrate_HZ" = "1000" ]; then
    scripts/config --disable HZ_250 \
                   --enable HZ_1000
  elif [ "$_tickrate_HZ" = "500" ]; then
    scripts/config --disable HZ_250 \
                   --enable HZ_500
  elif [ "$_tickrate_HZ" = "250" ]; then
    scripts/config --disable HZ_250 \
                   --enable HZ_300
  elif [ "$_tickrate_HZ" = "100" ]; then
    scripts/config --disable HZ_250 \
                   --enable HZ_100
  fi

  # Selecting tick type
  echo "Setting tick type..."
  if [ "$_tickrate" = "tickless" ]; then
    scripts/config --disable HZ_PERIODIC \
                   --disable NO_HZ_IDLE \
                   --disable CONTEXT_TRACKING_FORCE \
                   --enable NO_HZ_FULL_NODEF \
                   --enable NO_HZ_FULL \
                   --enable NO_HZ \
                   --enable NO_HZ_COMMON \
                   --enable CONTEXT_TRACKING
  elif [ "$_tickrate" = "idle" ]; then
    scripts/config --disable HZ_PERIODIC \
                   --disable NO_HZ_FULL \
                   --enable NO_HZ_IDLE \
                   --enable NO_HZ \
                   --enable NO_HZ_COMMON
  elif [ "$_tickrate" = "constant" ]; then
    scripts/config --disable NO_HZ_IDLE \
                   --disable NO_HZ_FULL \
                   --disable NO_HZ \
                   --disable NO_HZ_COMMON \
                   --enable HZ_PERIODIC
  fi

  # Selecting Preemption model
  echo "Setting preemption model..."
  if [ "$_preemptmodel" = "preemptible" ]; then
    scripts/config --disable PREEMPT_NONE \
                   --disable PREEMPT_VOLUNTARY \
                   --enable PREEMPT_BUILD \
                   --enable PREEMPT \
                   --enable PREEMPT_COUNT \
                   --enable PREEMPTION \
                   --enable PREEMPT_DYNAMIC
  elif [ "$_preemptmodel" = "voluntary" ]; then
    scripts/config --disable PREEMPT_NONE \
                   --disable PREEMPT \
                   --disable PREEMPT_DYNAMIC \
                   --enable PREEMPT_BUILD \
                   --enable PREEMPT_VOLUNTARY \
                   --enable PREEMPT_COUNT \
                   --enable PREEMPTION
  elif [ "$_preemptmodel" = "server" ]; then
    scripts/config --disable PREEMPT_VOLUNTARY \
                   --disable PREEMPT \
                   --disable PREEMPTION \
                   --disable PREEMPT_DYNAMIC \
                   --enable PREEMPT_NONE_BUILD \
                   --enable PREEMPT_NONE
  fi

  # Setting O3
  if [ "$_use_O3" = "y" ]; then
    echo "Enabling O3..."
    scripts/config --disable CC_OPTIMIZE_FOR_PERFORMANCE \
                   --enable CC_OPTIMIZE_FOR_PERFORMANCE_O3
  fi

  # CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team
  scripts/config --enable STACK_VALIDATION

  # Enable IKCONFIG following Arch's philosophy
  scripts/config --enable IKCONFIG \
                 --enable IKCONFIG_PROC

  # Requested by Alexandre Frade to fix issues in python-gbinder
  scripts/config --enable ANDROID_BINDERFS
  scripts/config --enable ANDROID_BINDER_IPC

  # User set. See at the top of this file
  if [ "$_use_tracers" = "y" ]; then
    echo "Enabling CONFIG_FTRACE..."
    scripts/config --enable FTRACE \
                   --enable FUNCTION_TRACER \
                   --enable STACK_TRACER
  fi

  # Disabling NUMA
  if [ "$_use_numa" = "n" ]; then
    echo "Disabling NUMA..."
    scripts/config --disable NUMA \
                   --disable AMD_NUMA \
                   --disable X86_64_ACPI_NUMA \
                   --disable NODES_SPAN_OTHER_NODES \
                   --disable NUMA_EMU \
                   --disable USE_PERCPU_NUMA_NODE_ID \
                   --disable ACPI_NUMA \
                   --disable ARCH_SUPPORTS_NUMA_BALANCING \
                   --disable NODES_SHIFT \
                   --undefine NODES_SHIFT \
                   --disable NEED_MULTIPLE_NODES \
                   --disable NUMA_BALANCING \
                   --disable NUMA_BALANCING_DEFAULT_ENABLED
  fi

  # Compress modules by default (following Arch's kernel)
  if [ "$_compress_modules" = "y" ]; then
    scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD
  fi

## Use Arch Wiki TOMOYO configuration: https://wiki.archlinux.org/title/TOMOYO_Linux#Installation_2
msg2 "Replacing Debian TOMOYO configuration with upstream Arch Linux..."
scripts/config --set-str CONFIG_SECURITY_TOMOYO_POLICY_LOADER      "/usr/bin/tomoyo-init"
scripts/config --set-str CONFIG_SECURITY_TOMOYO_ACTIVATION_TRIGGER "/usr/lib/systemd/systemd"

  # Let's user choose microarchitecture optimization in GCC
  # Use default microarchitecture only if we have not choosen another microarchitecture
  if [ "$_microarchitecture" -ne "0" ]; then
    ../choose-gcc-optimization.sh $_microarchitecture
  fi

  # This is intended for the people that want to build this package with their own config
  # Put the file "myconfig" at the package folder (this will take preference) or "${XDG_CONFIG_HOME}/linux-xanmod/myconfig"
  # If we detect partial file with scripts/config commands, we execute as a script
  # If not, it's a full config, will be replaced
  for _myconfig in "${SRCDEST}/myconfig" "${HOME}/.config/linux-xanmod/myconfig" "${XDG_CONFIG_HOME}/linux-xanmod/myconfig" ; do
    if [ -f "${_myconfig}" ] && [ "$(wc -l <"${_myconfig}")" -gt "0" ]; then
      if grep -q 'scripts/config' "${_myconfig}"; then
        # myconfig is a partial file. Executing as a script
        echo "Applying myconfig..."
        bash -x "${_myconfig}"
      else
        # myconfig is a full config file. Replacing default .config
        echo "Using user CUSTOM config..."
        cp -f "${_myconfig}" .config
      fi
      echo
      break
    fi
  done

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
  if [ "$_localmodcfg" = "y" ]; then
    if [ -f $HOME/.config/modprobed.db ]; then
      echo "Running Steven Rostedt's make localmodconfig now"
      make ${_compiler_flags} LSMOD=$HOME/.config/modprobed.db localmodconfig
    else
      echo "No modprobed.db data found"
      exit 1
    fi
  fi

  make ${_compiler_flags} olddefconfig

  make -s kernelrelease > version
  echo "Prepared %s version %s" "$pkgbase" "$(<version)"

  if [ "$_makenconfig" = "y" ]; then
    make ${_compiler_flags} nconfig
  fi

  # save configuration for later reuse
  cat .config > "${SRCDEST}/config.last"
}

build() {
  cd linux-${_major}
  make ${_compiler_flags} -j$(nproc) all
}

_package() {
  pkgdesc="Linux Xanmod (Stable) with BORE CPU scheduler and tickrate customizations"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'linux-firmware: firmware images needed for some devices'
    'scx-scheds: to use sched-ext schedulers'
    'wireless-regdb: to set the correct wireless channels of your country'
  )
  provides=(
    KSMBD-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
    NTFS3-MODULE
  )
  replaces=(
    virtualbox-guest-modules-arch
    wireguard-arch
  )

  cd linux-${_major}
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build link
  rm "$modulesdir"/build
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=(pahole)

  cd linux-${_major}
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts
  ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  if [ -f "tools/bpf/resolve_btfids/resolve_btfids" ]; then install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids ; fi

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

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
    case "$(file -Sib "$file")" in
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

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:

