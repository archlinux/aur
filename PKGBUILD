# Maintainer:  Joakim Hernberg <jbh@alchemy.lu>
# Contributor: David Runge <dvzrv@archlinux.org>

_pkgver=5.4.69
_rtpatchver=39
pkgbase=linux-rt-lts
pkgver=${_pkgver}.${_rtpatchver}
pkgrel=1
pkgdesc='Linux RT LTS'
arch=('x86_64')
url="https://wiki.linuxfoundation.org/realtime/start"
license=('GPL2')
makedepends=('bc' 'graphviz' 'imagemagick' 'kmod' 'libelf' 'python-sphinx'
'python-sphinx_rtd_theme' 'xmlto')
options=('!strip')
_srcname=linux-${_pkgver}
source=(
  "https://www.kernel.org/pub/linux/kernel/v${_pkgver%%.*}.x/linux-${_pkgver}.tar."{xz,sign}
  "https://www.kernel.org/pub/linux/kernel/projects/rt/${_pkgver%.*}/older/patch-${_pkgver}-rt${_rtpatchver}.patch."{xz,sign}
  'config'
  '0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch'
  'sphinx-workaround.patch'
)
sha512sums=('3a161bce688b1e9d18703f6354b746d1e8c72dcbbf6e3c8759a98ef3611234a32d7e571977aa78f33db9d42cfd9ad82145f3faea028d335a1863eb624b940b6c'
            'SKIP'
            'a811bd56dcf774c5fc1cd2f795c7594c173cf2f245463f2d047740317f69c66d82d097b2b98b5ee2c5c8ac4eb4de0a37954e24f7aaec2c9540b5192db93538a2'
            'SKIP'
            '7b8912a045456502937d1fa7bcec5b072ed11d3effbe93ce959744cc36515cbcc82b785abafbe199aa7de3aae2fb30436e321619593546c508cfccae2ff2aaa8'
            '5f196378d50dd737d727e424d8f31b7fa8a6b92ba88f0a1467ef79bc37a097160da1fc1fd5cfb4b8983f36f2afdf27eb229ec61b35a15ac2343d660eb416a230'
            '8081673a6594e5fc2fddc98fa434e99817aa822f7136d3c14c8d465fa7b93c9ac5d3a4150a5b632e25b1dc76a814dfa19d8aede37d58b935db288465b6585c58')
b2sums=('8a9b8e44b5a1ae69a4422f22b31c48ea1cf0ccf4b7fe55baa8e68b4797f717b66b38f739a5e525455ce9ecf99fdf312275a856d7f6956f17f3ffbb10a749ab63'
        'SKIP'
        '14a18a2802042a384e565d4583f194ede7a8b63bab368db1f51d79466552a53a9e485199d5a954ae47241d063a5d9ce72630c29af566284e8a35a4095787e29e'
        'SKIP'
        '1540f45b0b3639f646c823151884c36665894e486e7fb1706984ac795cf6f36f6abab812b38c27abc0921b7b689214c23d2e71bbaf6334187954f496353f500b'
        '3c3be0e85347bf3825f855a0a399ed60497cd0376f4b8ee1fe89df9bd90fe01cdd97fb3f4c4eea3918ba3769fc79961b6c58ba997326cbdf9dd7fb9540d8f6d6'
        '657fd0e70d29eee5518c27af7eec73a18f399215d2a21cf7b92c9914bee16d1e0981c00065ccb12f0534e57af906af63b17221c65a61146ec8894c88420fa56c')
validpgpkeys=(
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  '5ED9A48FC54C0A22D1D0804CEBC26CDB5A56DE73'  # Steven Rostedt (Der Hacker) <rostedt@goodmis.org>
)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    # picking up the RT patch
    src="${src//patch.xz/patch}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config .config
  make olddefconfig
#  make menuconfig # CLI menu for configuration

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make all
  make htmldocs
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')

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

  # http://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
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
    case "$(file -bi "$file")" in
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
