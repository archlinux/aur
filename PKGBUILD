# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-rc
pkgrel=1
_srcname=linux-5.10
_major=5.10
### on initial release this is null otherwise it is the current stable subversion
### ie 1,2,3 corresponding $_major.1, $_major.3 etc
_minor=6
_minorc=$((_minor+1))
### on initial release this is just $_major
_fullver=$_major.$_minor
#_fullver=$_major
_rcver=2
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
0002-HID-quirks-Add-Apple-Magic-Trackpad-2-to-hid_have_sp.patch
0003-iwlwifi-Fix-regression-from-UDP-segmentation-support.patch
0004-btrfs-fix-deadlock-when-cloning-inline-extent-and-lo.patch
0005-btrfs-shrink-delalloc-pages-instead-of-full-inodes.patch

)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
b2sums=('22df6754e677527bf1fa41609b69223491e57dc3166fff72a8d3e610b89fced23101d51ad781c16d7f283ce2d46f2dfc560c1c726afc029c39aef29eb417d21f'
        'SKIP'
        '2da9e47f6524ecb50db9f515b9f281f08fbcb323f6e4ddb225c2b2f6379787c37efee25589e49286e13ff663c414a422b680912739400afab89f0ebaf741d33b'
        'SKIP'
        'cb3a58e4eef8395b75887d94a84bba25f05fbec8f576a791623057a190a1d51b412a19ecf1b600ac3f9f6c46968eb0e130d571743e61afc231a97146ee4b52d0'
        'b42730a806a63dbf905f448a3282dec72a950ef7d16a3531d977dcae3b5c2685a5c5dd10a58e345d57084a6212353dc2f2f0102021d13c1557092e564f81eaf5'
        'a5dea5bb6df6fb517009ad5b104c2ea8e93ed880393a1412ca2d7fc8047abccc9c72076e40d1d4133cadc9048040846cc9bdc91e30c4d601ad5963d13498503e'
        '9a8723104239ba4646dd0c76c5a60128892954dd2faee69ca5c5d1251c9694de8fd528ca063a2add1401ad1375ad0dcc2560ca03a1bfd03b161d34ccd25b686a'
        'e0da90b08fb03658dca9c42ac287c04d9b35969a15165c0f1fc7e11290de272b892abb58f5c7aabe22899f53f5bc39539f58768b8012d92145ba2fd8b89898a7'
        '2b180269f934469d6ef6f0f8474dd947c7a8e9344cf3bbecac6a9c325d7bfb89d234eb15c4422709acaffd30ebeda2ec06c91a8c1128631a839186e8b273eb65')


export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
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

  # disable CONFIG_DEBUG_INFO=y at build time otherwise memory usage blows up
  # and can easily overwhelm a system with 32 GB of memory using a tmpfs build
  # partition ... this was introduced by FS#66260, see:
  # https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/linux&id=663b08666b269eeeeaafbafaee07fd03389ac8d7
  sed -i -e 's/CONFIG_CGROUP_BPF=y/# CONFIG_CGROUP_BPF is not set/' \
      -i -e 's/CONFIG_BPF_LSM=y/# CONFIG_BPF_LSM is not set/' \
      -i -e 's/CONFIG_USERMODE_DRIVER=y/# CONFIG_BPF_PRELOAD is not set/' \
      -i -e '/CONFIG_BPF_PRELOAD=y/d' \
      -i -e '/CONFIG_BPF_PRELOAD_UMD=m/d' \
      -i -e '/CONFIG_BPF_STREAM_PARSER=y/g' \
      -i -e 's/CONFIG_BPF_LIRC_MODE2=y/# CONFIG_BPF_LIRC_MODE2 is not set/' \
      -i -e 's/CONFIG_DEBUG_INFO=y/# CONFIG_DEBUG_INFO is not set/' \
      -i -e '/# CONFIG_DEBUG_INFO_REDUCED is not set/d' \
      -i -e '/# CONFIG_DEBUG_INFO_COMPRESSED is not set/d' \
      -i -e '/# CONFIG_DEBUG_INFO_SPLIT is not set/d' \
      -i -e '/CONFIG_DEBUG_INFO_DWARF4=y/d' \
      -i -e '/CONFIG_DEBUG_INFO_BTF=y/d' \
      -i -e '/# CONFIG_GDB_SCRIPTS is not set/d' \
      -i -e 's/CONFIG_BPF_KPROBE_OVERRIDE=y/# CONFIG_BPF_KPROBE_OVERRIDE is not set/' ./.config

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
