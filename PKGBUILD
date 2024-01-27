# Maintainer:
# Contributor: éclairevoyant
# Contributor: Mark Weiman (markzz) <mark.weiman@markzz.com>
# Contributor: Katelyn Schiesser (slowbro) <katelyn.schiesser@gmail.com>
# Contributor: Dan Ziemba <zman0900@gmail.com>

## options
: ${_build_arch_patch:=true}

: ${_build_clang:=false}
: ${_build_tracer:=true}
: ${_build_numa:=true}

: ${_build_vfio:=true}
: ${_build_lts:=false}
: ${_build_v3:=false}

[[ "${_build_vfio::1}" == "t" ]] && _pkgtype+="-vfio"
[[ "${_build_lts::1}" == "t" ]] && _pkgtype+="-lts"
[[ "${_build_v3::1}" == "t" ]] && _pkgtype+="-v3"

## basic info
_gitname="linux"
_pkgname="$_gitname${_pkgtype:-}"
pkgbase="$_pkgname"
pkgver=6.7.2
pkgrel=1
pkgdesc='Linux'
url='https://www.kernel.org'
arch=(x86_64)
license=(GPL-2.0-or-later)
makedepends=(
  bc
  cpio
  gettext
  libelf
  pahole
  perl
  python
  tar
  xz

  # htmldocs
  graphviz
  imagemagick
  python-sphinx
  texlive-latexextra
)
options=('!strip')
_srcname=linux-$pkgver
source+=(
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  "config-$pkgver"::https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/raw/main/config
)
sha256sums+=(
  'c34de41baa29c475c0834e88a3171e255ff86cd32d83c6bffc2b797e60bfa671'
  'SKIP'
  'SKIP'
)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
  83BC8889351B5DEBBB68416EB8AC08600F108CDF  # Jan Alexander Steffens (heftig)
)

if [[ ${_build_vfio::1} == "t" ]] ; then
  source+=(
    1001-add-acs-overrides.patch # updated from https://lkml.org/lkml/2013/5/30/513
    1002-i915-vga-arbiter.patch  # updated from https://lkml.org/lkml/2014/5/9/517
  )
  sha256sums+=(
    'f342986bd27980c96c952b0dd8103d3e21a942d87f18df1308fab370e20010fb'
    '2a3c732d4d61a631c98b2a3e4afb1fa5dbf8be5c43519b2a59d0e65170c9d8db'
  )
fi

if [[ ${_build_arch_patch::1} == "t" ]] ; then
  _srctag=v${pkgver}-arch1
  _dl_url_arch='https://github.com/archlinux/linux'

  # if no new patch, use previous one
  if grep 404 <(curl -sI $_dl_url_arch/releases/download/$_srctag/linux-$_srctag.patch.zst | head -1) > /dev/null ; then
    _srctag=v${pkgver::4}$(( ${pkgver##*.} -1 ))-arch1
  fi

  source+=(
    $_dl_url_arch/releases/download/$_srctag/linux-$_srctag.patch.zst{,.sig}
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )
fi

if [[ ${_build_clang::1} == "t" ]] ; then
  makedepends+=(clang llvm lld)

  export CC=clang
  export LD=ld.lld
  export AR=llvm-ar
  export NM=llvm-nm
  export STRIP=llvm-strip
  export OBJCOPY=llvm-objcopy
  export OBJDUMP=llvm-objdump
  export READELF=llvm-readelf
  export HOSTCC=clang
  export HOSTCXX=clang++
  export HOSTAR=llvm-ar
  export HOSTLD=ld.lld
  export LLVM=1
  export LLVM_IAS=1

  export CXX=clang++
  export LDFLAGS+=" -fuse-ld=lld"
fi

if [[ "${_build_v3::1}" == "t" ]] ; then
  export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"}

  export RUSTFLAGS+=" -Ctarget-cpu=x86-64-v3"
fi

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

_prepare_extra() {
  # remove extra version suffix
  sed -E 's&^(EXTRAVERSION =).*$&\1&' -i Makefile

  if [[ "${_build_clang::1}" == "t" ]] ; then
    scripts/config --disable LTO_CLANG_FULL
    scripts/config --enable LTO_CLANG_THIN
  fi

  if [[ "${_build_clang::1}" == "t" ]] || [[ "${_build_tracer::1}" != "t" ]] ; then
    echo "Disabling Tracers..."
    scripts/config \
      --disable CONFIG_FTRACE \
      --disable CONFIG_FUNCTION_TRACER \
      --disable CONFIG_STACK_TRACER
  fi

  if [[ "${_build_numa::1}" != "t" ]] ; then
    echo "Disabling NUMA..."
    scripts/config --disable CONFIG_NUMA
  fi
}

prepare() {
  cp "config-$pkgver" "config"

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
    echo
    echo "Applying patch $src..."
    patch -Np1 -F100 -i "../$src"
  done

  echo "Setting config..."
  cp ../config .config
  make olddefconfig
  diff -u ../config .config || :

  _prepare_extra

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make all
  #make htmldocs
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules (ACS override and i915 VGA arbiter patches)"
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

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build link
  rm "$modulesdir"/build
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel (ACS override and i915 VGA arbiter patches)"
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

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel (ACS override and i915 VGA arbiter patches)"

  cd $_srcname
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
  #"$pkgbase-docs"
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
