# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributorr: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-rc
pkgrel=1
_srcname=linux-5.4
_major=5.4
### on initial release this is null otherwise it is the current stable subversion
### ie 1,2,3 corresponding $_major.1, $_major.3 etc.
_minor=8
### on initial release comment this out and set to =1
_minorc=$((_minor+1))
#_minorc=1
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
       kmod inetutils bc libelf
)
options=('!strip')
source=(
  https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/"$_rcpatch".{xz,sign}
  # https://lkml.org/lkml/2019/8/23/712
  # "$_rcpatch.patch::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=$_srcname.y&id2=v${_major}.${_minor}"
  https://www.kernel.org/pub/linux/kernel/v5.x/linux-$_fullver.tar.{xz,sign}
  config         # the main kernel config file
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
0002-lib-devres-add-a-helper-function-for-ioremap_uc.patch
0003-mfd-intel-lpss-Use-devm_ioremap_uc-for-MMIO.patch
0004-PCI-pciehp-Do-not-disable-interrupt-twice-on-suspend.patch
0005-PCI-pciehp-Prevent-deadlock-on-disconnect.patch
0006-ACPI-PM-s2idle-Rework-ACPI-events-synchronization.patch
0007-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch
0008-x86-intel-Disable-HPET-on-Intel-Ice-Lake-platforms.patch
0009-drm-i915-save-AUD_FREQ_CNTRL-state-at-audio-domain-s.patch
0010-drm-i915-Fix-audio-power-up-sequence-for-gen10-displ.patch
0011-drm-i915-extend-audio-CDCLK-2-BCLK-constraint-to-mor.patch
0012-drm-i915-gt-Detect-if-we-miss-WaIdleLiteRestore.patch
0013-pinctrl-sunrisepoint-Add-missing-Interrupt-Status-re.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('fc0d4939d701fbc0b1a1ce74dc62bf1d28ab38d8f89f88bb96cecf42a6f059fe'
            'SKIP'
            '42c414c902193f9e8a1b70c728ca440de02d85dc29102f52ef98cfbf20d29a52'
            'SKIP'
            'eeb60c19586bf5855eeaeac8323b0012107bfa74f9efa0c8e129d979d38f1f31'
            'bd426e5a539152577608ac57b3e9a8f6281f848847c66d244274b48d95df39aa'
            'e34286f1f2ee29a45b1a38385489581323eb6672064f4afa13eb8b39dbc79556'
            'afaf90393cfd4b5d65dfec040cd0b74b5e7cda52540d3883e69ce8ca0b42da12'
            '0c1c5de463df11efdd4ed8ca0732187deb3e06d4e15524f0dbb066c578657665'
            '26500e808df98e20e62079d18137b5f0636f8c2a32dc8164f6b6381c22c3f217'
            '5f8a47d95bd54e8c315c70491b25e70b2af4dce11c0acf06ba0f7c45985b59d8'
            '53e1b22f9c97b3e3cdfaa03a4b3f3882ad427c4d400315a51303223209a05788'
            '2885647d502d9eedd4f3d94cc27d6c8ecb3bb03e4e51611be8d74034eeccf0bb'
            '40210b6cbd64cf70b3af76ab84c9e7f55e64aeed5c1072d4fed4345604735a67'
            '7f5f1806a6bf1b256416da8c4d0fcb45249769425a93beb6940cabc2112d95e2'
            '6a6b71cc316aff58124f169d22f7712f15f503ff3187d30e3288aa2b0c20402c'
            '2b8110e2f53588fde1097dde9545f5369983e654004597a41f58f8e13b0be3c0'
            '236e5502b9955747306eeb1078b22cc778feb8a0e1bde8895bafcf5c0438e250')

_kernelname=${pkgbase#linux}

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd linux-${_fullver}

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  msg2 "Setting config..."
  cp ../config .config
  make olddefconfig

  make -s kernelrelease > version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"
}

build() {
  cd linux-${_fullver}

  make bzImage modules
}

_package() {
  pkgdesc="The release candidate kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')

  cd linux-${_fullver}
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the linux-rc kernel"

  cd linux-${_fullver}
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  msg2 "Installing headers..."
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

  msg2 "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg2 "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg2 "Removing documentation..."
  rm -r "$builddir/Documentation"

  msg2 "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg2 "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg2 "Stripping build tools..."
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

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
