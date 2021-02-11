# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>
# Credit to graysky for shamelessly copying PKGBUILD from linux-ck

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Compile ONLY used modules to VASTLYreduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-gc
pkgver=5.10.15
pkgrel=1
pkgdesc='Linux'
url="https://cchalpha.blogspot.co.uk/"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc kmod libelf pahole
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git
)
options=('!strip')
_srcname=linux-${pkgver}
_arch_config_commit=40d94bbb1396c27d8d545ad5278f4a4476ba77ec
_bmqversion=5.10-r2
_bmq_patch="prjc_v${_bmqversion}.patch"
_gcc_more_v='20201113'
source=(
  "https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar".{xz,sign}
  "config::https://raw.githubusercontent.com/archlinux/svntogit-packages/${_arch_config_commit}/trunk/config"
  "${_bmq_patch}::https://gitlab.com/alfredchen/projectc/raw/master/${_bmqversion%-*}/${_bmq_patch}"
  "enable_additional_cpu_optimizations-${_gcc_more_v}.tar.gz::https://github.com/graysky2/kernel_gcc_patch/archive/${_gcc_more_v}.tar.gz"
  "0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch::https://git.archlinux.org/linux.git/patch/?id=024a28765039cafbd4b4056d3f213be989e39dc2"
  "0002-HID-quirks-Add-Apple-Magic-Trackpad-2-to-hid_have_sp.patch::https://git.archlinux.org/linux.git/patch/?id=53b53f6df0d94a034c14eb65d9b925832c22159d"
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30'  # Jan Alexander Steffens (heftig)
)
b2sums=('7cf58513bf2266697843f6d91fbb214268ad511e110a4e2b66bc0db84ecb4df724a7d65f641eee5837f4d88c1371ec8b313ee8aaa1d1f0260709eae2e3af32b3'
        'SKIP'
        '74b6ea3f314aa8291c9e2c3b5763f9b0c8aabbc0e714e30529f557955a7a315b44b0cd2f2d665ffe3ba48e7df71274c5901d3891ed395191ceb6ca88f69cdb1a'
        '964457a55fe70988fcba968d2940d78d3daff5d1629863279ee15e07f8c1bb4e58e4d22b2cae9e66ab0c61c4d54de04e7a6eb2710eaaa536ec11f29efa961f1c'
        '7f1eb5938472f57748216bd00e0c875feab99fc1c5cb89babfea467ee30ca5c8e9fc5a691efe2e602bef1ea79820c5383822d7cec354b48d23321ccda8ee8127'
        '1a50d0c7d17131e5fd019a82ee6c02212bb3e0e9520fa93099a0101621b5071b9b7daf6ef3d0c2007492f4914a9381c429bd27d8332e61cf173cd32bc3f5eab0'
        '3ab28f05b78743369f44381317d1882cdb3c92d134dfe795505f80ab0aa027c3b8c02c4f85ba502b1dd606b6a694498e9de775fcda781b45d6ab3a3ab40e58c4')

_kernelname=${pkgbase#linux}
: ${_kernelname:=-gc}
export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "$_kernelname" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = 0*.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config .config

  # disable CONFIG_DEBUG_INFO=y at build time introduced in this commit
  # https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/linux&id=663b08666b269eeeeaafbafaee07fd03389ac8d7
  sed -i -e 's/CONFIG_DEBUG_INFO=y/# CONFIG_DEBUG_INFO is not set/' \
      -i -e '/CONFIG_DEBUG_INFO_DWARF4=y/d' -i -e '/CONFIG_DEBUG_INFO_BTF=y/d' ./.config

  echo "Applying patch ${_bmq_patch}..."
  patch -Np1 -i "$srcdir/${_bmq_patch}"

  # non-interactively apply ck1 default options
  # this isn't redundant if we want a clean selection of subarch below
  make olddefconfig

  # https://github.com/graysky2/kernel_gcc_patch
  echo "Applying enable_additional_cpu_optimizations-${_gcc_more_v}..."
  patch -Np1 -i "$srcdir/kernel_gcc_patch-$_gcc_more_v/enable_additional_cpu_optimizations_for_gcc_v10.1+_kernel_v5.8+.patch"

  make oldconfig

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
  if [ -n "$_localmodcfg" ]; then
    if [ -f $HOME/.config/modprobed.db ]; then
      echo "Running Steven Rostedt's make localmodconfig now"
      make LSMOD=$HOME/.config/modprobed.db localmodconfig
    else
      echo "No modprobed.db data found"
      exit
    fi
  fi

  make -s kernelrelease > version
  echo "Prepared ${pkgbase} version $(<version)"

  [[ -z "$_makenconfig" ]] || make nconfig

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"
}

build() {
  cd $_srcname
  make all
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the Project C scheduler"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')

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
  #make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install
  # not needed since not building with CONFIG_DEBUG_INFO=y

  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the ${pkgbase/linux/Linux} kernel"
  depends=('linux-gc')

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

  #echo "Stripping vmlinux..."
  #strip -v $STRIP_STATIC "$builddir/vmlinux"
  # not needed since not building with CONFIG_DEBUG_INFO=y

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  echo "Fixing permissions..."
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
