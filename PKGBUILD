# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributorr: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-rc
pkgrel=1
_srcname=linux-5.4
_major=5.4
### on initial release this is null otherwise it is the current stable subversion
### ie 1,2,3 corresponding $_major.1, $_major.3 etc.
_minor=11
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
0008-drm-i915-save-AUD_FREQ_CNTRL-state-at-audio-domain-s.patch
0009-drm-i915-Fix-audio-power-up-sequence-for-gen10-displ.patch
0010-drm-i915-extend-audio-CDCLK-2-BCLK-constraint-to-mor.patch
0011-drm-i915-gt-Detect-if-we-miss-WaIdleLiteRestore.patch
0012-pinctrl-sunrisepoint-Add-missing-Interrupt-Status-re.patch
0013-Revert-iwlwifi-mvm-fix-scan-config-command-size.patch
0014-e1000e-Revert-e1000e-Make-watchdog-use-delayed-work.patch

)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('6ef7160af214d1eb6fe14a61a227ef011ac3b4cf29788022ab0c45ba2108e9b4'
            'SKIP'
            '62bd36e5d5e1d8208750ccddd8e8aa3d109b29b5ac5344b5b1c47d0f6d55d72c'
            'SKIP'
            'eeb60c19586bf5855eeaeac8323b0012107bfa74f9efa0c8e129d979d38f1f31'
            '632dd5b285217ad7f6ec584ace623a178c38debdc278c2063feb11412e6fabf8'
            '8140032dcd5bcfd20b9758afe9937816a5eb0a9e700e45f309eb35f6b082719c'
            'ff5756e69a9e6d882e35bd3a73bb158601b0bfaa14a8bcc5bffcdcd39e20dde7'
            'c9dc80e6d5c5dc71631c33e27e2d4cab69aff6dfa7be17df84a133c6755315c4'
            '988365ce8140d48e0691bb49f0a8b629228936963251f8c02ff783ecd024d283'
            'd9eeb20c3f1727377e75ca610707f28a2deb4b3fa649da34d39990e24c465cdc'
            'ef375c26e0094879481900bdf62ffa9db1f27c9a0426fdc1e032a2816052e800'
            '3c87892910935b3f93b462b3a3aec162951e05fc951839a4203da1f07a591528'
            'b4bcf8f820e761c64574a8396ede69254e0d693bab9ca98f65c9c7b274b318c7'
            'b470273d4ade5355b12556a0a3fb9524a872b0d3409f5bc29aa4eda81e2244e1'
            '408e7d10477c67a74780baf0b69d7d09c4c53866e914bf736a7745db5b36fab0'
            'b98de2658ef5f62190a22ebc886b7b1bd7741e48d3aa77b24fc3b0dc1dba380b'
            '532c33ea21ecdcd3826f2beab60d58679a8fb93d3c7143f0f3cef1604d3e07cc'
            '2e72e164cdffa2a67d1ce341a8c10cdee857830d670f0b5b2905992a21ebbb5f')

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
