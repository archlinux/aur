# Maintainer: David Cohen <dacohen@pm.me>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

# This PKGBUILD script and the config file are based on official Arch's linux package
# Refer to config file to get the exact versions it's based on. Any changes to the config
# will be on config.extra file.

pkgbase=linux-mainline-git
pkgver=v6.2.r12913.ae3419fbac84
pkgrel=1
pkgdesc="Linus Torvalds' Mainline Linux"
url="https://www.kernel.org"
arch=(x86_64)
license=(GPL2)
_userconfig="/etc/${pkgbase}/config"
_userremote="/etc/${pkgbase}/remote"
_userpatches="/etc/${pkgbase}/patches/patches"
backup=(
"${_userconfig##/}"
"${_userremote##/}"
"${_userpatches##/}"
)
makedepends=(
  bc libelf pahole cpio perl tar xz gettext
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git
)
options=('!strip')
_srcname=linux-torvalds
source=(
  "$_srcname::git+https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux"
  config         # the main kernel config file
  config.extra   # additional configs
  config.user    # user custom config
  remote         # custom remote config
  patches        # user patches config
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('SKIP'
            'a80dfd64eca60673422052ac4d1444b0f9495a588c2595d413fd0687f3786586'
            'fc79857b9e1ee563db99f29db6cb8ae31e72b35965dd551fc8dd77705630ccf8'
            'b5ced6ad1f03a5cfe6dccc0b2b31f91420cfe97823e5d15d5b94b7224362daa9'
            'b5560bc5fb8967aec989b757af8eb4d2f5166a830abb732c8c880fb953dcb52f'
            '986e39ee1cb41d342b19f1c5af8016d48afa1e182237dbdcc3f222ae4203ef2d')


export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

pkgver() {
  cd "$srcdir/$_srcname"
  if [[ -n "$REMOTE_URL" ]]; then
    # if $REMOTE_URL was created, it's safe to use $REMOTE
    printf "%s" "$(git describe --dirty=-patched --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g').${REMOTE/\//.}"
  else
    printf "%s" "$(git describe --dirty=-patched --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
  fi
}

prepare() {
  cd $_srcname

  [[ -f "$_userremote" ]] && source "$_userremote"
  if [[ -n "$REMOTE" && -n "$COMMIT" ]]; then
    REMOTE_PREFIX=${source[0]##${_srcname}::git+}
    REMOTE_PREFIX=${REMOTE_PREFIX%%torvalds/linux}
    REMOTE_URL=${REMOTE_PREFIX}${REMOTE}
    echo
    echo "================================================================================"
    echo "Build script detected custom variables \$REMOTE and \$COMMIT are being used:"
    echo "REMOTE_PREFIX: $REMOTE_PREFIX"
    echo "REMOTE_TIP   : $REMOTE"
    echo "COMMIT       : $COMMIT"
    echo "================================================================================"
    echo
    echo "Fetching ${REMOTE_PREFIX}${REMOTE} ${COMMIT}"
    git fetch -t ${REMOTE_URL} ${COMMIT}
    git checkout -f FETCH_HEAD
  fi

  echo "Setting version..."
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

  [[ -f "$_userpatches" ]] && source "$_userpatches"
  PATCHES_PREFIX=${_userpatches%%patches}
  _USER_PATCHES="0"
  for src in "${PATCHES}"; do
    [[ $src = *.patch ]] || continue
    echo "Applying user patch $src..."
    patch -Np1 < "${PATCHES_PREFIX}$src"
    _USER_PATCHES="1"
  done

  # Let user see the patches were applied before proceed with the build
  [[ ${_USER_PATCHES} = "1" ]] && sleep 2

  echo "Setting config..."
  cat ../config ../config.extra > .config
  if [[ -f "$_userconfig" ]]; then
    cat $_userconfig >> .config
  fi
  make olddefconfig
  diff -u ../config .config || :

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make all
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('wireless-regdb: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)
  replaces=(virtualbox-guest-modules-arch wireguard-arch)

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
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build and source links
  rm "$modulesdir"/{source,build}

  # install config files
  install -Dm644 $srcdir/config.user "${pkgdir}${_userconfig}"
  install -Dm644 $srcdir/remote "${pkgdir}${_userremote}"
  install -Dm644 $srcdir/patches "${pkgdir}${_userpatches}"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=(pahole)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  if [[ -f "$builddir/tools/bpf/resolve_btfids" ]]; then
    install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
  fi

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
    case "$(file -Sbi "$file")" in
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

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
