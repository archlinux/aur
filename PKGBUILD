# Maintainer:
# Contributor: éclairevoyant
# Contributor: Mark Weiman (markzz) <mark.weiman@markzz.com>
# Contributor: Katelyn Schiesser (slowbro) <katelyn.schiesser@gmail.com>
# Contributor: Dan Ziemba <zman0900@gmail.com>

## options
: ${_build_arch_patch:=true}

: ${_build_vfio:=true}
: ${_build_lts:=false}

: ${_build_level:=1}

: ${_cksum=aada4722db8bcfa0b9732851856d405082b6a4fa2e3ab067be8db17cdd115b38}

unset _pkgtype
[[ ${_build_vfio::1} == "t" ]] && _pkgtype+="-vfio"
[[ ${_build_lts::1} == "t" ]] && _pkgtype+="-lts"
[[ ${_build_level::1} == "2" ]] && _pkgtype+="-x64v2"
[[ ${_build_level::1} == "3" ]] && _pkgtype+="-x64v3"
[[ ${_build_level::1} == "4" ]] && _pkgtype+="-x64v4"

_gitname="linux"
_pkgname="$_gitname${_pkgtype:-}"
pkgbase="$_pkgname"
pkgver=6.19.8
pkgrel=1
pkgdesc='Linux'
url='https://www.kernel.org'
license=('GPL-2.0-or-later')
arch=('x86_64')

makedepends=(
  bc
  cpio
  gettext
  libelf
  pahole
  perl
  python
  rust
  rust-bindgen
  rust-src
  tar
  xz

  # htmldocs
  graphviz
  imagemagick
  python-sphinx
  python-yaml
  texlive-latexextra
)

options=('!debug' '!strip')

_dl_url_arch='https://gitlab.archlinux.org/archlinux/packaging/packages/linux'
_srctag=$(
  curl -sSfL --max-redirs 3 --no-progress-meter "$_dl_url_arch/-/tags?sort=updated_desc&search=${pkgver}&format=atom" \
    | grep -Eo "${pkgver//./\\.}.arch[0-9]+-[0-9]+" \
    | sort -rV | head -1
)
: ${_srctag:=main}

_srcname=linux-$pkgver
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar".{xz,sign}
  "config-$pkgver"::"$_dl_url_arch/-/raw/$_srctag/config.x86_64"
)
sha256sums=(
  "${_cksum:-SKIP}"
  'SKIP'
  'SKIP'
)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886 # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E # Greg Kroah-Hartman
  83BC8889351B5DEBBB68416EB8AC08600F108CDF # Jan Alexander Steffens (heftig)
)

if [[ "${_build_vfio::1}" == "t" ]]; then
  source+=(
    1001-6.14.0-add-acs-overrides.patch # updated from https://lkml.org/lkml/2013/5/30/513
    1002-6.18.0-i915-vga-arbiter.patch  # updated from https://lkml.org/lkml/2014/5/9/517
  )
  sha256sums+=(
    '6bca6264da6717402ec89ec5ed06b8997fe3df7a20a3a57eb5a85f64e12bc396'
    '323fc06392a6c10d7eb3d844cde527fa7709c82f776238cebc98d8c966b06549'
  )
fi

if [[ "${_build_arch_patch::1}" == "t" ]]; then
  [[ ${pkgver} =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] && _pkgver=${pkgver%.*}

  _dl_url_arch='https://github.com/archlinux/linux'
  _srctag=$(
    curl -sSfL --max-redirs 3 --no-progress-meter "$_dl_url_arch/tags.atom" \
      | grep -Eom1 "v${_pkgver}\S*-arch[0-9]+" \
      | sort -rV | head -1
  )
  : ${_srctag:=v${pkgver}-arch1}

  source+=(
    $_dl_url_arch/releases/download/$_srctag/linux-$_srctag.patch.zst{,.sig}
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )
fi

if [[ ${_build_level::1} =~ ^[2-4]$ ]]; then
  export KCFLAGS="-march=x86-64-v${_build_level::1} -O3"
fi

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

_prepare_extra() {
  # remove extra version suffix
  sed -E 's&^(EXTRAVERSION =).*$&\1&' -i Makefile
}

prepare() {
  cp "config-$pkgver" "config.$CARCH"

  cd $_srcname

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 -F100 -i "../$src"
    echo
  done

  echo "Setting config..."
  cp ../config.$CARCH .config
  make olddefconfig
  diff -u ../config.$CARCH .config || :

  _prepare_extra

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(< version)"
}

build() {
  cd $_srcname
  make all
  make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
  #make htmldocs SPHINXOPTS=-QT
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules (ACS override and i915 VGA arbiter patches)"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    "$pkgbase-headers: headers and scripts for building modules"
    'linux-firmware: firmware images needed for some devices'
    'scx-scheds: to use sched-ext schedulers'
    'wireless-regdb: to set the correct wireless channels of your country'
  )
  provides=(
    KSMBD-MODULE
    NTSYNC-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(< version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install # Suppress depmod

  # remove build link
  rm "$modulesdir"/build
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel (ACS override and i915 VGA arbiter patches)"
  depends=(pahole)
  provides=(LINUX-HEADERS)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(< version)/build"

  local karch
  case $CARCH in
    x86_64) karch=x86 ;;
    *)
      echo "Unknown CARCH $CARCH"
      exit 1
      ;;
  esac

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux tools/bpf/bpftool/vmlinux.h
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/$karch" -m644 arch/$karch/Makefile
  cp -t "$builddir" -a scripts
  ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

  if [[ $(scripts/config -s CONFIG_HAVE_STACK_VALIDATION) = y ]]; then
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool
  fi

  if [[ $(scripts/config -s CONFIG_DEBUG_INFO_BTF_MODULES) = y ]]; then
    install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
  fi

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/$karch" -a arch/$karch/include
  install -Dt "$builddir/arch/$karch/kernel" -m644 arch/$karch/kernel/asm-offsets.s

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

  echo "Installing Rust files..."
  if [[ $(scripts/config -s CONFIG_RUST) = y ]]; then
    install -Dt "$builddir/rust" -m644 rust/*.rmeta
    install -Dt "$builddir/rust" rust/*.so
  fi

  echo "Installing unstripped VDSO..."
  make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install \
    link= # Suppress build-id symlinks

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */$karch/ ]] && continue
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
      application/x-sharedlib\;*) # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*) # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*) # Binaries
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

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel (ACS override and i915 VGA arbiter patches)"

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(< version)/build"

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
  #"$pkgbase-docs"
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
