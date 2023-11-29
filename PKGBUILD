# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Luna D. Dragon (nullrequest) <nullreques [@] vivaldi.net>
# Maintainer: memchr <memchr@proton.me>

# shellcheck disable=SC2034,SC1091,SC2148,SC2155,SC2154
# Use build.conf to override default build options
source default.conf || { echo "needs default.conf"; exit 1; }
[[ -e options.conf ]] && source options.conf
echo -e "\
:: The build and source options can be configurated with 
   options.conf, see default.conf for the available options
   and their defaults" 1>&2
#######

pkgbase="${_kernel_name}"
pkgver=6.6.3.arch1
pkgrel=1
pkgdesc='Linux'
_srctag=v${pkgver%.*}-${pkgver##*.}
url="https://github.com/archlinux/linux/commits/$_srctag"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc
  cpio
  gettext
  git
  libelf
  pahole
  perl
  python
  tar
  xz
)
(( _use_clang )) && \
makedepends+=(
  clang
  llvm
  lld
)
(( _build_docs )) && \
makedepends+=(
  graphviz
  imagemagick
  python-sphinx
  texlive-latexextra
)
options=('!strip')
if (( _use_tarball)); then
  _srcname="linux-${pkgver%.*}-${pkgver##*.}"
  source=(
    "https://github.com/archlinux/linux/archive/refs/tags/${_srctag}.tar.gz"
  )
else
  _srcname="archlinux-linux"
  source=(
    "$_srcname::git+https://github.com/archlinux/linux?signed#tag=$_srctag"
  )
fi
source+=(config) # the main kernel config file
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
  A2FF3A36AAA56654109064AB19802F8B0D70FC30  # Jan Alexander Steffens (heftig)
)
b2sums=('SKIP'
        'SKIP')

## update pkgver and pkgrel
pkgver="${_pkgver:-$pkgver}"
pkgrel="${_pkgrel:-$pkgrel}"

## Kernel optitmization
_kcflags=(
  "$_optimization"
  "-pipe"
)
if [[ -n "$_march" ]]; then
  _kcflags+=(-march="$_march")
fi

## ccache
if command -v ccache > /dev/null; then
  export CCACHE_NOHASHDIR=1
  export CCACHE_BASEDIR="$PWD/src/$_srcname"
  _kcflags+=(-fdebug-prefix-map=$PWD/src/$_srcname=.)
fi

if (( _use_ccache )) && [[ -d /usr/lib/ccache ]]; then
  export PATH="/usr/lib/ccache/bin:$PATH"
fi

## build information
echo -n "\
:: Source Options
    Source Type = $( ((_use_tarball)) && echo tarball || echo git)
:: Build Options
    Kernel Name = $_kernel_name
    pkgver      = $pkgver
    pkgrel      = $pkgrel
    Compiler    = $( ((_use_clang)) && echo clang || echo gcc )
    LTO         = $( ((_use_clang)) && echo thin || echo none )
    KCFLAGS     = \"${_kcflags[@]}\"
    Build docs  = $( (( _build_docs )) && echo yes || echo no )
    Make jobs   = $_make_jobs
    ccache      = $( (( _use_ccache )) && echo yes || echo no )
" 1>&2
_buildinfo="$_optimization target:$([[ -n $_march ]] && echo $_march || echo generic) compiler:$( ((_use_clang)) && echo clang )"

## 
export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

_make() {
  test -s version
  make -j "$_make_jobs" LLVM="$_use_clang" LLVM_IAS="$_use_clang" KCFLAGS="${_kcflags[*]}" KERNELRELEASE="$(<version)" "$@"
}

prepare() {
  cd "$_srcname" || { echo "source not found"; exit 1; }

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname
  make defconfig
  make -s kernelrelease > version
  make mrproper

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config .config

  # Enable LTO for clang build
  if (( _use_clang )); then
    scripts/config \
      -d LTO_NONE \
      -e HAS_LTO_CLANG \
      -e LTO_CLANG_THIN
  fi

  if (( _use_menuconfig )); then
    _make menuconfig
  else
    _make olddefconfig
  fi
  diff -u ../config .config || :

  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd "$_srcname" || { echo "source not found"; exit 1; }
  _make all
  if (( _build_docs )); then
    _make htmldocs
  fi
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules ($_buildinfo)"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed for some devices'
  )
  provides=(
    KSMBD-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )
  replaces=(
    virtualbox-guest-modules-arch
    wireguard-arch
  )

  cd "$_srcname" || { echo "source not found"; exit 1; }
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(_make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 _make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build and source links
  rm -rf "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel ($_buildinfo)"
  depends=(pahole)

  cd "$_srcname" || { echo "source not found"; exit 1; }
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
    rm -rf "$arch"
  done

  echo "Removing documentation..."
  rm -rf "$builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -Sib "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v "$STRIP_SHARED" "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v "$STRIP_STATIC" "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v "$STRIP_BINARIES" "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v "$STRIP_SHARED" "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Stripping vmlinux..."
  strip -v "$STRIP_STATIC" "$builddir/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"

  cd "$_srcname" || { echo "source not found"; exit 1; }
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"
}

pkgname=(
  "$pkgbase"
  "$pkgbase-headers"
)
(( _build_docs )) && pkgname+=("$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#"$pkgbase"}")
    _package${_p#"$pkgbase"}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
