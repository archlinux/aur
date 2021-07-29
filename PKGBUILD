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
## Good option if your package is for one machine: 42 => native
## I choose native to let it optimization itself, you can change it by yourself
if [ -z ${_microarchitecture+x} ]; then
  _microarchitecture=0
fi

## Disable NUMA since most users do not have multiple processors. Breaks CUDA/NvEnc.
## Archlinux and Xanmod enable it by default.
## Set variable "use_numa" to: n to disable (possibly increase performance)
##                             y to enable  (stock default)
## Here keeps default is ok
if [ -z ${use_numa+x} ]; then
  use_numa=n
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

pkgbase=linux-xanmod-cacule-uksm-cjktty
_major=5.13
pkgver=${_major}.6
_branch=5.x
xanmod=2
pkgrel=${xanmod}
pkgdesc='Linux Xanmod. Branch with Cacule scheduler by Hamad Marri'
_patches_url="https://gitlab.com/sirlucjan/kernel-patches/-/raw/master/${_major}"
url="http://www.xanmod.org/"
arch=(x86_64)

license=(GPL2)
makedepends=(
  xmlto kmod inetutils bc libelf cpio
)

if [ "${_compiler}" = "clang" ]; then
  makedepends+=(clang llvm)
fi

options=('!strip')
_srcname="linux-${pkgver}-xanmod${xanmod}"

source=("https://cdn.kernel.org/pub/linux/kernel/v${_branch}/linux-${_major}.tar."{xz,sign}
        "https://github.com/xanmod/linux/releases/download/${pkgver}-xanmod${xanmod}-cacule/patch-${pkgver}-xanmod${xanmod}-cacule.xz"
        choose-gcc-optimization.sh
        "0001-cjktty.patch::${_patches_url}/cjktty-patches/0001-cjktty-${_major}-initial-import-from-https-github.com-zhm.patch"
        "0002-UKSM.patch::${_patches_url}/uksm-patches/0001-UKSM-for-${_major}.patch"
        "0003-zstd.patch::${_patches_url}/zstd-patches-v5/0001-zstd-patches.patch"
        )

validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

# Archlinux patches
_commits=""
for _patch in $_commits; do
    source+=("${_patch}.patch::https://git.archlinux.org/linux.git/patch/?id=${_patch}")
done

b2sums=('9c4c12e2394dec064adff51f7ccdf389192eb27ba7906db5eda543afe3d04afca6b9ea0848a057571bf2534eeb98e1e3a67734deff82c0d3731be205ad995668'
        'SKIP'
        'c1996772cd377d81b810b74c26367320780c28e6d93b2bdfe81b0a84fd05d0327873e8a8ccb3882be9e0f96578456ed3d0370083b8b55e8bbf9bf7f4ad92979c'
        '2f0d5ddc9a1003958e8a3745cb42e47af8e7ff9961dd3d2ea070cc72444b5c63763f953b393bdd7c8a31f3ea29e8d3c86cc8647ae67bb054e22bce34af492ce1'
        'cb72248c2226b5c1a39422d9d9a79a4f9331c965a888185f421619185231a290d74e273c2323ab2c9340adfb269259825da781af423674abfbc9be909db0cc35'
        '066e1d2cf209eed973957b00eebe3cbcce37b77e9ab0ef115da0aa6984ac6dea1b5d43fedd6e87dbda042b620a7684eae6c36a739f7a49e0f96ebd41867947f4'
        'c88d3053e0e1d1145ec7d487df7ed1c18b8a4e8cf62f8fc9e05baa5f1b270aa64177f33b13c1d409e63a83691cc530e5f848ab73bfd2b10f60cdb681b9e310c1'
      )

export KBUILD_BUILD_HOST=${KBUILD_BUILD_HOST:-archlinux}
export KBUILD_BUILD_USER=${KBUILD_BUILD_USER:-makepkg}
export KBUILD_BUILD_TIMESTAMP=${KBUILD_BUILD_TIMESTAMP:-$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})}

prepare() {

  cd linux-${_major}

  msg2 "Apply Xanmod patch"
  xz -d < ../patch-${pkgver}-xanmod${xanmod}-cacule.xz | patch -Np1

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

  # CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team
  scripts/config --enable CONFIG_STACK_VALIDATION

  # Enable IKCONFIG following Arch's philosophy
  scripts/config --enable CONFIG_IKCONFIG \
                 --enable CONFIG_IKCONFIG_PROC

  # User set. See at the top of this file
  if [ "$use_tracers" = "n" ]; then
    msg2 "Disabling FUNCTION_TRACER/GRAPH_TRACER..."
    scripts/config --disable CONFIG_FUNCTION_TRACER \
                   --disable CONFIG_STACK_TRACER
  fi

  if [ "$use_numa" = "n" ]; then
    msg2 "Disabling NUMA..."
    scripts/config --disable CONFIG_NUMA
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

  scripts/config --disable CONFIG_KVM_WERROR
  scripts/config --disable CONFIG_X86_X32
  scripts/config --disable CONFIG_MQ_IOSCHED_DEADLINE
  scripts/config --disable CONFIG_MQ_IOSCHED_KYBER
  scripts/config --module CONFIG_EXT4_FS
  scripts/config --set-val CONFIG_KERNEL_ZSTD_LEVEL 15
  scripts/config --enable CONFIG_KERNEL_ZSTD_LEVEL_ULTRA
  scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
  scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_SIZE

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
  
  make LLVM=$_LLVM LLVM_IAS=$_LLVM olddefconfig

  make -s kernelrelease > version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"

  [[ -z "$_makenconfig" ]] || make nconfig

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"
}

build() {
  cd linux-${_major}
  make LLVM=$_LLVM LLVM_IAS=$_LLVM all
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
