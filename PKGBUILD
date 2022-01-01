# Maintainer : antman666 <945360554@qq.com>
# Contributor: zhullyb <zhullyb@outlook.com>
# Contributor: Yeqin Su <hougelangley1987@gmail.com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Yoshi2889 <rick.2889 at gmail dot com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Joan Figueras <ffigue at gmail dot com>

##
## This package include headers by default
## The following variables can be customized at build time. Use env or export to change at your wish
##
##   Example: env _microarchitecture=25 use_numa=n use_tracers=n use_pds=n makepkg -sc
##
## Look inside 'choose-gcc-optimization.sh' to choose your microarchitecture
## Valid numbers between: 0 to 42
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
## Here keeps default is ok
if [ -z ${use_numa+x} ]; then
  use_numa=y
fi

## For performance you can disable FUNCTION_TRACER/GRAPH_TRACER. Limits debugging and analyzing of the kernel.
## Stock Archlinux and Xanmod have this enabled. 
## Set variable "use_tracers" to: n to disable (possibly increase performance)
##                                y to enable  (stock default)
if [ -z ${use_tracers+x} ]; then
  use_tracers=y
fi

## Choose between GCC and CLANG config (default is GCC)
if [ -z ${_compiler+x} ]; then
  _compiler=gcc
fi

# Compress modules with ZSTD (to save disk space)
if [ -z ${_compress_modules+x} ]; then
  _compress_modules=n
fi

## Setting some security options
use_selinux=n
use_tomoyo=n
use_yama=n
use_apparmor=

# Compile ONLY used modules to VASTLYreduce the number of modules built
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
_makenconfig=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-xanmod-tt-uksm-cjktty
replaces=("linux-xanmod-cacule-uksm-cjktty")
_major=5.15
pkgver=${_major}.12
_branch=5.x
xanmod=1
pkgrel=${xanmod}
pkgdesc='Linux Xanmod. Development branch with the Task Type CPU Scheduler by Hamad Al Marri'
_patches_url="https://gitlab.com/sirlucjan/kernel-patches/-/raw/master/${_major}"
_jobs=$(nproc)
url="http://www.xanmod.org/"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc cpio kmod libelf perl tar xz
)

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
        "0003-zstd.patch::${_patches_url}/zstd-patches/0001-zstd-patches.patch"
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

b2sums=('3921274b23f7938abdf3ed9334534b4581e13d7484303d3a5280eddb038999aaa8b836666a487472d9c4a219af0f06b9fecccaf348fb5510ab8762f4ef4b7e83'
        'SKIP'
        '33a41b0fa0fc1049890d8428ed54adc8e986f448d436768e4be9a263ae8b48b08f249de3c9e22ea1eb39cb43e2c40d55f7e2db02720e39ea28df5048ecc1954e'
        '610a717e50339b45573dfd0b00da20ef3797053d93a5116673756f8644fbd4fbca9e82587225ebb94a5c51b0e5f1b92329d515c8c60466b41c6845ed06a7405a'
        '2b765bd1aad8086a94ec9285e4d789eacdff05fcc71013286384a51de6f6cc153cecffd4430cfc08daae4692583577b5eb07f971eb00bcd1ca796063865c20f7'
        '33ecbb3c7c3887b187fe951dd1fb897ab5378ecb1e01fa290c31782b10925b5874f0ded96b7a8a2693497fbee2965e9b5e9ff421934fce8a98508af4425ca260'
        'af67842113cb345e731b12d4709ddc127a73001e8f49f9391f4351904de82825f13e1895be092048329c46af44504e824ace4a4fa4a9af200d247eba1a12f2d2')

export KBUILD_BUILD_HOST=${KBUILD_BUILD_HOST:-archlinux}
export KBUILD_BUILD_USER=${KBUILD_BUILD_USER:-makepkg}
export KBUILD_BUILD_TIMESTAMP=${KBUILD_BUILD_TIMESTAMP:-$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})}

prepare() {

  cd linux-${_major}

  msg2 "Apply Xanmod patch"
  patch -Np1 -i ../patch-${pkgver}-xanmod${xanmod}-tt

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux-xanmod}" > localversion

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

  # enable LTO_CLANG_THIN
  if [ "${_compiler}" = "clang" ]; then
    msg2 "Enable LTO_CLANG_THIN"
    scripts/config --disable LTO_CLANG_FULL
    scripts/config --enable LTO_CLANG_THIN
    _LLVM=1
  fi

  # CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team
  scripts/config --enable CONFIG_STACK_VALIDATION

  # Enable IKCONFIG following Arch's philosophy
  scripts/config --enable CONFIG_IKCONFIG \
                 --enable CONFIG_IKCONFIG_PROC

  # User set. See at the top of this file
  if [ "$use_tracers" = "n" ]; then
    msg2 "Disabling FUNCTION_TRACER/GRAPH_TRACER..."
    if [ "${_compiler}" = "gcc" ]; then
      scripts/config --disable CONFIG_FUNCTION_TRACER \
                     --disable CONFIG_STACK_TRACER
    fi
  fi

  if [ "$use_numa" = "n" ]; then
    msg2 "Disabling NUMA..."
    scripts/config --disable CONFIG_NUMA
  fi

  # Compress modules by default (following Arch's kernel)
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

  scripts/config --disable CONFIG_DEFAULT_SECURITY_APPARMOR
  scripts/config --enable CONFIG_DEFAULT_SECURITY_DAC
  scripts/config --enable CONFIG_FTRACE
  scripts/config --enable CONFIG_FTRACE_SYSCALLS

  scripts/config --disable CONFIG_KVM_WERROR
  scripts/config --enable CONFIG_KVM
  scripts/config --enable CONFIG_KVM_AMD
  scripts/config --enable CONFIG_KVM_INTEL
  scripts/config --disable CONFIG_X86_X32
  scripts/config --disable CONFIG_MQ_IOSCHED_DEADLINE
  scripts/config --disable CONFIG_MQ_IOSCHED_KYBER
  scripts/config --module CONFIG_EXT4_FS
  scripts/config --set-val CONFIG_KERNEL_ZSTD_LEVEL 3
  scripts/config --enable CONFIG_KERNEL_ZSTD_LEVEL_ULTRA
  scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_SIZE
  scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3

  msg2 "Change cpu freq into ondemand"
  scripts/config --enable CONFIG_CPU_FREQ_GOV_ONDEMAND
  scripts/config --enable CONFIG_CPU_FREQ_GOV_PERFORMANCE
  scripts/config --enable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
  scripts/config --enable CONFIG_CPU_FREQ_GOV_USERSPACE
  scripts/config --enable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
  scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND

  msg2 "Enable LRU"
  scripts/config --enable CONFIG_LRU_GEN
  scripts/config --set-val CONFIG_NR_LRU_GENS 7
  scripts/config --set-val CONFIG_TIERS_PER_GEN 4
  scripts/config --enable CONFIG_LRU_GEN_ENABLED
  scripts/config --disable CONFIG_LRU_GEN_STATS

  msg2 "Enable zram compression to ZSTD"
  scripts/config --disable CONFIG_ZRAM_DEF_COMP_LZORLE
  scripts/config --enable CONFIG_ZRAM_DEF_COMP_ZSTD
  scripts/config --set-str CONFIG_ZRAM_DEF_COMP zstd

  scripts/config --disable CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4
  scripts/config --enable CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD
  scripts/config --set-str CONFIG_ZSWAP_COMPRESSOR_DEFAULT zstd

  msg2 "Change module compression to ZSTD"
  scripts/config --disable CONFIG_MODULE_COMPRESS_NONE
  scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD
  scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD_ULTRA
  scripts/config --set-val CONFIG_MODULE_COMPRESS_ZSTD_LEVEL 3

  # Let's user choose microarchitecture optimization in GCC
  sh ${srcdir}/choose-gcc-optimization.sh $_microarchitecture

  # This is intended for the people that want to build this package with their own config
  # Put the file "myconfig" at the package folder to use this feature
  # If it's a full config, will be replaced
  # If not, you should use scripts/config commands, one by line
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
      make LSMOD=$HOME/.config/modprobed.db LLVM=$_LLVM LLVM_IAS=$_LLVM localmodconfig
    else
      msg2 "No modprobed.db data found"
      exit
    fi
  fi
  
  msg2 "Applying default config..."
  make LLVM=$_LLVM LLVM_IAS=$_LLVM olddefconfig

  make -s kernelrelease > version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"

  [[ -z "$_makenconfig" ]] || make nconfig

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"
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
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  replaces=()

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
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for Xanmod Linux kernel"

  cd linux-${_major}
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

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
