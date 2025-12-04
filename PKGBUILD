# Maintainer: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgbase=linux-lts54
pkgver=5.4.302
pkgrel=1
pkgdesc="LTS ${pkgver%.*} Linux"
url='https://www.kernel.org'
arch=(x86_64)
license=('GPL-2.0-only')
#depends=('systemd>=256.6') # put this in for a couple versions to prevent upgrade failures
makedepends=(
  bc kmod libelf cpio perl tar xz
  xmlto python-six python-sphinx python-sphinx_rtd_theme graphviz imagemagick
)
options=('!strip')
_srcname=linux-${pkgver%.*}
source=(
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/patch-${pkgver}.xz
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  0002-virt-vbox-Add-support-for-the-new-VBG_IOCTL_ACQUIRE_.patch
  0003-Add-support-for-ZSTD-compressed-kernel.patch
  sphinx-workaround.patch
  '0004-Sphinx-7.2.2-8.0-PosixPath.patch'
  '0005-depmod-remove-depmod_hack_needed.patch'
  '0006-kernel-5.4-depmod-disable-for-packaging.patch'
  '0007-Sphinx-docutils-0.22-deprecated-SafeString-ErrorString.patch'
  '0008-perl-5.41-precedence-warning-kernel-doc.patch'
  config         # the main kernel config file
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
# https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
md5sums=('ce9b2d974d27408a61c53a30d3f98fb9'
         'SKIP'
         'b169933993bdbc4972663a51bfe7fe79'
         '794009ce8142a0ea7f60a9085be92138'
         '074581f2923b790209504cc9c152d96f'
         '3ca57f3b588b74637bc589cfe973354e'
         'ed318d5dbe8471cf2c153ade2ecba95a'
         '95dcd182168ace8a713277a8cf46ef93'
         'd15820a808c3cc159e6e5916a8c05e8f'
         'fa086fd4a4072d9ffff4e9fcfefaf3ea'
         '584ea2bdaa1f0dcf62f9107a0d3bb7ad'
         'cd0564552862fbb33fa7b8e7c0396708'
         '971de9df4a1f24d3753387cfd8f8eeb4')
sha256sums=('bf338980b1670bca287f9994b7441c2361907635879169c64ae78364efc5f491'
            'SKIP'
            'c42358b8b729639cbde757ff03aed797717ba702345091400efdf7089c4a7c0d'
            'b439f57b84bc98730c0265695abb92385ee4dcd35a5c00d4cb3d3155c75fb491'
            '4fd74bb2a7101d700fba91806141339d8c9e46a14f8fc1fe276cfb68f1eec0f5'
            '8b604b7dc447b5f1f6f0b6239d5dd3ec6a5336cba78ac6dcef8f3e59357bd8c0'
            'b7c814c8183e4645947a6dcc3cbf80431de8a8fd4e895b780f9a5fd92f82cb8e'
            'ab751955fa6c43afd812863dc65ced6fe3ebf80a6746e894576459358ca53f36'
            '64b521b3963781c60e9a33db40c523bf65a119cb1dfec182a737e90d2609df5a'
            '444e4f6db856002ee23841e20cc2aa1b8543ac6ef37b30edd1eb6846ba48e2b4'
            '35cc0e06698ee790776213c52e169bfc9c8c529f18cab585fdff98694b569411'
            '69df07f9d1c97a8dba0cbeeddd799471b8a05f358cbec2780a15284ff37fee26'
            'bffa24efd9e84ffd48069947cc5ed52827d280dbd303f50e6286c48c89613b3f')

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
  cp ../config .config
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
  provides=(VIRTUALBOX-GUEST-MODULES)

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
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

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
