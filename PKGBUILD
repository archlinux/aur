# Maintainer: shmilee <shmilee.zju@gmail.com>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

# last/latest/longest "longterm maintenance" kernel releases
# https://www.kernel.org/category/releases.html
# 6.1 Greg Kroah-Hartman & Sasha Levin 2022-12-11 Dec, 2026
_LLL_VER=6.1
_LLL_SUBVER=18

#PKGEXT='.pkg.tar'

# Set x86-64 psABI level: https://dl.xanmod.org/check_x86-64_psabi.sh
# Need XanMod patch
# Possible values: v1 / v2 (default) / v3 / v4
# Default v2 which use CONFIG_GENERIC_CPU2:
# ref: https://github.com/xanmod/linux/tree/6.1/CONFIGS/xanmod/gcc
# ref: https://xanmod.org/
if [ -z ${_psABI_level} ]; then
  _psABI_level=v2
fi

# Use HZ ticks 500 instead of Arch default 300
# Need XanMod patch, 500 get from `CONFIGS/xanmod/gcc/config_x86-64-v*`
if [ -z ${_use_HZ_500} ]; then
  _use_HZ_500=y
fi

# Set CONFIG_KERNEL_{XZ,ZSTD} CONFIG_MODULE_COMPRESS_{XZ,ZSTD}
#  XZ:  122M linux-shmilee-6.1.15-2-x86_64.pkg.tar.xz
# ZSTD: 164M linux-shmilee-6.1.15-1-x86_64.pkg.tar.xz
# Set variable "_use_zstd" to: n to use XZ (slower decompress, smaller size)
#                              y to use ZSTD (faster decompress, larger size)
if [ -z ${_use_zstd} ]; then
  _use_zstd=n
fi

# Disable NUMA since most users do not have multiple processors. Breaks CUDA/NvEnc.
## Archlinux and Xanmod enable it by default.
# Set variable "_use_numa" to: n to disable (possibly increase performance)
#                              y to enable  (stock default)
if [ -z ${_use_numa+x} ]; then
  _use_numa=n
fi

# Compile ONLY used modules to VASTLY reduce the number of modules built
# and the build time.
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
if [ -z ${_localmodcfg} ]; then
  _localmodcfg=n
fi

# XanMod Kernel patch
# https://xanmod.org/
# https://github.com/xanmod
_XanMod_VER=1
_Xanmod_PATCH_SRC="https://github.com/xanmod/linux/releases/download/${_LLL_VER}.${_LLL_SUBVER}-xanmod${_XanMod_VER}/patch-${_LLL_VER}.${_LLL_SUBVER}-xanmod${_XanMod_VER}.xz"
#_Xanmod_PATCH_PATCH=()

# CJKTTY patch
# https://github.com/Gentoo-zh/linux-cjktty
#_CJKTTY_PATCH_URL="https://github.com/torvalds/linux/compare/v${_LLL_VER}...Gentoo-zh:${_LLL_VER}-utf8.patch"
#_CJKTTY_PATCH_SRC="cjktty-${_LLL_VER}.patch::${_CJKTTY_PATCH_URL}"
# https://github.com/zhmars/cjktty-patches
_CJKTTY_COMMIT=303dff435a7a0fadbd6215cb59e52dcd656e1d47
_CJKTTY_PATCH_SRC="https://github.com/zhmars/cjktty-patches/raw/${_CJKTTY_COMMIT}/v6.x/cjktty-${_LLL_VER}.patch"
_CJKTTY_PATCH_PATCH=()

_PATHSET_DESC="Xanmod patches, cjktty"

_MORE_PATCH=(
  #"0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch" in Xanmod
  # 11??-*.patch:: online patches
  '1101-Add-6.1.19.patch::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/rawdiff/?h=linux-6.1.y&id=v6.1.19&id2=v6.1.18'
)
######## END ########

pkgbase=linux-shmilee
pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
pkgver=${_LLL_VER}.$((_LLL_SUBVER+1)) # 6.1.18 -> 6.1.19
#pkgver=${_LLL_VER}.${_LLL_SUBVER}
pkgrel=1
pkgdesc="Linux-shmilee x64${_psABI_level}"
url="https://www.kernel.org/"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc libelf pahole cpio perl tar xz gettext
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  #texlive-latexextra
)
if [ "$_localmodcfg" = "y" ]; then
  makedepends+=(modprobed-db)
fi
options=('!strip')
_srcname=linux-${_LLL_VER}
source=(
  https://www.kernel.org/pub/linux/kernel/v6.x/${_srcname}.tar.{xz,sign}
  #https://www.kernel.org/pub/linux/kernel/v6.x/patch-${pkgver}.{xz,sign} # in Xanmod
  ${_Xanmod_PATCH_SRC}
  #${_Xanmod_PATCH_PATCH[@]}
  ${_CJKTTY_PATCH_SRC}
  ${_CJKTTY_PATCH_PATCH[@]}
  ${_MORE_PATCH[@]}
  config         # the main kernel config file
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
# https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
sha256sums=('2ca1f17051a430f6fed1196e4952717507171acfd97d96577212502703b25deb'
            'SKIP'
            '2c8fb15bff0e88782990592de73faebd12fd2663f669cb65293f27c4cbfe5da4'
            'c5bdf89d7867c368dfd7b7c16e5a50a99ca8022de28ab15315bdcb5dab8aad85'
            '2a0ce20d747a15de282114b9059b50a030ac2f545a75581c319068b4ef5ed3f0'
            'a8162641380b2681622d0f3c40ce130c9fd1cf6e176b5db18b95ba83609fbcf8')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  msg2 "Patching with Xanmod(include upstream kernel patch-$pkgver)..."
  patch -Np1 -i ../patch-${_LLL_VER}.${_LLL_SUBVER}-xanmod${_XanMod_VER}

  msg2 "Patching with Gentoo-zh/linux-cjktty patches..."
  cp "../cjktty-${_LLL_VER}.patch" "../cjktty-${_LLL_VER}.${_LLL_SUBVER}.patch"
  for p in ${_CJKTTY_PATCH_PATCH[@]}; do
    patch -Ni ../$p "../cjktty-${_LLL_VER}.${_LLL_SUBVER}.patch"
  done
  patch -Np1 -i "../cjktty-${_LLL_VER}.${_LLL_SUBVER}.patch"

  local src
  for src in "${_MORE_PATCH[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  msg2 "Setting config..."
  cp ../config .config

  # CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team
  scripts/config --enable CONFIG_STACK_VALIDATION

  # Enable IKCONFIG following Arch's philosophy
  scripts/config --enable CONFIG_IKCONFIG \
                 --enable CONFIG_IKCONFIG_PROC

  # Set CONFIG_GENERIC_CPU?
  scripts/config --disable CONFIG_GENERIC_CPU
  scripts/config --disable CONFIG_GENERIC_CPU2
  scripts/config --disable CONFIG_GENERIC_CPU3
  scripts/config --disable CONFIG_GENERIC_CPU4
  if [ "${_psABI_level}" = 'v1' ]; then
    scripts/config --enable CONFIG_GENERIC_CPU
  else
    msg2 "Setting 'CONFIG_GENERIC_CPU${_psABI_level/v/}' for x86-64-${_psABI_level} ..."
    scripts/config --enable CONFIG_GENERIC_CPU${_psABI_level/v/}
  fi

  # set CONFIG_HZ=500 instead of 300
  if [ "$_use_HZ_500" = 'y' ]; then
    msg2 "Setting ticks HZ to 500 ..."
    scripts/config --enable CONFIG_HZ_500
    scripts/config --disable CONFIG_HZ_300
    scripts/config --set-val CONFIG_HZ 500
  fi

  # set KERNEL/MODULE compression mode (ZSTD/XZ)
  if [ "$_use_zstd" = "n" ]; then
    msg2 "Setting XZ compression mode for modules..."
    scripts/config --enable CONFIG_KERNEL_XZ
    scripts/config --enable CONFIG_MODULE_COMPRESS_XZ
    scripts/config --disable CONFIG_KERNEL_ZSTD
    scripts/config --disable CONFIG_MODULE_COMPRESS_ZSTD
  else
    msg2 "Setting ZSTD compression mode for modules..."
    scripts/config --enable CONFIG_KERNEL_ZSTD
    scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD
    scripts/config --disable CONFIG_KERNEL_XZ
    scripts/config --disable CONFIG_MODULE_COMPRESS_XZ
  fi

  # Optionally disable NUMA for 64-bit kernels only
  if [ "$_use_numa" = "n" ] && [ "${CARCH}" = "x86_64" ]; then
    msg2 "Disabling NUMA..."
    scripts/config --disable CONFIG_NUMA
    scripts/config --disable CONFIG_AMD_NUMA
    scripts/config --disable CONFIG_X86_64_ACPI_NUMA
    scripts/config --disable CONFIG_NODES_SPAN_OTHER_NODES
    scripts/config --disable CONFIG_NUMA_EMU
    scripts/config --disable CONFIG_NODES_SHIFT
    scripts/config --disable CONFIG_NEED_MULTIPLE_NODES
    scripts/config --disable CONFIG_USE_PERCPU_NUMA_NODE_ID
    scripts/config --disable CONFIG_ACPI_NUMA
    scripts/config --disable CONFIG_ARCH_SUPPORTS_NUMA_BALANCING
  fi

  msg2 "Add anbox support..."
  scripts/config --enable CONFIG_ASHMEM
  # CONFIG_ION is not set
  scripts/config --enable CONFIG_ANDROID
  scripts/config --enable CONFIG_ANDROID_BINDER_IPC
  scripts/config --enable CONFIG_ANDROID_BINDERFS
  scripts/config --set-str CONFIG_ANDROID_BINDER_DEVICES "binder,hwbinder,vndbinder,binderfs"
  scripts/config --enable CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
  # CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
  if [ "$_localmodcfg" = "y" ]; then
    if [ ! -f $HOME/.config/modprobed.db ]; then
      if [ x"$USER" == x"builduser" ]; then
        SUDO_USER=builduser modprobed-db
        SUDO_USER=builduser modprobed-db store # for makechrootpkg
      else
        modprobed-db
        modprobed-db store
      fi
    fi
    if [ -f $HOME/.config/modprobed.db ]; then
      msg2 "Running Steven Rostedt's make localmodconfig now"
      yes "" | make LSMOD=$HOME/.config/modprobed.db localmodconfig
    else
      msg2 "No modprobed.db data found"
      exit 1
    fi
  fi

  # rewrite configuration
  yes "" | make olddefconfig
  diff -u ../config .config || :

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  if [ "${_psABI_level}" = 'v1' ]; then
    echo "" > localversion
  else
    msg2 "Add localversion '-x64${_psABI_level}'"
    #scripts/config --set-str CONFIG_LOCALVERSION "-x64${_psABI_level}"
    echo "-x64${_psABI_level}" > localversion
  fi
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  make -s kernelrelease > version
  msg2 "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make htmldocs all
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules with ${_PATHSET_DESC} and ashmem, binder enabled"
  depends=(coreutils kmod mkinitcpio)
  optdepends=('wireless-regdb: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)
  #replaces=(virtualbox-guest-modules-arch wireguard-arch)

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod
  # https://github.com/archlinux/svntogit-packages/commit/a65a47973b7676de60add0f40277900a91c115f1

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=(pahole)

  cd $_srcname
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
  install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

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

  msg2 "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg2 "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    msg2 "Removing $(basename "$arch")"
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

  msg2 "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"
}

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
