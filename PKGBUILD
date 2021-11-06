# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgbase=linux-t2
pkgver=5.15
_srcname=linux-${pkgver}
pkgrel=1
pkgdesc="Patched Linux Kernel with support for T2 Mac's and their newer broadcom firmware"
arch=(x86_64)
url="https://github.com/jamlam/mbp-16.1-linux-wifi"
license=('GPL3')
groups=()
depends=()
makedepends=(bc kmod libelf pahole cpio perl tar xz
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git)
checkdepends=()
optdepends=()
provides=(linux-t2)
conflicts=()
replaces=()
backup=()
options=('!strip')
source=(
# Linux Kernel
https://www.kernel.org/pub/linux/kernel/v${pkgver//.*}.x/linux-${pkgver}.tar.xz
https://www.kernel.org/pub/linux/kernel/v${pkgver//.*}.x/linux-${pkgver}.tar.sign
# Config File
https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/linux/trunk/config
#Patches
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/0002-HID-quirks-Add-Apple-Magic-Trackpad-2-to-hid_have_sp.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/2001-drm-amd-display-Force-link_rate-as-LINK_RATE_RBR2-fo.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/3001-applesmc-convert-static-structures-to-drvdata.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/3002-applesmc-make-io-port-base-addr-dynamic.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/3003-applesmc-switch-to-acpi_device-from-platform.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/3004-applesmc-key-interface-wrappers.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/3005-applesmc-basic-mmio-interface-implementation.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/3006-applesmc-fan-support-on-T2-Macs.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4001-HID-apple-Add-support-for-keyboard-backlight-on-supp.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4002-HID-apple-Add-support-for-MacbookAir8-1-keyboard-tra.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4003-HID-apple-Add-support-for-MacBookPro15-2-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4003-HID-apple-Add-support-for-MacBookPro15-2-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4004-HID-apple-Add-support-for-MacBookPro15-1-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4005-HID-apple-Add-support-for-MacBookPro15-4-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4006-HID-apple-Add-support-for-MacBookPro16-2-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4007-HID-apple-Add-support-for-MacBookPro16-3-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4008-HID-apple-Add-support-for-MacBookAir9-1-keyboard-tra.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4009-HID-apple-Add-support-for-MacBookPro16-1-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/6001-media-uvcvideo-Add-support-for-Apple-T2-attached-iSi.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/7001-drm-i915-fbdev-Discard-BIOS-framebuffers-exceeding-h.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/8001-corellium-wifi-bigsur.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/8002-Add-support-for-BCM4377.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/8003-Add-support-for-BCM4355.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/9001-bluetooth-add-disable-read-tx-power-quirk.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/9002-add-bluetooth-support-for-16,2.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/intel-lpss.patch
)
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	cd $_srcname

    #Setting version
    scripts/setlocalversion --save-scmversion
    echo "-$pkgrel" > localversion.10-pkgrel
    echo "${pkgbase#linux}" > localversion.20-pkgname

    # Applying patches
    local src
    for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  #Setting Config
    echo "Setting Config"
    cp ../config .config
    make olddefconfig

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
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  replaces=(virtualbox-guest-modules-arch wireguard-arch)
  provides=("linux=$pkgver")

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
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  provides=("linux-headers=$pkgver")

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

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

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
