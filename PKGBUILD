# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgbase=linux-lts61
pkgver=6.1.159
pkgrel=1
pkgdesc="LTS ${pkgver%.*} Linux"
url='https://www.kernel.org'
arch=(x86_64)
license=('GPL-2.0-only')
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
_srcname=linux-${pkgver%.*}
source=(
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/patch-${pkgver}.xz
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  0004-Sphinx-7.2.2-8.0-PosixPath.patch
  '0005-depmod-remove-depmod_hack_needed.patch'
  '0006-kernel-6.1-depmod-disable-for-packaging.patch'
  '0007-Sphinx-docutils-0.22-deprecated-SafeString-ErrorString.patch'
  '0008-perl-5.41-precedence-warning-kernel-doc.patch'
  config  # the main kernel config file
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
# https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
md5sums=('475320de08f16c9fa486fc4edfe98b30'
         'SKIP'
         '776189644a55021abab7884b8005c6f5'
         'cb32cb125ea45ac05782630dfc9fc951'
         '806e76e95002ecbf49b03d6e655dc567'
         'd15820a808c3cc159e6e5916a8c05e8f'
         'f24ee48c4c30cb428d0258aa3c25bd19'
         '25032e45b830ad198d84d7bb4a239da6'
         'd7169181793cabdf3d7decb350db26b5'
         'c7f23b1bcb226f29451d47bb7ae8604b')
sha256sums=('2ca1f17051a430f6fed1196e4952717507171acfd97d96577212502703b25deb'
            'SKIP'
            'a917aa5c006610d02d9b7ac801b83463fa02052b3403f784be3158e5aa0018ac'
            '21195509fded29d0256abfce947b5a8ce336d0d3e192f3f8ea90bde9dd95a889'
            '08ef05d8a4fc8117d131f219d753caa138a0fb7c8f00690ff6dc35ac6aacdb83'
            '64b521b3963781c60e9a33db40c523bf65a119cb1dfec182a737e90d2609df5a'
            '20d2afcc83f04d5409dcb5452763c625069dc00bfa7e60457902256dfbb58bdd'
            '6d886ff7f1fed2f32a9f2d8932c11786bb06742e203a55990c6b1f77a247be59'
            '51a883e3151cbe3c565f4cdbca015c3b3979bec438b11f9716cb978f7f63e108'
            'ea7a177caf7170b9f3746732e3d32703357d19cbafd463069aa34a8d8386c1e9')

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
  if ! :; then
    export PATH="${PWD}:${PATH}"
    cat > 'gcc' << EOF
#!/usr/bin/bash

# gcc 15 changed the default to -std=gnu23.
# This option is first so later -std will override it.
exec /usr/bin/gcc -std='gnu17' "\$@"
EOF
    chmod 755 'gcc'
  fi
  nice -n1 make -j1 htmldocs < /dev/null & # SPHINXOPTS='--keep-going'
  local _pid_docs="$!"
  nice -n2 make all
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
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
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
  pkgdesc="Documentation for the $pkgdesc kernel"

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

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
