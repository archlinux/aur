# Maintainer:  Joakim Hernberg <jbh@alchemy.lu>
# Contributor: David Runge <dvzrv@archlinux.org>

_pkgver=5.4.70
_rtpatchver=40
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
  0002-virt-vbox-Add-support-for-the-new-VBG_IOCTL_ACQUIRE_.patch
  0003-i2c-core-Restore-acpi_walk_dep_device_list-getting-c.patch
  'sphinx-workaround.patch'
)
sha512sums=('ab356476eb68ac1b2c172be97286418be307303e11ddd21e2d15cfa978a5d47b2bfec5cc61a306b48e0587e5b78cb02cec856981db9013112f4cd895374a5f21'
            'SKIP'
            '9a325cbeaa783ddfc3e0ceafecebcf55caf65245d3beeac652db9793af064a0ab49608b2c39371ea33b058ae90fc427aeb6a300e27a716482f31a1c2226b6439'
            'SKIP'
            'addc00cb54d7fea6539a4b5a46b0e3d5dec9a967357bbddd09376a83647f740e2f4cea34de659550498834aafb57f3f450815119e2c4ed69dc5241838593d393'
            '5f196378d50dd737d727e424d8f31b7fa8a6b92ba88f0a1467ef79bc37a097160da1fc1fd5cfb4b8983f36f2afdf27eb229ec61b35a15ac2343d660eb416a230'
            '315aaf31af7b869ba64e324ab33ffa5050b761ecbd7aa6b9a900b8b2ca655d80f840fca9973d4f12ec067519ba4ab2ebdd41d518a9fda4586377ee9c9e9a2fda'
            '0f69e98f934bec92b6bea535241b6a7e21eba8df055c26f970c47e424b06053953737336de6f5b81266f30be211f27f9cbbf678aa4ec9fb968a3c290c9726ac1'
            '8081673a6594e5fc2fddc98fa434e99817aa822f7136d3c14c8d465fa7b93c9ac5d3a4150a5b632e25b1dc76a814dfa19d8aede37d58b935db288465b6585c58')
b2sums=('2db07e8ed76feba1dbbb697f959540ec7a050098022a460b4251802a99f71c01a76f9cbf81806cf4bd5b814a0e6b1e9f36364fcf099cf44d90780e6e0dc9ecfe'
        'SKIP'
        '0f911652bedb74d40bfd42a2ef0e0b7309c31152f6d94a8cb6c91e0a16e8f5af007de6f3e41145b8c1248aba34f3ee90e024b40558de073419bb70e4d12749d9'
        'SKIP'
        'c7811fb148f4353f8f90053d4746433c91456925c7d086c9af070bcd9c047530694a92a41ce1f1eb5606eb2968682e4a98b48a0b744b661fb982e67943c54d5e'
        '3c3be0e85347bf3825f855a0a399ed60497cd0376f4b8ee1fe89df9bd90fe01cdd97fb3f4c4eea3918ba3769fc79961b6c58ba997326cbdf9dd7fb9540d8f6d6'
        '4ca82850b654f94378fe6c35c1903830b7ca58dfd8c482a36b193edb78785e7a8cca146fa5aee9f372f14fd5e01e716cf74ec40e773b7e1327df64b768d7a3a2'
        '4fdc4b2beb36fc042a1747e07863b12e762b30951eb3bfc012f440d5ea2217180bf5eff25bd48e90e3d4953bf4119f5e7a280095fa9138de79480eedbcc639b5'
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
