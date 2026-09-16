# Maintainer: Charles Leclerc <charles@la-mouette.net>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgbase=linux-lts-bnx2x-2.5g
pkgver=6.18.52
pkgrel=1
pkgdesc='LTS Linux'
url='https://www.kernel.org'
arch=(
  x86_64
)
makedepends=(
  bc
  binutils
  cpio
  gettext
  glibc
  libelf
  libgcc
  openssl
  pahole
  perl
  python
  rust
  rust-bindgen
  rust-src
  tar
  xxhash
  xz
  zlib
  zstd

)
options=(
  !debug
  !strip
)
_srcname=linux-$pkgver
_srctag=v$pkgver
source=(
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  "bnx2x_warpcore+8727_2_5g_sgmii_arch.patch"
  0001-add-sysctl-to-allow-disabling-unprivileged-CLONE_NEW.patch
  0002-drm-amdgpu-avoid-memory-allocation-in-the-critical-c.patch
  0003-drm-amdgpu-use-GFP_ATOMIC-instead-of-NOWAIT-in-the-c.patch
)
source_x86_64=(config.x86_64)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
)
sha256sums=('2b69564f7d4fea0c859b1959ba33709ee6e9139bd100e30a853b57159a8221b8'
            'SKIP'
            'd655669179109ae8e801a259c35dbe442ca67a49b9ceb6ca3ef0e56f48149a7d'
            '0bb3b4cda53db35c10e0a34defb5f52f3c91895d7b4a9f93b3f40f5401a71e02'
            '70d54dfde13e52ea1109c4222a987a29ada68feec35dca9ce4afd6f7977e8740'
            '44caa7c6a79055539f16ab118bece58934cdf93557643a50017634366c864b91')
sha256sums_x86_64=('cae2e08627f52db3ac00e657012bb50888809a64158361f56be307f9f6fe74bc')
b2sums=('95c9e70fd75f638c992a04dbcc77336722e905e1675758ca38016b4ac29e04b0af872a539505bc6a715543544fd53abe206db60bacdc0730981a12136661215c'
        'SKIP'
        '94fd2e2fa31da0ce9d04e639b0fafc37128ad2f01f8ee38708c7128fdc1568e491aca9a8296316b0736f134dc7697b573e8203018d92c1e9b6ff40648501607a'
        'f98f4a2e714f7c9e05740caaad2bf014065ec950c096df74a3dee8b2ce6549f034adf6f87a76168f513aa68eb738edbdb6fe1a3f1b3a5104201c65199b5b931e'
        '6ca246df80fa85f9c21d090f87ee31e33acb02f3c1147944750e0896ebf199bc0cf427a164dacbdd9baa26dbdbce2fabd89ebdb6a8ce5dae83fc455b27a56cc8'
        'a612d5ea58485eeaa5cce0b30074ab3188f4321c4759448780de2f3f656821356d640df433e31bd4e8f2c9719c8e275374ddea29b9504335ed0981be5ac7bf7b')
b2sums_x86_64=('1e8d313f3decf80eee833951bd64a25eb7419248f88fa19372ffb84b336d92595eb7ede4e7d3bd312a403b5e6d6ff8e695aa208e2e354a111a5b100cbcf5ddb4')
# https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
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
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config.$CARCH .config
  make olddefconfig
  diff -u ../config.$CARCH .config || :
 
  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname

  make htmldocs SPHINXOPTS=-QT &
  local pid_docs=$!

  make -j 8 all
  make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
  wait $pid_docs
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules with 2.5G patch for bnx2x module"
  license=(
    'Apache-2.0 OR MIT'

    'BSD-2-Clause OR GPL-2.0-or-later'

    BSD-3-Clause
    'BSD-3-Clause OR GPL-2.0-only'
    'BSD-3-Clause OR GPL-2.0-or-later'
    BSD-3-Clause-Clear

    GPL-1.0-or-later
    'GPL-1.0-or-later OR BSD-3-Clause'

    GPL-2.0-only
    'GPL-2.0-only OR Apache-2.0'
    'GPL-2.0-only OR BSD-2-Clause'
    'GPL-2.0-only OR BSD-3-Clause'
    'GPL-2.0-only OR CDDL-1.0'
    'GPL-2.0-only OR Linux-OpenIB'
    'GPL-2.0-only OR MIT'
    'GPL-2.0-only OR MPL-1.1'
    'GPL-2.0-only OR X11'
    'GPL-2.0-only WITH Linux-syscall-note'

    GPL-2.0-or-later
    'GPL-2.0-or-later OR BSD-2-Clause'
    'GPL-2.0-or-later OR BSD-3-Clause'
    'GPL-2.0-or-later OR MIT'
    'GPL-2.0-or-later OR X11'
    'GPL-2.0-or-later WITH GCC-exception-2.0'

    ISC

    LGPL-2.0-or-later
    'LGPL-2.1-only'
    'LGPL-2.1-only OR BSD-2-Clause'

    LGPL-2.1-or-later

    MIT
    MPL-1.1
    X11
    Zlib
  )
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
  replaces=(
    wireguard-lts
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

  # licenses
  install -vDm 644 LICENSES/deprecated/{GPL-1.0,ISC,Linux-OpenIB,X11,Zlib} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/preferred/{BSD,MIT}* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/exceptions/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel with 2.5G patch for bnx2x module"
  license=(
    BSD-3-Clause
    'BSD-3-Clause OR GPL-2.0-only'

    GPL-1.0-or-later
    'GPL-1.0-or-later WITH Linux-syscall-note'

    GPL-2.0-only
    'GPL-2.0-only OR Apache-2.0'
    'GPL-2.0-only OR BSD-2-Clause'
    'GPL-2.0-only OR BSD-3-Clause'
    'GPL-2.0-only OR CDDL-1.0'
    'GPL-2.0-only OR Linux-OpenIB'
    'GPL-2.0-only OR Linux-OpenIB OR BSD-2-Clause'
    'GPL-2.0-only OR MIT'
    'GPL-2.0-only OR MPL-1.1'
    'GPL-2.0-only OR X11'
    'GPL-2.0-only WITH Linux-syscall-note'
    '(GPL-2.0-only WITH Linux-syscall-note) AND MIT'
    '(GPL-2.0-only WITH Linux-syscall-note) OR BSD-2-Clause'
    '(GPL-2.0-only WITH Linux-syscall-note) OR BSD-3-Clause'
    '(GPL-2.0-only WITH Linux-syscall-note) OR CDDL-1.0'
    '(GPL-2.0-only WITH Linux-syscall-note) OR Linux-OpenIB'
    '(GPL-2.0-only WITH Linux-syscall-note) OR MIT'

    GPL-2.0-or-later
    'GPL-2.0-or-later OR BSD-2-Clause'
    'GPL-2.0-or-later OR BSD-3-Clause'
    'GPL-2.0-or-later OR MIT'
    'GPL-2.0-or-later WITH Linux-syscall-note'
    '(GPL-2.0-or-later WITH Linux-syscall-note) OR BSD-3-Clause'
    '(GPL-2.0-or-later WITH Linux-syscall-note) OR MIT'
    'LGPL-2.0-or-later OR BSD-2-Clause'
    'LGPL-2.0-or-later WITH Linux-syscall-note'

    ISC

    'LGPL-2.0-or-later WITH Linux-syscall-note'
    'LGPL-2.0-or-later OR BSD-2-Clause'

    LGPL-2.1-only
    'LGPL-2.1-only OR BSD-2-Clause'
    'LGPL-2.1-only OR MIT'
    'LGPL-2.1-only WITH Linux-syscall-note'

    LGPL-2.1-or-later
    'LGPL-2.1-or-later OR BSD-2-Clause'
    'LGPL-2.1-or-later WITH Linux-syscall-note'

    MIT
    Zlib
  )
  depends=(
    binutils
    glibc
    libelf
    libgcc
    openssl
    pahole
    xxhash
    zlib
    zstd
  )
  provides=(LINUX-HEADERS)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  local karch
  case $CARCH in
    x86_64) karch=x86 ;;
    *) echo "Unknown CARCH $CARCH"; exit 1 ;;
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

  if [[ $(scripts/config -s CONFIG_RUST) = y ]]; then
    echo "Installing Rust files..."
    install -Dt "$builddir/rust" -m644 rust/*.rmeta
    install -Dt "$builddir/rust" rust/*.so
  fi

  echo "Installing unstripped VDSO..."
  make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install \
    link=  # Suppress build-id symlinks

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

  # licenses
  install -vDm 644 LICENSES/deprecated/{ISC,Linux-OpenIB,X11,Zlib} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/preferred/{BSD*,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/exceptions/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}


pkgname=(
  "$pkgbase"
  "$pkgbase-headers"
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
