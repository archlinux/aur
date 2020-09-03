# Maintainer:  Joakim Hernberg <jbh@alchemy.lu>
# Contributor: David Runge <dvzrv@archlinux.org>

_pkgver=5.4.61
_rtpatchver=37
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
sha512sums=('1c2d7226dc8b4b6ca468a7082b42ac14bdf9f2ff4d0824737cb6a2e959b2c5da320877efe8b6dc7fd66200daadfe5ac424d8c8abc52888358e45ee594f60937d'
            'SKIP'
            'e35da843c0b7771397b71201bd718e6256c0a5c765f22f18256e263fb48cf5a097f757a1176f6aec9bd6bb7e25edf66055211742a836f107888a567c8f59f1d3'
            'SKIP'
            'cfe74b048d6d9b6e34a4a10e7c042a5a8b6a00783ca76156fde95190e2e10ba16f60467ddcc90b80b4b62b33ca157c249ae100866dd4cc32c7d7ec2ca1e223b8'
            '5f196378d50dd737d727e424d8f31b7fa8a6b92ba88f0a1467ef79bc37a097160da1fc1fd5cfb4b8983f36f2afdf27eb229ec61b35a15ac2343d660eb416a230'
            '8081673a6594e5fc2fddc98fa434e99817aa822f7136d3c14c8d465fa7b93c9ac5d3a4150a5b632e25b1dc76a814dfa19d8aede37d58b935db288465b6585c58')
b2sums=('78e8ee2fcd0e8cce8f536ba907a24676b5aafa662d97eb5c02f97150b0be4616dc564542503d4250d3fd8a674598cd2d3fdcaa34c880e0f3df558c4b5da8b24c'
        'SKIP'
        '6e9754d5ed0e6c41cc75af737639deb14fc1a5e6e30c57cc85030330b6982230a1911bc43315d5f233850333cbcef465b8ddc3b9bdcf75fb90b562cc34621162'
        'SKIP'
        'f7a6dedc99e5dcebea201c8ff4f139192368b4b73e35e52c589eebf7b49acfc34309bdd76454bf68d0b094ae0cc8114df8a86d2a9ddac0dbf0330a16d211b7d4'
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
