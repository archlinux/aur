# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgbase=linux-surface4       # Build kernel with a different name
_srcver=4.18.8
pkgver=${_srcver//-/.}
pkgrel=1
arch=(x86_64)
url="https://www.kernel.org/pub/linux/kernel/v4.x/"
license=(GPL2)
makedepends=(xmlto kmod inetutils bc libelf git python-sphinx graphviz)
options=('!strip')
_srcname=linux-${_srcver}
source=(
  "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${_srcver}.tar.xz"
  "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${_srcver}.tar.sign"
  update-firmware.sh
  config         # the main kernel config file
  60-linux.hook  # pacman hook for depmod
  90-linux.hook  # pacman hook for initramfs regeneration
  linux.preset   # standard config files for mkinitcpio ramdisk
  ipts.patch
  keyboards_and_covers.patch
  sdcard_reader.patch
  surfacedock.patch
  wifi.patch
  "https://github.com/czheji/linux-surface/raw/master/firmware.zip"

)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  '8218F88849AAC522E94CF470A5E9288C4FA415FA'  # Jan Alexander Steffens (heftig)
)
sha256sums=('f1551bad69ab617708fa8cf3f94545ae03dd350bdeb3065fbcf39c1a7df85494'
            'd193b48d601b649720ac8a68d811f5b679b683b87f7a35322d295a81498615f5'
            '44adcf5a8394d747aacc93bee1fe843cc0c9875ec3f854afb7acb212f4fa0c18'
            '0c19f6558c6b651350ff4155bbe00e5cfa7b22bbf88e3c8040dd7fd020c86114'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65'
            'a6a40cb4781ae8d31ec4a6580f3e0a1c6f3bb20c5b8a5103f7fff279bce37e40'
            '5f51ddfd49f581aed02141ff11ffaa556d4737d34b9958d342a84c0149c5bba6'
            '7b58bf7bf2d61fea106af24b37ee4e2c5faf7e4ffa55be5769a1b1d0c5fb04af'
            'cbad22346c934a52a42716c8af604154b52c21dccc938e22a40eb51f9179ae0e'
            '0526f56347aa4c7f8b604c614300baff1da3dddb2930b4c2b8890622c6e99e82'
            '75c9db69d7e7e5d90683a797347b1c9d19f27f80be25e57f4110ff2b9e1e9e5b')

_kernelname=${pkgbase#linux}
: ${_kernelname:=-ARCH}

prepare() {
  cd $_srcname

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "$_kernelname" > localversion.20-pkgname

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

  make -s kernelrelease > ../version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<../version)"
}

build() {
  cd $_srcname
  make -j2 bzImage modules htmldocs
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
  [[ $pkgbase = linux ]] && groups=(base)
  depends=(coreutils linux-firmware kmod mkinitcpio dmidecode unzip)
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/$pkgbase.preset")
  install=linux.install

  local kernver="$(<version)"

  cd $_srcname

  msg2 "Installing boot image..."
  install -Dm644 "$(make -s image_name)" "$pkgdir/boot/vmlinuz-$pkgbase"

  msg2 "Installing modules..."
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"
  mkdir -p "$modulesdir"
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # a place for external modules,
  # with version file for building modules and running depmod from hook
  local extramodules="extramodules$_kernelname"
  local extradir="$pkgdir/usr/lib/modules/$extramodules"
  install -Dt "$extradir" -m644 ../version
  ln -sr "$extradir" "$modulesdir/extramodules"

  # remove build and source links
  rm "$modulesdir"/{source,build}

  msg2 "Installing hooks..."
  # sed expression for following substitutions
  local subst="
    s|%PKGBASE%|$pkgbase|g
    s|%KERNVER%|$kernver|g
    s|%EXTRAMODULES%|$extramodules|g
  "

  # hack to allow specifying an initially nonexisting install file
  sed "$subst" "$startdir/$install" > "$startdir/$install.pkg"
  true && install=$install.pkg

  # fill in mkinitcpio preset and pacman hooks
  sed "$subst" ../linux.preset | install -Dm644 /dev/stdin \
    "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
  sed "$subst" ../60-linux.hook | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/60-$pkgbase.hook"
  sed "$subst" ../90-linux.hook | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/90-$pkgbase.hook"

  msg2 "Intall i915 & ipts firmware..."
  sed "$subst" ../update-firmware.sh | install -Dm755 /dev/stdin \
    "$pkgdir/usr/bin/$pkgbase-firmware"
  install -Dm64 ../i915_firmware_bxt.zip "$pkgdir/usr/share/${pkgbase}/firmware/i915_firmware_bxt.zip"
  install -Dm64 ../i915_firmware_cfl.zip "$pkgdir/usr/share/${pkgbase}/firmware/i915_firmware_cfl.zip"
  install -Dm64 ../i915_firmware_cnl.zip "$pkgdir/usr/share/${pkgbase}/firmware/i915_firmware_cnl.zip"
  install -Dm64 ../i915_firmware_glk.zip "$pkgdir/usr/share/${pkgbase}/firmware/i915_firmware_glk.zip"
  install -Dm64 ../i915_firmware_kbl.zip "$pkgdir/usr/share/${pkgbase}/firmware/i915_firmware_kbl.zip"
  install -Dm64 ../i915_firmware_skl.zip "$pkgdir/usr/share/${pkgbase}/firmware/i915_firmware_skl.zip"
  install -Dm64 ../ipts_firmware_v101.zip "$pkgdir/usr/share/${pkgbase}/firmware/ipts_firmware_v101.zip"
  install -Dm64 ../ipts_firmware_v102.zip "$pkgdir/usr/share/${pkgbase}/firmware/ipts_firmware_v102.zip"
  install -Dm64 ../ipts_firmware_v103.zip "$pkgdir/usr/share/${pkgbase}/firmware/ipts_firmware_v103.zip"
  install -Dm64 ../ipts_firmware_v137.zip "$pkgdir/usr/share/${pkgbase}/firmware/ipts_firmware_v137.zip"
  install -Dm64 ../ipts_firmware_v76.zip "$pkgdir/usr/share/${pkgbase}/firmware/ipts_firmware_v76.zip"
  install -Dm64 ../ipts_firmware_v78.zip "$pkgdir/usr/share/${pkgbase}/firmware/ipts_firmware_v78.zip"
  install -Dm64 ../ipts_firmware_v79.zip "$pkgdir/usr/share/${pkgbase}/firmware/ipts_firmware_v79.zip"
  install -Dm64 ../nvidia_firmware_gp108.zip "$pkgdir/usr/share/${pkgbase}/firmware/nvidia_firmware_gp108.zip"
  install -Dm64 ../mrvl_firmware.zip "$pkgdir/usr/share/${pkgbase}/firmware/mrvl_firmware.zip"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"

  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  cd $_srcname

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 Makefile .config Module.symvers System.map vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  # ???
  mkdir "$builddir/.tmp_versions"

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
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase-$pkgver"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"

  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  cd $_srcname

  msg2 "Installing documentation..."
  mkdir -p "$builddir"
  cp -t "$builddir" -a Documentation

  msg2 "Removing doctrees..."
  rm -r "$builddir/Documentation/output/.doctrees"

  msg2 "Moving HTML docs..."
  local src dst
  while read -rd '' src; do
    dst="$builddir/Documentation/${src#$builddir/Documentation/output/}"
    mkdir -p "${dst%/*}"
    mv "$src" "$dst"
    rmdir -p --ignore-fail-on-non-empty "${src%/*}"
  done < <(find "$builddir/Documentation/output" -type f -print0)

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"

  msg2 "Fixing permissions..."
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
