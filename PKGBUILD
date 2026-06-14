# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jared Van Bortel <cebtenzzre (at) gmail (dot) com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgbase=linux-lts612
pkgver=6.12.93
pkgrel=1
pkgdesc="LTS ${pkgver%.*} Linux"
url='https://www.kernel.org'
arch=(x86_64)
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
  python-yaml
  texlive-latexextra
)
options=('!debug' '!strip')
_srcname="linux-$pkgver"
_srctag="v$pkgver"
source=(
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  0002-Default-to-maximum-amount-of-ASLR-bits.patch
  0003-skip-simpledrm-if-nvidia-drm.modeset=1-is.patch
  '0004-perl-5.41-precedence-warning-kernel-doc.patch'
  config  # the main kernel config file
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
# https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
md5sums=('914ba3fae0331595f99c129161df3573'
         'SKIP'
         '6e12aeef82de5db1f202eede9ace645e'
         '0ec6fa86283fd967c86e22c5f84616d2'
         '8dc9cab39152a3c147c353ae6c2680c4'
         '5942163730c4ccde467e29a9cd4b4002'
         '030378d63753e2d818f01e0c53fb8e17')
sha256sums=('492648a87c0b69c5ac7f43be64792b9000e3439550d4e82e4a14710c49094fa3'
            'SKIP'
            '3cf389ced2b40e6457421cb27892bf126b73032fbf1de895ecc37b13d981a17c'
            '423b2c6fbc8d6df79997550bef1b1e4f6f402b668007d150013623a83a12b49e'
            '596f8e0aef1df72a84685e8f2b8a9dde7e33b513de555fae6069ba652cbd00c1'
            '93c42d3278164a2eaef767a43bc1fd71b452090eb361ca09b52b849338f7e3f3'
            'd117688f056c8e01d2a0fc853b77e9640036e4c2ccbedea4e14004e4e0f16f85')
export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local _src
  for _src in "${source[@]}"; do
    _src="${_src%%::*}"
    _src="${_src##*/}"
    case "${_src}" in
    *.patch)
      msg2 "Applying patch $_src..."
      patch -Np1 < "../$_src"
      ;;
    patch-*)
      _src="${_src%.*}"
      msg2 "Applying patch $_src..."
      patch -Np1 -s < "../$_src"
      ;;
    esac
  done

  #cd '..'; cp -pr "${_srcname}" 'a'; ln -s "${_srcname}" 'b'; cd "${_srcname}"; false
  # diff -pNaru5 'a' 'b' > 0000-$RANDOM.patch

  echo "Setting config..."
  cp ../config .config
  make olddefconfig
  diff -u ../config .config || :

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname

  nice -n1 make -j1 htmldocs < /dev/null & # SPHINXOPTS='--keep-going'
  local _pid_docs="$!"
  nice -n2 make all
  make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
  wait "${_pid_docs}"
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
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
  depends=(coreutils kmod initramfs)
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed for some devices'
    'scx-scheds: to use sched-ext schedulers'
  )
  provides=(KSMBD-MODULE VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  replaces=(wireguard-lts)

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
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
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
  depends=(pahole)
  provides=(LINUX-HEADERS)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

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

  # licenses
  install -vDm 644 LICENSES/deprecated/{ISC,Linux-OpenIB,X11,Zlib} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/preferred/{BSD*,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/exceptions/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"
  license=(
    BSD-3-Clause

    GFDL-1.1-no-invariants-or-later

    GPL-2.0-only
    'GPL-2.0-only OR BSD-2-Clause'
    'GPL-2.0-only OR BSD-3-Clause'
    'GPL-2.0-only OR GFDL-1.1-no-invariants-or-later'
    'GPL-2.0-only OR GFDL-1.2-no-invariants-only'
    'GPL-2.0-only OR MIT'

    GPL-2.0-or-later
    'GPL-2.0-or-later OR BSD-2-Clause'
    'GPL-2.0-or-later OR CC-BY-4.0'
    'GPL-2.0-or-later OR MIT'
    'GPL-2.0-or-later OR X11'

    'LGPL-2.1-only OR BSD-2-Clause'

    MIT
  )

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

  # licenses
  install -vDm 644 LICENSES/deprecated/X11 -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/preferred/{BSD*,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
