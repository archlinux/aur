# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-rc
pkgrel=1
_srcname=linux-5.16
_major=5.16
### on initial release this is null otherwise it is the current stable subversion
### ie 1,2,3 corresponding $_major.1, $_major.3 etc
_minor=18
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
  0002-Bluetooth-btintel-Fix-bdaddress-comparison-with-garb.patch
  0003-Bluetooth-Read-codec-capabilities-only-if-supported.patch
  0004-Bluetooth-fix-deadlock-for-RFCOMM-sk-state-change.patch
  0005-mt76-mt7921-add-support-for-PCIe-ID-0x0608-0x0616.patch
  0006-mt76-mt7921-reduce-log-severity-levels-for-informati.patch
  0007-Revert-NFSv4.1-query-for-fs_location-attr-on-a-new-f.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30'  # Jan Alexander Steffens (heftig)
  'C7E7849466FE2358343588377258734B41C31549'  # David Runge <dvzrv@archlinux.org>
)
b2sums=('574903232d1ce923906ec120a9f08911e60e4d4bc380503a0e3557c7ecd988e63bc9496d9976696b1948dd66f72aa90c191127267a5ef7f90c68e1c3d223094b'
        'SKIP'
        '0688856007dfc535d0da1c72f62e923693b88f6c365074135c5c4c10e30d8d94fca817fdda74d3efafae976b3118ab25f534310affe9149eb6a51823960be7f5'
        'SKIP'
        'f37b180eac2737e7398654c9cf2d3b0ee93b194804d22827ad776a605692ddc098cba8ca7ba7dc2f2959cabc4eca92c73cdacbfa34182fdb98ab9199f161b5c4'
        '85ff480287d5e9b26eec6392022d1496c10900d3c015ff2f65130b347477930222c2a28e1e2175f39a324f39148bdd75cadfaa66100c65df2fa7106d8e86ce06'
        '1f3bbd94a7a4d3cce39786a5c7a5b5aa60c7efef3f4608908d0f8e463bcdaa390f467c1c78cd2ecbc683e81ee6d7ce6a5ebbe8634c7e9c203e3d3abbf929b051'
        '12a5d08ceef328f3353833eed2f206ca6c08377abee8802de0ae32194b15c243b996b4c7bed257597b823683c0e80aadfdac94f32c7456a4f2af98ef3cecbe73'
        '7a386793b84f0eb5d38cd8f9cd063748c3f3d9adebebdfa9b16d2c889d510f35b3c01d1d185008336c08e87c3597d4a7bd09e1f5d0038138a4af0c88459da6e4'
        'a9f0b7954ba77f94ae3bc49c621610a88f0888f91c93b4a4188569c0e06c5afe355971ad4323b03d79aa5cb63bfe5dc4a52dbf0267fd6a1f3e6d3c64dcc77b13'
        '5f4af41492f1a13f2a40764f5e1838588d2fd53addfd2cea05de4d51f760da5e6968ffaba9b6749fcdec5034dc1572777def8497cc978a01fd4b5eb82673f2e4'
        '03096c8152ed3a671a9f59565dd891f10a5a8a91d03fa1fa8a5db85291f41a6f1cc5f44c47a2c8e78a690599afbd79d2ed12498b0494b4bc0d0311c0102598a3')


export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  # hacky work around for rc1 not getting extracted
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

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

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
