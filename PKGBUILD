# Maintainer: shmilee <shmilee.zju@gmail.com>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

# last/latest "longterm maintenance" kernel releases
# https://www.kernel.org/category/releases.html
# 6.1 Greg Kroah-Hartman & Sasha Levin 2022-12-11 Dec, 2026
_LLL_VER=6.1
_LLL_SUBVER=15

#PKGEXT='.pkg.tar'

# Disable NUMA since most users do not have multiple processors. Breaks CUDA/NvEnc.
## Archlinux and Xanmod enable it by default.
# Set variable "use_numa" to: n to disable (possibly increase performance)
#                             y to enable  (stock default)
if [ -z ${use_numa+x} ]; then
  use_numa=n
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
)
######## END ########

pkgbase=linux-shmilee
pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
pkgver=${_LLL_VER}.${_LLL_SUBVER}
pkgrel=1
pkgdesc='Linux-shmilee'
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
            '688d9da899bbf5758865d648dd99eaffafb4bb6a67c2d3182c2cd249e4a6be8e'
            'c5bdf89d7867c368dfd7b7c16e5a50a99ca8022de28ab15315bdcb5dab8aad85'
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

  # Optionally disable NUMA for 64-bit kernels only
  if [ "$use_numa" = "n" ] && [ "${CARCH}" = "x86_64" ]; then
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
  echo "" > localversion
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
