# Maintainer: Alexey Rychkov <dev at nightfog.net>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

# Arch Linux kernel source
_ver=6.1.arch1
_srcname=archlinux-linux
_srcurl="https://github.com/archlinux/linux.git"
# Bcachefs kernel source
_bcachefstag=v6.1
_bcachefsname=bcachefs-linux
_bcachefsurl="https://evilpiepirate.org/git/bcachefs.git"

pkgbase=linux-simple-bcachefs-git
pkgver=6.1.arch1.r1813
pkgrel=1
pkgdesc='Linux'
_srctag=v${_ver%.*}-${_ver##*.}
url="https://github.com/archlinux/linux/commits/$_srctag"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc libelf pahole cpio perl tar xz
  git
)
options=('!strip')
source=(config         # the main kernel config file
)
sha256sums=('0571ea17a2e38458096b679418197bbea8c414388f628d122517f3a1f3a31b3a'
)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  local bcachefspatch="${srcdir}/bcachefs.patch"
  echo "Extracting ${_bcachefsname} tree..."
  (
    cd "${srcdir}/$_bcachefsname" &&
    git fetch --depth 1 "$_bcachefsurl" "$_bcachefstag" "+refs/tags/${_bcachefstag}:refs/tags/${_bcachefstag}" &&
    git checkout FETCH_HEAD
  ) || (
    cd "$srcdir" &&
    rm -rf "$_bcachefsname" &&
    git clone --depth 1 --branch "$_bcachefstag" "$_bcachefsurl" "$_bcachefsname"
  )

  cd "${srcdir}/$_bcachefsname"
  local version1="$(grep -m 1 -E "^VERSION\s*=\s*[0-9]+\s*$" Makefile | sed -e "s/[^0-9]//g")"
  local patchlevel1="$(grep -m 1 -E "^PATCHLEVEL\s*=\s*[0-9]+\s*$" Makefile | sed -e "s/[^0-9]//g")"

  echo "Extracting bcachefs patch..."
  git fetch --shallow-exclude="$_bcachefstag" "$_bcachefsurl"
  local gitMakefile="$(git show FETCH_HEAD:Makefile)"
  local version2="$(echo "$gitMakefile" | grep -m 1 -E "^VERSION\s*=\s*[0-9]+\s*$" | sed -e "s/[^0-9]//g")"
  local patchlevel2="$(echo "$gitMakefile" | grep -m 1 -E "^PATCHLEVEL\s*=\s*[0-9]+\s*$" | sed -e "s/[^0-9]//g")"

  if test "$version1" != "$version2" || test "$patchlevel1" != "$patchlevel2"; then
    echo "Expected version is ${version1}.${patchlevel1}, but bcachefs git version is ${version2}.${patchlevel2}. Stopping."
    exit 1;
  fi
  git diff HEAD FETCH_HEAD > "$bcachefspatch"

  echo "Extracting ${_srcname} tree..."
  (
    cd "${srcdir}/$_srcname" &&
    make mrproper &&
    git fetch --depth 1 "$_srcurl" "$_srctag" "+refs/tags/${_srctag}:refs/tags/${_srctag}" &&
    git checkout -f FETCH_HEAD && git clean -fdxq
  ) || (
    cd "$srcdir" &&
    rm -rf "$_srcname" &&
    git clone --depth 1 --branch "$_srctag" "$_srcurl" "$_srcname"
  )
  cd "${srcdir}/$_srcname"

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
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

  echo "Applying patch bcachefs.patch..."
  patch -Np1 < "$bcachefspatch"

  cd "${srcdir}/$_srcname"

  echo "Setting config..."
  cp ../config .config
  printf '%s\n%s\n%s\n%s\n%s\n' \
    "CONFIG_BCACHEFS_FS=y" \
    "CONFIG_BCACHEFS_QUOTA=y" \
    "CONFIG_BCACHEFS_POSIX_ACL=y" \
    "# CONFIG_BCACHEFS_DEBUG is not set" \
    "# CONFIG_BCACHEFS_TESTS is not set" >> .config
  make olddefconfig
  diff -u ../config .config || :

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

pkgver() {
  cd "$_bcachefsname"
  printf "%s.r%s" "$_ver" "$(git rev-list --count FETCH_HEAD)"
}

build() {
  cd $_srcname
  make all
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules with bcachefs support"
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
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel with bcachefs support"
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
  install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

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

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
