# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-rc
pkgrel=1
_srcname=linux-5.12
_major=5.12
### on initial release this is null otherwise it is the current stable subversion
### ie 1,2,3 corresponding $_major.1, $_major.3 etc
_minor=12
_minorc=$((_minor+1))
### on initial release this is just $_major
_fullver=$_major.$_minor
#_fullver=$_major
_rcver=1
_rcpatch=patch-${_major}.${_minorc}-rc${_rcver}
pkgver=${_major}.${_minorc}rc${_rcver}
arch=(x86_64)
license=(GPL2)
url="https://www.kernel.org/"
makedepends=(
  bc kmod libelf        cpio perl tar xz
)
options=('!strip')
_modprobeddb=
source=(
  https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/"$_rcpatch".{xz,sign}
  # https://lkml.org/lkml/2019/8/23/712
  #"$_rcpatch.patch::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=$_srcname.y&id2=v${_major}.${_minor}"
  https://www.kernel.org/pub/linux/kernel/v5.x/linux-$_fullver.tar.{xz,sign}
  config         # the main kernel config file
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  0002-x86-setup-Consolidate-early-memory-reservations.patch
  0003-x86-setup-Merge-several-reservations-of-start-of-mem.patch
  0004-x86-setup-Move-trim_snb_memory-later-in-setup_arch-t.patch
  0005-x86-setup-always-reserve-the-first-1M-of-RAM.patch
  0006-x86-setup-remove-CONFIG_X86_RESERVE_LOW-and-reservel.patch
  0007-x86-crash-remove-crash_reserve_low_1M.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
b2sums=('2baef27303c676d82dada549076c29bbf25bb2db1d957a4e292d32dff1647f14b235a691468be0e8d36663ee137d14fe3aeaaa95db2e3592e2eada523b567641'
        'SKIP'
        'f9aef3da2f65916cc30da9a066217d3379036e6a32a732224da7fee86c80810315484f48132b50b8cf8eb5e0b055ad1b7bbe63dadd0eb54b0b0626bc57c20963'
        'SKIP'
        '83aa7f127d34a247a8275358d52a510d4895c790211d98ac51ed7df75c881e9071cfe3d03f137f7edff3fe8b46e7f77fd9bfd0ef1b163a9c70dac5b4f3cc9693'
        'dda152592dec643bce44754bf5d2d43a5897cc57f8dc258b87857055a45abf903d619aba1de389228cb086a17fedea5458f8fe2c0993fa20213bb7c5bca331c8'
        '13330cf57b5c6b928ea73bd30479010688cf8d2003107b041a7fdad33c1ac225c8c905bef235cd762d6ea76be754b5db6be769526bacf7333298f72d6afff535'
        '381e0f177faa3090d1abf4d11a97db535712840870265dea167d7692dee7733a226d09c103d01705d5c0809fa66c7a23efea9da2473da672644b06e31db77083'
        'cd9da0dee048fc52a3032343f122c2055081eeedfc8a3e5227218f0f63fc7618e8fe744c8caa7e3a2ca844f4aaf7314b57a306d0d3b1849e97b24687b8c5a501'
        '1810832172e1b006a5471d8e317573343884feed9abc9e7380a32d83c958b0e6aa68adf9a647c9b7b714783997591f5d80e754c6e7357279661eee998f22864c'
        '4e7cb958f95d99bba9810e675d4f1b0b3c171f78e9fe96ff9d265f792f4ceb1367f2f4d238f36b5ca1c395e14abdabbf0f8ce2dc07c4fe567d822a8b629dfa05'
        '2251f8bf84e141b4661f84cc2ce7b21783ac0a349b2651477dfcbc5383b796b2e588d85ee411398b15c820cb3672256be8ed281c8bccfad252c9dd5b0e1e0cd5')


export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  # hacky work around for ck1 not getting extracted
  # https://bbs.archlinux.org/viewtopic.php?id=265115
  if [[ ! -f "$srcdir/$_rcpatch" ]]; then
    xz -dc "$SRCDEST/$_rcpatch.xz" > "$_rcpatch"
  fi

  cd linux-${_fullver}
  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  echo "Applying $_rcpatch..."
  patch -Np1 <"../$_rcpatch"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = 0*.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config .config

  # disable CONFIG_DEBUG_INFO at build time otherwise memory usage blows up and
  # can easily overwhelm a system with 32 GB of memory using a tmpfs build.
  # introduced by FS#66260, see:
  # https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/linux&id=663b08666b269eeeeaafbafaee07fd03389ac8d7
  scripts/config --disable CONFIG_DEBUG_INFO
  scripts/config --disable CONFIG_CGROUP_BPF
  scripts/config --disable CONFIG_BPF_LSM
  scripts/config --disable CONFIG_BPF_PRELOAD
  scripts/config --disable CONFIG_BPF_LIRC_MODE2
  scripts/config --disable CONFIG_BPF_KPROBE_OVERRIDE

  if [[ -n "$_modprobeddb" ]]; then
    #msg "Running Steven Rostedt's make localmodconfig now"
    #sudo /usr/bin/modprobed-db recall
    #make localmodconfig
    msg "Running Steven Rostedt's make localmodconfig now"
    if [[ -f $HOME/.config/modprobed.db ]]; then
      _useit="$HOME/.config/modprobed.db"
    else
      _useit="../modprobed.db"
    fi
    make LSMOD="$_useit" localmodconfig
  fi

  make olddefconfig
 # make nconfig

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd linux-${_fullver}
  make all
}

_package() {
  pkgdesc="The release candidate kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  replaces=(virtualbox-guest-modules-arch wireguard-arch)

  cd linux-${_fullver}
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  #make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install
  # not needed since not building with CONFIG_DEBUG_INFO=y

  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the linux-rc kernel"

  cd linux-${_fullver}
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

  #echo "Stripping vmlinux..."
  #strip -v $STRIP_STATIC "$builddir/vmlinux"
  # not needed since not building with CONFIG_DEBUG_INFO=y

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
