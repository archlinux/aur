# Maintainer : AntMan666 <945360554@qq.com>
# Contributor: zhullyb <zhullyb@outlook.com>
# Contributor: Yeqin Su <hougelangley1987@gmail.com>
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

##
## The following variables can be customized at build time. Use env or export to change at your wish
##
##   Example: env _microarchitecture=98 use_numa=n use_tracers=n makepkg -sc
##
## Look inside 'choose-gcc-optimization.sh' to choose your microarchitecture
## Valid numbers between: 0 to 99
## Default is: 0 => generic
## Good option if your package is for one machine: 98 => Intel native
##                                                 99 => AMD native
## It will use native by default
if [ -z ${_microarchitecture+x} ]; then
  cpu=`grep vendor_id /proc/cpuinfo | awk -F: '{print $2}' | tail -1`
  if [ $cpu == 'GenuineIntel' ]; then
    _microarchitecture=98
  elif [ $cpu == 'AuthenticAMD' ]; then
    _microarchitecture=99
  else
    _microarchitecture=0
  fi
fi

## Disable NUMA since most users do not have multiple processors. Breaks CUDA/NvEnc.
## Archlinux and Xanmod enable it by default.
## Set variable "use_numa" to: n to disable (possibly increase performance)
##                             y to enable  (stock default)
if [ -z ${use_numa+x} ]; then
  use_numa=n
fi

## For performance you can disable FUNCTION_TRACER/GRAPH_TRACER. Limits debugging and analyzing of the kernel.
## Stock Archlinux and Xanmod have this enabled. 
## Set variable "use_tracers" to: n to disable (possibly increase performance)
##                                y to enable  (stock default)
if [ -z ${use_tracers+x} ]; then
  use_tracers=n
fi

## Choose between GCC and CLANG config (default is CLANG)
if [ -z ${_compiler+x} ]; then
  _compiler=clang
fi

# Compress modules with ZSTD (to save disk space)
if [ -z ${_compress_modules+x} ]; then
  _compress_modules=n
fi

# Setting some security options
use_selinux=n
use_tomoyo=n
use_yama=n
use_apparmor=y

# kvm settings
if [ -z ${_use_kvm+x} ]; then
  _use_kvm=y
fi

# optimization (default O3)
if [ -z ${_use_O3+x} ];then
  _use_O3=y
fi

# Use LLVM Type ( "full" or "thin" )
if [ -z ${_use_llvm_type+x} ]; then
  _use_llvm_type="full"
fi

# cpufreq gov (available:performance,ondemand,conservative,userspace,schedutil,powersave)
if [ -z ${_cpufreq+x} ]; then
  _cpufreq=performance
fi

# LRU setting
if [ -z ${_use_lru+x} ]; then
  _use_lru=y
fi

# zram setting
if [ -z ${_use_zram+x} ]; then
  _use_zram=y
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

# Tweak kernel options prior to a build via nconfig
if [ -z ${_makenconfig} ]; then
  _makenconfig=n
fi

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-xanmod-tt-uksm-cjktty
_major=5.15
pkgver=${_major}.49
_branch=5.x
xanmod=1
pkgrel=${xanmod}
pkgdesc='Linux Xanmod. Development branch with the Task Type CPU Scheduler by Hamad Al Marri'
url="http://www.xanmod.org/"
arch=(x86_64)

license=(GPL2)
makedepends=(
  bc cpio kmod libelf perl tar xz
)
_patches_url="https://gitlab.com/sirlucjan/kernel-patches/-/raw/master/${_major}"
_jobs=$(nproc)
_core=$(nproc --all)
if [ "${_compiler}" = "clang" ]; then
  makedepends+=(clang llvm lld python)
  _LLVM=1
fi
options=('!strip')
_srcname="linux-${pkgver}-xanmod${xanmod}"

source=("https://cdn.kernel.org/pub/linux/kernel/v${_branch}/linux-${_major}.tar."{xz,sign}
        "https://github.com/xanmod/linux/releases/download/${pkgver}-xanmod${xanmod}-tt/patch-${pkgver}-xanmod${xanmod}-tt.xz"
        choose-gcc-optimization.sh
        "0001-cjktty.patch::https://raw.githubusercontent.com/zhmars/cjktty-patches/master/v${_branch}/cjktty-${_major}.patch"
        "0002-UKSM.patch::${_patches_url}/uksm-patches/0001-UKSM-for-${_major}.patch"
       )
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

# Archlinux patches
_commit="ec9e9a4219fe221dec93fa16fddbe44a34933d8d"
_patches=()
for _patch in ${_patches[@]}; do
    #source+=("${_patch}::https://git.archlinux.org/svntogit/packages.git/plain/trunk/${_patch}?h=packages/linux&id=${_commit}")
    source+=("${_patch}::https://raw.githubusercontent.com/archlinux/svntogit-packages/${_commit}/trunk/${_patch}")
done

sha256sums=('57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8'
            'SKIP'
            '24b4dfb846c4148f38f6edb400ab458ac35f24776cff00bc861eb25225066f22'
            '1ac18cad2578df4a70f9346f7c6fccbb62f042a0ee0594817fdef9f2704904ee'
            '97a525e28a270c5e6e5a4fc4ab4920c42ceef2f9921857497ab3c56ec343803e'
            'cb348cc3ba1a453ac6057ecc08000a2ccddc47b70491caaf71db34a3d630f77c')

export KBUILD_BUILD_HOST=${KBUILD_BUILD_HOST:-archlinux}
export KBUILD_BUILD_USER=${KBUILD_BUILD_USER:-makepkg}
export KBUILD_BUILD_TIMESTAMP=${KBUILD_BUILD_TIMESTAMP:-$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})}

prepare() {
  cd linux-${_major}

  # Apply Xanmod patch
  patch -Np1 -i ../patch-${pkgver}-xanmod${xanmod}-tt

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  #echo "${pkgbase#linux-xanmod}" > localversion.20-pkgname

  # Archlinux patches
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # Applying configuration
  cp -vf CONFIGS/xanmod/${_compiler}/config .config

  # enable LTO_CLANG
  if [ "${_compiler}" = "clang" ]; then
    if [ $_use_llvm_type = "thin" ]; then
      msg2 "Enable LTO_CLANG_THIN"
      scripts/config --disable LTO_NONE \
        --enable LTO \
        --enable LTO_CLANG \
        --enable ARCH_SUPPORTS_LTO_CLANG \
        --enable ARCH_SUPPORTS_LTO_CLANG_THIN \
        --enable HAS_LTO_CLANG \
        --enable LTO_CLANG_THIN \
        --enable HAVE_GCC_PLUGINS
    elif [ $_use_llvm_type = "full" ]; then
      msg2 "Enable LTO_CLANG_FULL"
      scripts/config --disable LTO_NONE \
        --enable LTO \
        --enable LTO_CLANG \
        --enable ARCH_SUPPORTS_LTO_CLANG \
        --enable ARCH_SUPPORTS_LTO_CLANG_THIN \
        --enable HAS_LTO_CLANG \
        --enable LTO_CLANG \
        --enable LTO_CLANG_FULL \
        --enable HAVE_GCC_PLUGINS
    else
      scripts/config --enable CONFIG_LTO_NONE
    fi
  fi

  # CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team
  scripts/config --enable CONFIG_STACK_VALIDATION

  # Enable IKCONFIG following Arch's philosophy
  scripts/config --enable CONFIG_IKCONFIG \
                 --enable CONFIG_IKCONFIG_PROC

  # User set. See at the top of this file
  if [ "$use_tracers" = "n" ]; then
    msg2 "Disabling FUNCTION_TRACER/GRAPH_TRACER only if we are not compiling with clang..."
    if [ "${_compiler}" = "gcc" ]; then
      scripts/config --disable CONFIG_FUNCTION_TRACER \
                     --disable CONFIG_STACK_TRACER
    fi
  fi

  if [ "$use_numa" = "n" ]; then
    msg2 "Disabling NUMA..."
    scripts/config --disable CONFIG_NUMA
    scripts/config --disable CONFIG_AMD_NUMA
    scripts/config --disable CONFIG_X86_64_ACPI_NUMA
    scripts/config --disable CONFIG_NODES_SPAN_OTHER_NODES
    scripts/config --disable CONFIG_NUMA_EMU
    scripts/config --disable CONFIG_NEED_MULTIPLE_NODES
    scripts/config --disable CONFIG_USE_PERCPU_NUMA_NODE_ID
    scripts/config --disable CONFIG_ACPI_NUMA
    scripts/config --disable CONFIG_ARCH_SUPPORTS_NUMA_BALANCING
    scripts/config --disable CONFIG_NODES_SHIFT
    scripts/config --undefine CONFIG_NODES_SHIFT
    scripts/config --disable CONFIG_NEED_MULTIPLE_NODES
  fi

  # NOT compress modules by default (may increase disk space)
  if [ "$_compress_modules" = "y" ]; then
    scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD
  fi

  if [ "$use_selinux" = "n" ]; then
    msg2 "Disabling SELinux..."
    scripts/config --disable CONFIG_SECURITY_SELINUX
  fi
  
  if [ "$use_tomoyo" = "n" ]; then
    msg2 "Disabling TOMOYO..."
    scripts/config --disable CONFIG_SECURITY_TOMOYO
  fi

  if [ "$use_apparmor" = "n" ]; then
    msg2 "Disabling AppArmor..."
    scripts/config --disable CONFIG_SECURITY_APPARMOR
    scripts/config --set-str CONFIG_LSM lockdown,yama,integrity
  fi

  if [ "$use_yama" = "n" ]; then
    msg2 "Disabling YAMA..."
    scripts/config --disable CONFIG_SECURITY_YAMA
    scripts/config --set-str CONFIG_LSM lockdown,integrity,apparmor
  fi

  if [ "$_cpufreq" == "performance" ]; then
    msg2 "Change cpu freq into performance"
    scripts/config --enable CONFIG_CPU_FREQ_GOV_PERFORMANCE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
  elif [ "$_cpufreq" == "ondemand" ]; then
    msg2 "Change cpu freq into ondemand"
    scripts/config --enable CONFIG_CPU_FREQ_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
  elif [ "$_cpufreq" == "conservative" ]; then
    msg2 "Change cpu freq into ondemand"
    scripts/config --enable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
  elif [ "$_cpufreq" == "userspace" ]; then
    msg2 "Change cpu freq into ondemand"
    scripts/config --enable CONFIG_CPU_FREQ_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
  elif [ "$_cpufreq" == "schedutil" ]; then
    msg2 "Change cpu freq into ondemand"
    scripts/config --enable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
  else
    error "Invalid value: $_cpufreq"
  fi

  if [ "$_use_lru" == "y" ]; then
    msg2 "Enable LRU"
    scripts/config --enable CONFIG_LRU_GEN
    scripts/config --set-val CONFIG_NR_LRU_GENS 7
    scripts/config --set-val CONFIG_TIERS_PER_GEN 4
    scripts/config --enable CONFIG_LRU_GEN_ENABLED
    scripts/config --disable CONFIG_LRU_GEN_STATS
  fi

  if [ "$_use_O3" == "y" ]; then
    msg2 "Enable O3"
    scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_SIZE
    scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
  fi

  if [ "$_microarchitecture" == 98 ] || [ "$_microarchitecture" == 99 ]; then
    scripts/config --disable CONFIG_CPU_SUP_HYGON
    scripts/config --disable CONFIG_CPU_SUP_CENTAUR
    scripts/config --disable CONFIG_CPU_SUP_ZHAOXIN
    scripts/config --disable CONFIG_AGP_SIS
    scripts/config --disable CONFIG_AGP_VIA
    scripts/config --set-val CONFIG_NR_CPUS ${_core}
    if [ "$_microarchitecture" == 98 ]; then
      msg2 "Setting for Intel CPU"
      scripts/config --disable CONFIG_CPU_SUP_AMD
      scripts/config --disable CONFIG_AMD_MEM_ENCRYPT
      scripts/config --disable CONFIG_X86_AMD_PSTATE
      scripts/config --disable CONFIG_X86_ACPI_CPUFREQ_CPB
      scripts/config --disable CONFIG_X86_POWERNOW_K8
      scripts/config --disable CONFIG_X86_AMD_FREQ_SENSITIVITY
      scripts/config --disable CONFIG_AGP_AMD64
      scripts/config --enable CONFIG_CPU_SUP_INTEL
      scripts/config --enable CONFIG_X86_MCE_INTEL
      scripts/config --enable CONFIG_PERF_EVENTS_INTEL_UNCORE
      scripts/config --enable CONFIG_PERF_EVENTS_INTEL_RAPL
      scripts/config --enable CONFIG_PERF_EVENTS_INTEL_CSTATE
      scripts/config --enable CONFIG_MICROCODE_INTEL
      scripts/config --enable CONFIG_X86_INTEL_PSTATE
      scripts/config --enable CONFIG_X86_SPEEDSTEP_CENTRINO
      scripts/config --module CONFIG_X86_P4_CLOCKMOD
      scripts/config --enable CONFIG_INTEL_IDLE
      scripts/config --enable CONFIG_AGP_INTEL
    elif [ "$_microarchitecture" == 99 ]; then
      msg2 "Setting for AMD CPU"
      scripts/config --disable CONFIG_CPU_SUP_INTEL
      scripts/config --disable CONFIG_INTEL_IDLE
      scripts/config --disable CONFIG_AGP_INTEL
      scripts/config --enable CONFIG_CPU_SUP_AMD
      scripts/config --enable CONFIG_X86_MCE_AMD
      scripts/config --enable CONFIG_PERF_EVENTS_INTEL_RAPL
      scripts/config --enable CONFIG_PERF_EVENTS_AMD_POWER
      scripts/config --enable CONFIG_PERF_EVENTS_AMD_UNCORE
      scripts/config --enable CONFIG_MICROCODE_AMD
      scripts/config --enable CONFIG_AMD_MEM_ENCRYPT
      scripts/config --enable CONFIG_X86_AMD_PSTATE
      scripts/config --enable CONFIG_X86_ACPI_CPUFREQ_CPB
      scripts/config --enable CONFIG_X86_POWERNOW_K8
      scripts/config --module CONFIG_X86_AMD_FREQ_SENSITIVITY
      scripts/config --enable CONFIG_AGP_AMD64
    fi
  fi

  if [ "$_use_zram" == "y" ]; then
    msg2 "Enable zram compression to LZ4"
    scripts/config --enable CONFIG_ZSMALLOC
    scripts/config --enable CONFIG_ZRAM
    scripts/config --disable CONFIG_ZRAM_DEF_COMP_LZORLE
    scripts/config --enable CONFIIG_ZRAM_DEF_COMP_LZ4
    scripts/config --set-str CONFIG_ZRAM_DEF_COMP lz4

    scripts/config --disable CONFIG_ZSWAP
  fi

  if [ "$_use_kvm" == "y" ]; then
    scripts/config --disable CONFIG_KVM_WERROR
    scripts/config --enable CONFIG_KVM
    if [ "$_microarchitecture" == 98 ]; then
      scripts/config --enable CONFIG_KVM_INTEL
      scripts/config --disable CONFIG_KVM_AMD
    elif [ "$_microarchitecture" == 99 ]; then
      scripts/config --enable CONFIG_KVM_AMD
      scripts/config --disable CONFIG_KVM_INTEL
    fi
  fi

  scripts/config --disable CONFIG_X86_X32
  scripts/config --disable CONFIG_STACKPROTECTOR_STRONG
  scripts/config --enable CONFIG_WINESYNC

  # Let's user choose microarchitecture optimization in GCC
  # If you're using this PKGBUILD, if will use native by default
  sh ${srcdir}/choose-gcc-optimization.sh $_microarchitecture

  # This is intended for the people that want to build this package with their own config
  # Put the file "myconfig" at the package folder (this will take preference) or "${XDG_CONFIG_HOME}/linux-xanmod/myconfig"
  # If we detect partial file with scripts/config commands, we execute as a script
  # If not, it's a full config, will be replaced
  for _myconfig in "${SRCDEST}/myconfig" "${HOME}/.config/linux-xanmod/myconfig" "${XDG_CONFIG_HOME}/linux-xanmod/myconfig" ; do
    if [ -f "${_myconfig}" ] && [ "$(wc -l <"${_myconfig}")" -gt "0" ]; then
      if grep -q 'scripts/config' "${_myconfig}"; then
        # myconfig is a partial file. Executing as a script
        msg2 "Applying myconfig..."
        bash -x "${_myconfig}"
      else
        # myconfig is a full config file. Replacing default .config
        msg2 "Using user CUSTOM config..."
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
      msg2 "Running Steven Rostedt's make localmodconfig now"
      make LLVM=$_LLVM LLVM_IAS=$_LLVM LSMOD=$HOME/.config/modprobed.db localmodconfig
    else
      msg2 "No modprobed.db data found"
      exit 1
    fi
  fi

  make LLVM=$_LLVM LLVM_IAS=$_LLVM olddefconfig

  make -s kernelrelease > version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"

  if [ "$_makenconfig" = "y" ]; then
    make LLVM=$_LLVM LLVM_IAS=$_LLVM nconfig
  fi

  # save configuration for later reuse
  cat .config > "${SRCDEST}/config.last"
}

build() {
  cd linux-${_major}
  make LLVM=$_LLVM LLVM_IAS=$_LLVM -j${_jobs} all
}

_package() {
  pkgdesc="The Linux kernel and modules with Xanmod patches"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE
            KSMBD-MODULE
            NTFS3-MODULE)

  cd linux-${_major}
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=(pahole)

  cd linux-${_major}
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  if [ -f "$builddir/tools/bpf/resolve_btfids" ]; then install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids ; fi

  msg2 "Installing headers..."
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

  msg2 "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"
  
  msg2 "Adding symlink..."
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
