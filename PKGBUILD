# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgbase=linux-lts510
pkgver=5.10.247
pkgrel=1
pkgdesc="LTS ${pkgver%.*} Linux"
url='https://www.kernel.org'
arch=(x86_64)
license=('GPL-2.0-only')
makedepends=(
  bc kmod libelf pahole cpio perl tar xz
  xmlto python-six python-sphinx python-sphinx_rtd_theme graphviz imagemagick
)
options=('!strip')
_srcname=linux-${pkgver%.*}
source=(
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/patch-${pkgver}.xz
  config         # the main kernel config file
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  # https://build.opensuse.org/package/show/home:curb:ArchLinux/linux-lts510
  #0002-reorganize-gimple-includes-for-GCC-13.patch # https://lore.kernel.org/lkml/20230118202355.never.520-kees@kernel.org/raw
  '0003-Sphinx-7.2.2-8.0-PosixPath.patch'
  '0004-depmod-remove-depmod_hack_needed.patch'
  '0005-kernel-5.10-depmod-disable-for-packaging.patch'
  '0006-Sphinx-docutils-0.22-deprecated-SafeString-ErrorString.patch'
  '0007-perl-5.41-precedence-warning-kernel-doc.patch'
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
# https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
md5sums=('753adc474bf799d569dec4f165ed92c3'
         'SKIP'
         'bce1abaed2003d031698b6c5ae9f7486'
         '8b8fa773fe9c7938a76ba07ca2933ed8'
         'd31360693fb06a0d69c1f126350baa6d'
         'c1f10e50f7ca23d07ae83ae6252854d5'
         'd15820a808c3cc159e6e5916a8c05e8f'
         '32277e1b48dd6f00b5e31f3cb3f0f44c'
         '80c6b8ddceb9e0cb9b432d5ec4cdf5ff'
         '6140c1a5cd25145548ed5867d13ee7d9')
sha256sums=('dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43'
            'SKIP'
            '64c905b9634e979cbcbc8cddd4db6d9ee059379b5f1148ae4f81299ecb1d4c83'
            'ddc8d7c604a2f8373a25674d06cd377fdf80adca9bd426f4c8a50f3d52403001'
            '96a72e1652314215da7140956c3abcf495cafd00811eda3cf4ce03ec5f791f1e'
            '453ad77883c50b5d5b1373241a5a27a5f7cdc11c5b66dd929338fc622de6cf14'
            '64b521b3963781c60e9a33db40c523bf65a119cb1dfec182a737e90d2609df5a'
            '0514cb38c60afd7ae113f679508b83d253c6415a19c4a4a94e514c7f5b877bf2'
            '0403b5a981af43c7a5f4a74f879cc9ca08e43f5eda7b67a5be68855d3eb3f273'
            '54e863f094c1fb8901f29f73c86d4a05ffb1836b12c2edbc811ba0621b7b8391')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
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
  cp "../${source[3]}" .config
  make olddefconfig

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  if :; then
    export PATH="${PWD}:${PATH}"
    cat > 'gcc' << EOF
#!/usr/bin/bash

# gcc 15 changed the default to -std=gnu23.
# This option is first so later -std will override it.
exec /usr/bin/gcc -std='gnu17' "\$@"
EOF
    chmod 755 'gcc'
  fi
  nice -n1 make -j1 htmldocs < /dev/null & # -i SPHINXOPTS='-T --keep-going' &
  local _pid_docs="$!"
  nice -n2 make all
  wait "${_pid_docs}"
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)

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
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"

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

  # https://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
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
