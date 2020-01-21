# Maintainer:  Joakim Hernberg <jbh@alchemy.lu>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: timbosa <tinny_tim@dodo.com.au>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=linux-rt
_pkgver=5.4.13
_rtpatchver=7
pkgver="${_pkgver}.${_rtpatchver}"
pkgrel=1
arch=('x86_64')
url="https://wiki.linuxfoundation.org/realtime/start"
license=('GPL2')
makedepends=('bc' 'git' 'graphviz' 'imagemagick' 'inetutils' 'kmod' 'libelf'
'python-sphinx' 'python-sphinx_rtd_theme' 'xmlto')
options=('!strip')
_srcname=linux-${_pkgver}
source=(
  "https://www.kernel.org/pub/linux/kernel/v5.x/linux-${_pkgver}.tar.xz"
  "https://www.kernel.org/pub/linux/kernel/v5.x/linux-${_pkgver}.tar.sign"
  "https://www.kernel.org/pub/linux/kernel/projects/rt/${_pkgver%.*}/older/patch-${_pkgver}-rt${_rtpatchver}.patch.xz"
  "https://www.kernel.org/pub/linux/kernel/projects/rt/${_pkgver%.*}/older/patch-${_pkgver}-rt${_rtpatchver}.patch.sign"
  config
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  0002-lib-devres-add-a-helper-function-for-ioremap_uc.patch
  0003-mfd-intel-lpss-Use-devm_ioremap_uc-for-MMIO.patch
  0004-PCI-pciehp-Prevent-deadlock-on-disconnect.patch
  0005-ACPI-PM-s2idle-Rework-ACPI-events-synchronization.patch
  0006-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch
  0007-drm-i915-save-AUD_FREQ_CNTRL-state-at-audio-domain-s.patch
  0008-drm-i915-Fix-audio-power-up-sequence-for-gen10-displ.patch
  0009-drm-i915-extend-audio-CDCLK-2-BCLK-constraint-to-mor.patch
  0010-drm-i915-Limit-audio-CDCLK-2-BCLK-constraint-back-to.patch
  0011-pinctrl-sunrisepoint-Add-missing-Interrupt-Status-re.patch
  0012-Revert-iwlwifi-mvm-fix-scan-config-command-size.patch
  0013-e1000e-Revert-e1000e-Make-watchdog-use-delayed-work.patch
  0014-drm-amdgpu-Add-DC-feature-mask-to-disable-fractional.patch
  0015-ptp-free-ptp-device-pin-descriptors-properly.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  '8218F88849AAC522E94CF470A5E9288C4FA415FA'  # Jan Alexander Steffens (heftig)
  '64254695FFF0AA4466CC19E67B96E8162A8CF5D1'  # Sebastian Andrzej Siewior
  '5ED9A48FC54C0A22D1D0804CEBC26CDB5A56DE73'  # Steven Rostedt
  'E644E2F1D45FA0B2EAA02F33109F098506FF0B14'  # Thomas Gleixner
)
sha256sums=('49fb29d96d7e7c1d7e6082701bd26bfddd0fbc87a796fb6ba6258bc5fd386ad7'
            'SKIP'
            '435449401c9c5fce7c456b274ca6084b6ffd54319dbef8d4f13d23a8f1303b40'
            'SKIP'
            'e3fa845780853cd99b7579cd36b5dd5f27f163093cb223cdcfe3cf51aa8f0b0a'
            'a8260a0cd688f145837510955df5bf1bad8e1a126fb2240a05cb33a524caff39'
            '134df0458cfa0a1c9b5d68539fef58a5595b3c817cbf529f2216bdf5e9c513bf'
            '0542389de25b787577c0042a17c0e667eeadadc5670abd8357dd60a5d5d99d36'
            'a03b5c63b288b0334fd6e0340e3fb99e9e21850973efe7592ae116745e3bcbb5'
            '6f88dfdbcd28e8bd216d1011605288651463e0de4c189c870785064c86d53bc9'
            'd03ffe961a87b513a882fc77d40ec04465691bdb74f8d29d175e8cf8e08dff9e'
            'b5f0c411c6537ffa77fee21bf5b89a603317361844149cd17d55e41522d62632'
            'ee5d63c50646143c869efd74c205126e26a312d28b21ea6d151b89a4083b79ed'
            'f031e429df53762f52e3fff252aea566f6a145d631cfd0486d5e7ce55987e999'
            '0c91c462945bb6fc979ada9f81c957a299541ed0145ad948ab62827faf0235ec'
            'a1e0bd8cb85b948e2d9d4b47eb8652d45bc62fed2057c2d4119a23ac91fd87ef'
            '80d3ced391fe7c7d185188a99935e48b78151be0c562bdb107b09eb20f4e8499'
            'fe3f7b524a1b03f53bcf2a67419682c3d843519176605603b45e99b70bd48ba0'
            'ef11e3682c1c6c89de0afb6da04d8191536ba79351051ec16061ed83eb69a10a'
            '19c9357b886857ba90928fb720b555d648f6434fa434adaf8f522ec8465246ad')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="@${SOURCE_DATE_EPOCH:-$(date +%s)}"

prepare() {
  cd $_srcname

  # apply realtime patch
  echo "Applying patch-${_pkgver}-rt${_rtpatchver}.patch"
  patch -Np1 -i "../patch-${_pkgver}-rt${_rtpatchver}.patch"

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config .config
  make olddefconfig
#  make menuconfig # CLI menu for configuration

  make -s kernelrelease > version
  echo "Prepared %s version %s" "$pkgbase" "$(<version)"
}

build() {
  cd $_srcname
  make bzImage modules htmldocs
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
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

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"

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

  # this is gone in v5.3
  mkdir "$builddir/.tmp_versions"

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

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing documentation..."
  mkdir -p "$builddir"
  cp -t "$builddir" -a Documentation

  echo "Removing doctrees..."
  rm -r "$builddir/Documentation/output/.doctrees"

  echo "Moving HTML docs..."
  local src dst
  while read -rd '' src; do
    dst="$builddir/Documentation/${src#$builddir/Documentation/output/}"
    mkdir -p "${dst%/*}"
    mv "$src" "$dst"
    rmdir -p --ignore-fail-on-non-empty "${src%/*}"
  done < <(find "$builddir/Documentation/output" -type f -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
