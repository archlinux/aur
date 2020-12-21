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
pkgver=5.10.1
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
_bmqversion=5.10-r0
_bmq_patch="prjc_v${_bmqversion}.patch"
_gcc_more_v='20201113'
source=(
  "https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar".{xz,sign}
  "config::https://raw.githubusercontent.com/archlinux/svntogit-packages/524ec207393b88f18d32d8fdb9ed13d558e4d3e7/linux/repos/testing-x86_64/config"
  "${_bmq_patch}::https://gitlab.com/alfredchen/projectc/raw/master/${_bmqversion%-*}/${_bmq_patch}"
  "enable_additional_cpu_optimizations-${_gcc_more_v}.tar.gz::https://github.com/graysky2/kernel_gcc_patch/archive/${_gcc_more_v}.tar.gz"
  "v5.10-prjc-r0_compilation_error_error_static_declaration.patch::https://gitlab.com/alfredchen/linux-prjc/-/commit/570d8c5b6f7439217b45906568adddb0a6cc2751.patch"
  "0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch::https://git.archlinux.org/linux.git/patch/?id=e25c86d5689203c0d8f5f4dffb1f616def7c2c74"
  "0002-Bluetooth_Fix_LL_PRivacy_BLE_device_fails_to_connect.patch::https://git.archlinux.org/linux.git/patch/?id=cdddb7037bf1af7c2a062a0bc2750ae560301776"
  "0003-Bluetooth_Fix_attempting_to_set_RPA_timeout_when_uns.patch::https://git.archlinux.org/linux.git/patch/?id=8380c14bc1f6d25d24f848d313ed66550c2ce6b4"
  "0004-HID_quirks_Add_Apple_Magic_Trackpad_2_to_hid_have_sp.patch::https://git.archlinux.org/linux.git/patch/?id=a7eb8bbced1623795c4ad56da1e30c7ee849546f"
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30'  # Jan Alexander Steffens (heftig)
)
b2sums=('d965795fdd5fa6f6cddbd86c4b7af9cfafe9022cae1c149a1326c90b9fdddbd7ebf83465c7b04d227418ba19c3b7af99d9a47b2616df2f83ec92fe7c9306f935'
        'SKIP'
        '13de49afadbd05fa02428c1efcb49a237f7145bce901fc7a4bb0cafb4cb89b0e0b53d98ca7e4800677f0265e899ff2116143c433e9690cd4219182b150d8bcc9'
        'fcab79bd6ba6d7525c3fe5c1cdd6db601447f03cc55e34e1e4abf708dd08b4a5349742797e8dc21c5dffddb469b9c5b8249eaa20c948dcbc88b27f6193bcfac9'
        '7f1eb5938472f57748216bd00e0c875feab99fc1c5cb89babfea467ee30ca5c8e9fc5a691efe2e602bef1ea79820c5383822d7cec354b48d23321ccda8ee8127'
        '782193f86faa6bbbef4f9e0c70c2340507b611263dd88afd5aacc1965c0bd51ebc3ebc3f8fa43ea2aa3d2946d5dc47dd6f74197383031d7d219e2c4e691fa4ba'
        '36eafca96231f50eafa8f9b734bffb5392bb82d9667650211f8f237c4c46448898b6f40feeba295048dd2dd7c5ef46a254a0e64a322cc2caada67b7db1d40b81'
        '475ff92bb435c64921c0e0702d727737e4813eddd86b0182606396b514692b46ea8565989228ea80a026c8fc01020f6bbe00dff17698a79477d510a2476777ca'
        '895b81b243d4499c539b881fe9eb2c0463035b3e39f224ee2c613b508ec740e63f374fe96401faae3cefe2bf26d3dc974e2bbf863c1f74a3f7197d4ece49daba'
        '182eadac47eb39c7636e7d3015794faace0a83a75b5b5eff03a464c4624fc271c64f695b11f374f9191df6d97ed3bd90ddae560a0c18382690e3b18f8e821e60')

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
#  sed -i '/^CONFIG_INIT_ENV_ARG_LIMIT=.*/a CONFIG_SCHED_BMQ=y' .config

  # disable CONFIG_DEBUG_INFO=y at build time introduced in this commit
  # https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/linux&id=663b08666b269eeeeaafbafaee07fd03389ac8d7
  sed -i -e 's/CONFIG_DEBUG_INFO=y/# CONFIG_DEBUG_INFO is not set/' \
      -i -e '/CONFIG_DEBUG_INFO_DWARF4=y/d' -i -e '/CONFIG_DEBUG_INFO_BTF=y/d' ./.config

  echo "Applying patch ${_bmq_patch}..."
  patch -Np1 -i "$srcdir/${_bmq_patch}"
  patch -Np1 -i "$srcdir/v5.10-prjc-r0_compilation_error_error_static_declaration.patch"

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
