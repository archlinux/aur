# Maintainer: ANDRoid7890 <andrey.android7890@gmail.com>

# https://gitlab.manjaro.org/packages/core/linux54
#
# Maintainer: Philip Müller
# Maintainer: Bernhard Landauer
# Maintainer: Helmut Stult

# http://aur.archlinux.org/packages/linux-xanmod-lts
#
# Maintainer: Joan Figueras
# Contributor: Torge Matthies
# Contributor: Jan Alexander Steffens (heftig)
# Contributor: Yoshi2889
# Contributor: Tobias Powalowski
# Contributor: Thomas Baechler

##
## The following variables can be customized at build time. Use env or export to change at your wish
##
##   Example: env _microarchitecture=25 use_numa=n use_tracers=n use_pds=n makepkg -sc
##
## Look inside 'choose-gcc-optimization.sh' to choose your microarchitecture
## Valid numbers between: 0 to 42
## Default is: 0 => generic
## Good option if your package is for one machine: 42 => native
if [ -z ${_microarchitecture+x} ]; then
  _microarchitecture=0
fi

## Disable NUMA since most users do not have multiple processors. Breaks CUDA/NvEnc.
## Archlinux and Xanmod enable it by default.
## Set variable "use_numa" to: n to disable (possibly increase performance)
##                             y to enable  (stock default)
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

## Enable PDS CPU scheduler by default https://gitlab.com/alfredchen/linux-pds
## Set variable "use_pds" to: n to disable (stock Xanmod)
##                            y to enable
if [ -z ${use_pds+x} ]; then
  use_pds=n
fi

## Enable CONFIG_USER_NS_UNPRIVILEGED flag https://aur.archlinux.org/cgit/aur.git/tree/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch?h=linux-ck
## Set variable "use_ns" to: n to disable (stock Xanmod)
##                           y to enable (stock Archlinux)
if [ -z ${use_ns+x} ]; then
  use_ns=n
fi

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


pkgbase=linux-manjaro-xanmod-lts
pkgname=("${pkgbase}" "${pkgbase}-headers")
pkgver=5.4.82
_major=5.4
_branch=5.x
xanmod=1
pkgrel=1
pkgdesc='Linux Xanmod'
url="http://www.xanmod.org/"
arch=(x86_64)

__commit="c3a12bb7a64ded06bc4f79879498e3db37c3697d" # 5.4.82-1

license=(GPL2)
makedepends=(
  xmlto kmod inetutils bc libelf cpio
  python-sphinx python-sphinx_rtd_theme graphviz imagemagick git
)
options=('!strip')
_srcname="linux-${pkgver}-xanmod${xanmod}-lts"
source=("https://cdn.kernel.org/pub/linux/kernel/v${_branch}/linux-${_major}.tar."{xz,sign}
        "https://github.com/xanmod/linux/releases/download/${pkgver}-xanmod${xanmod}/patch-${pkgver}-xanmod${xanmod}.xz"
        choose-gcc-optimization.sh
        "https://gitlab.manjaro.org/packages/core/linux54/-/archive/${__commit}/linux59-${__commit}.tar.gz")
sha256sums=('bf338980b1670bca287f9994b7441c2361907635879169c64ae78364efc5f491' # linux-5.4.tar.xz
            'SKIP'                                                             #            .sign
            'ecc8b8723e7ef4625c83c00c9ce7e7a6c304125dd4626e3dcbfbaf9cff2e0468' # xanmod
            '2c7369218e81dee86f8ac15bda741b9bb34fa9cefcb087760242277a8207d511' # choose-gcc-optimization.sh
            '219f658ae91e429ec1de81b08ce39d11ee6286f1c171a9e85e12ce021fd9b903') # manjaro
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

# Archlinux patches
_commits=""
for _patch in $_commits; do
    source+=("${_patch}.patch::https://git.archlinux.org/linux.git/patch/?id=${_patch}")
done

export KBUILD_BUILD_HOST=${KBUILD_BUILD_HOST:-archlinux}
export KBUILD_BUILD_USER=${KBUILD_BUILD_USER:-makepkg}
export KBUILD_BUILD_TIMESTAMP=${KBUILD_BUILD_TIMESTAMP:-$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})}

prepare() {
  cd linux-${_major}  
  
  # Apply Xanmod patch
  patch -Np1 -i ../patch-${pkgver}-xanmod${xanmod}

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  #echo "-$pkgrel" > localversion.10-pkgrel
  echo "-MANJARO-LTS" > localversion.20-pkgname

  # Archlinux patches
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  
  # Manjaro patches
  rm ../linux54-$__commit/0103-futex.patch              # remove conflicting patches
  rm ../linux54-$__commit/aufs5.4-20200622.patch
  rm ../linux54-$__commit/aufs5-base.patch
  rm ../linux54-$__commit/aufs5-kbuild.patch
  rm ../linux54-$__commit/aufs5-mmap.patch
  rm ../linux54-$__commit/aufs5-standalone.patch
  local _patch
  for _patch in ../linux54-$__commit/*; do
      [[ $_patch = *.patch ]] || continue
      msg2 "Applying patch: $_patch..."
      patch -Np1 < "../linux54-$__commit/$_patch"
  done 
  git apply -p1 < "../linux54-$__commit/0513-bootsplash.gitpatch"
  scripts/config --enable CONFIG_BOOTSPLASH
  
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

  if [ "$use_pds" = "y" ]; then
    msg2 "Enabling PDS CPU scheduler by default..."
    scripts/config --enable CONFIG_SCHED_PDS
  fi

  if [ "$use_ns" = "n" ]; then
    msg2 "Disabling CONFIG_USER_NS_UNPRIVILEGED"
    scripts/config --disable CONFIG_USER_NS_UNPRIVILEGED
  fi

    
  scripts/config --module CONFIG_AUFS_FS
  scripts/config --enable CONFIG_AUFS_BRANCH_MAX_127
  # CONFIG_AUFS_BRANCH_MAX_511 is not set
  # CONFIG_AUFS_BRANCH_MAX_1023 is not set 
  # CONFIG_AUFS_BRANCH_MAX_32767 is not set
  scripts/config --enable CONFIG_AUFS_SBILIST
  scripts/config --enable CONFIG_AUFS_HNOTIFY
  scripts/config --enable CONFIG_AUFS_HFSNOTIFY
  scripts/config --enable CONFIG_AUFS_EXPORT
  scripts/config --enable CONFIG_AUFS_INO_T_64
  # CONFIG_AUFS_XATTR is not set
  # CONFIG_AUFS_FHSM is not set
  scripts/config --enable CONFIG_AUFS_RDU
  # CONFIG_AUFS_DIRREN is not set
  scripts/config --enable CONFIG_AUFS_SHWH
  scripts/config --enable CONFIG_AUFS_BR_RAMFS
  scripts/config --enable CONFIG_AUFS_BR_FUSE
  scripts/config --enable CONFIG_AUFS_POLL
  scripts/config --enable CONFIG_AUFS_BR_HFSPLUS
  scripts/config --enable CONFIG_AUFS_BDEV_LOOP
  # CONFIG_AUFS_DEBUG is not set

  
  scripts/config --set-str CONFIG_DEFAULT_HOSTNAME "manjaro"

  # Let's user choose microarchitecture optimization in GCC
  sh ${srcdir}/choose-gcc-optimization.sh $_microarchitecture

  # This is intended for the people that want to build this package with their own config
  # Put the file "myconfig" at the package folder to use this feature
  # If it's a full config, will be replaced
  # If not, you should use scripts/config commands, one by line
  if [ -f "${startdir}/myconfig" ]; then
    if ! grep -q 'scripts/config' "${startdir}/myconfig"; then
      # myconfig is a full config file. Replacing default .config
      msg2 "Using user CUSTOM config..."
      cp -f "${startdir}"/myconfig .config
    else
      # myconfig is a partial file. Applying every line
      msg2 "Applying configs..."
      cat "${startdir}"/myconfig | while read -r _linec ; do
        if echo "$_linec" | grep "scripts/config" ; then
          set -- $_linec
          "$@"
        else
          warning "Line format incorrect, ignoring..."
        fi
      done
    fi
    echo
  fi

  make olddefconfig

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
  if [ "$_localmodcfg" = "y" ]; then
    if [ -f $HOME/.config/modprobed.db ]; then
      msg2 "Running Steven Rostedt's make localmodconfig now"
      make LSMOD=$HOME/.config/modprobed.db localmodconfig
    else
      msg2 "No modprobed.db data found"
      exit
    fi
  fi

  make -s kernelrelease > version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"

  [[ -z "$_makenconfig" ]] || make nconfig

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"
}

build() {
  cd linux-${_major}
  make all
}

_package() {
  pkgdesc="The Linux LTS kernel and modules with Xanmod and Manjaro patches (Bootsplash support)"
  depends=('coreutils' 'linux-firmware' 'kmod' 'initramfs' 'mkinitcpio>=27')
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices'
              'bootsplash-systemd: for bootsplash functionality')
  provides=('linux' VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  replaces=()
  conflicts=()

  cd linux-${_major}
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "manjaro-xanmod-LTS" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
  # echo "${_major}-${CARCH}" | install -Dm644 /dev/stdin "$modulesdir/kernelbase"
 
  # add kernel version
  echo "${pkgver}-${pkgrel}-Manjaro-Xanmod-LTS x64" | install -Dm644 /dev/stdin "${pkgdir}/boot/linux-manjaro-xanmod-LTS.kver"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"  
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for linux-manjaro-xanmod-lts kernel"
  provides=('linux-headers')
  replaces=()
  conflicts=()

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

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
