# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributorr: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-rc
pkgrel=1
_srcname=linux-5.4
_major=5.4
### on initial release this is null otherwise it is the current stable subversion
### ie 1,2,3 corresponding $_major.1, $_major.3 etc.
_minor=10
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
0014-Revert-iwlwifi-mvm-fix-scan-config-command-size.patch
0015-e1000e-Revert-e1000e-Make-watchdog-use-delayed-work.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('4b9b0c7bdbf8712d8f3b32799ab8991e69b58b2e293a7e44531bdeb16a0834b7'
            'SKIP'
            'f23c0218a5e3b363bb5a880972f507bb4dc4a290a787a7da08be07ea12042edd'
            'SKIP'
            'eeb60c19586bf5855eeaeac8323b0012107bfa74f9efa0c8e129d979d38f1f31'
            'a3e9541bf0306d32af8acf121643d9953776d448f68ec09741c591d1e5bc6748'
            '8e9967f83cf22be43b516b394523b0976c6831e28cee5136542df3c946328917'
            '226251c17ced22414e4275ca69be6aec318904778f0c8c244050916e51064b14'
            '9809d55995895e7061bfca0db9f38a608548f21bb5d4a2260e7bbb6b5af2db4a'
            '82bc11366ca296e86dd745c911a841d7ac12d16a1a2185da245a96e5440b8fd7'
            '1ef45f1e7456437e4ec7c2ada46c607f492a87db8d1cf3f3b59870bc2deaa1e6'
            'fcd117bc51f21baac26f7570f48b91ce994fd351fcb19cb6097166a4a7c181e6'
            '49bc5c988a6cc127f39ae998954482450d19b69da2ce9dfcce678d3fe7504136'
            'f583d172c69c288f5d2e587c5926b0e732284c19e73671eef112ab1a0e26362a'
            '84baa16aa022e0dac2515edced6f214a08d385a385ffb04e358fbe9671235d41'
            'a55cfce037523fdb6244fd6286a1d9be12c2eab3327a1c6e05ac42899f5868d1'
            '9c600a292efb59087d913fd8e7a5fff9c7abcfad864d294a266600f4491476c5'
            '126f8b83065e3f7a72589f33874481aa06bb1686ddc6997a8a05a27c7d6721ac'
            '9c95928be62369403bb6822a838dc9791a5a98ac489af81b5ab8f2fd09b0c696'
            '4a2bd4b02e8c4f81334d22a8bd27a03f8a3a1e8137699b809de15cd7edf0e4dd')

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
