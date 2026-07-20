# Maintainer:
# Contributor: Andreas Radke <andyrtr@archlinux.org>

## options
: ${_build_level:=1}

: ${_cksum:=a7a7e3d2ae9d95e74197223a8d4eb5f6be7aac21b6e6de27e9685d001c1f8cb0}

_pkgtype="-vfio-lts"
[[ ${_build_level::1} == "2" ]] && _pkgtype+="-x64v2"
[[ ${_build_level::1} == "3" ]] && _pkgtype+="-x64v3"
[[ ${_build_level::1} == "4" ]] && _pkgtype+="-x64v4"

_gitname="linux"
_pkgname="$_gitname${_pkgtype:-}"
pkgbase="$_pkgname"
pkgver=6.18.39
pkgrel=1
pkgdesc='LTS Linux'
url='https://www.kernel.org'
license=('GPL-2.0-or-later')
arch=('x86_64' 'x86_64_v2' 'x86_64_v3' 'x86_64_v4')

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

_get_tags() {
  [ -n "$_srctag" ] && return

  _dl_url_arch='https://gitlab.archlinux.org/archlinux/packaging/packages/linux-lts'
  _srctag=$(
    curl -sSfL --max-redirs 3 --no-progress-meter "$_dl_url_arch/-/tags?sort=updated_desc&search=${pkgver}&format=atom" \
      | grep -Eo "${pkgver//./\\.}-[0-9]+\$" \
      | sort -rV | head -1
  )
  : ${_srctag:=main}
} && _get_tags

_srcname=linux-$pkgver
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar".{xz,sign}
  "config-$pkgver"::"$_dl_url_arch/-/raw/$_srctag/config.x86_64"
  "0001-$pkgver-allow-disabling-unprivileged-CLONE_NEW.patch"::"$_dl_url_arch/-/raw/$_srctag/0001-add-sysctl-to-allow-disabling-unprivileged-CLONE_NEW.patch"
  "0002-$pkgver-drm-amdgpu-avoid-memory-allocation.patch"::"$_dl_url_arch/-/raw/$_srctag/0002-drm-amdgpu-avoid-memory-allocation-in-the-critical-c.patch"
  "0003-$pkgver-drm-amdgpu-use-GFP_ATOMIC.patch"::"$_dl_url_arch/-/raw/$_srctag/0003-drm-amdgpu-use-GFP_ATOMIC-instead-of-NOWAIT-in-the-c.patch"
  1001-6.14.0-add-acs-overrides.patch # updated from https://lkml.org/lkml/2013/5/30/513
  1002-6.18.0-i915-vga-arbiter.patch  # updated from https://lkml.org/lkml/2014/5/9/517
)
sha256sums=(
  "${_cksum:?}"
  'SKIP'
  'SKIP'
  '0bb3b4cda53db35c10e0a34defb5f52f3c91895d7b4a9f93b3f40f5401a71e02'
  '70d54dfde13e52ea1109c4222a987a29ada68feec35dca9ce4afd6f7977e8740'
  '44caa7c6a79055539f16ab118bece58934cdf93557643a50017634366c864b91'
  '6bca6264da6717402ec89ec5ed06b8997fe3df7a20a3a57eb5a85f64e12bc396'
  '323fc06392a6c10d7eb3d844cde527fa7709c82f776238cebc98d8c966b06549'
)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886 # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E # Greg Kroah-Hartman
  83BC8889351B5DEBBB68416EB8AC08600F108CDF # Jan Alexander Steffens (heftig)
)

case "$CARCH" in
  x86_64_v2)
    _build_level=2
    ;;
  x86_64_v3)
    _build_level=3
    ;;
  x86_64_v4)
    _build_level=4
    ;;
  *) # no changes; may be user defined
    ;;
esac

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
    echo "Applying patch $src..."
    patch -Np1 -F100 -i "../$src"
    echo
  done

  echo "Setting config..."
  cp ../config .config
  make olddefconfig
  diff -u ../config .config || :

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
    'linux-firmware: firmware images needed for some devices'
    'scx-scheds: to use sched-ext schedulers'
    'wireless-regdb: to set the correct wireless channels of your country'
  )
  provides=(
    KSMBD-MODULE
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

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux tools/bpf/bpftool/vmlinux.h
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts
  ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

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

  echo "Installing Rust files..."
  install -Dt "$builddir/rust" -m644 rust/*.rmeta
  install -Dt "$builddir/rust" rust/*.so

  echo "Installing unstripped VDSO..."
  make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install \
    link= # Suppress build-id symlinks

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
      application/x-sharedlib\;*) # Libraries (.so)
        strip -v $STRIP_SHARED "$file"
        ;;
      application/x-archive\;*) # Libraries (.a)
        strip -v $STRIP_STATIC "$file"
        ;;
      application/x-executable\;*) # Binaries
        strip -v $STRIP_BINARIES "$file"
        ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file"
        ;;
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
