# Maintainer: Pieter Lenaerts <pieter dot aj dot lenaerts at gmail>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=linux-x205ta
_srcver=4.18.9-arch1
pkgver=${_srcver//-/.}
pkgrel=1
arch=(x86_64)
url="https://git.archlinux.org/linux.git/log/?h=v$_srcver"
license=(GPL2)
makedepends=(xmlto kmod inetutils bc libelf git python-sphinx graphviz)
options=('!strip')
_srcname=archlinux-linux
source=(
  "$_srcname::git+https://git.archlinux.org/linux.git?signed#tag=v$_srcver"
  config         # the main kernel config file
  60-linux.hook  # pacman hook for depmod
  90-linux.hook  # pacman hook for initramfs regeneration
  linux.preset   # standard config files for mkinitcpio ramdisk

  # TODO: check hans' patches' :-)
  https://raw.githubusercontent.com/harryharryharry/x205ta-iso2usb-files/master/brcmfmac43340-sdio.txt
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.18-patches/i915-pm-Be-less-agressive-with-clockfreq-changes-on-Bay-Trail.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.18-patches/intel_idle-Disable-C6N-and-C6S-on-Bay-Trail.patch
#  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.16-patches/fix_c-state_patch_v4.16.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.18-patches/brcmfmac-p2p-and-normal-ap-access-are-not-always-possible-at-the-same-time.patch
#  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.16-patches/allow-s0i3-suspend-unified-4.16.patch

)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  '8218F88849AAC522E94CF470A5E9288C4FA415FA'  # Jan Alexander Steffens (heftig)
)
sha256sums=('SKIP'
            'b7d80725b510cae0cb1e476eb2ac131bf2971f210951658f50c13c8282c1bf06'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65'
            'aea75c0b07673f701856e3c2a35db33c041fdaf0bd5ef2927fb25b1bce2c2b62'
            '5ad7e021452deffd387a5b81abcd0f608f8141eaab56fbdd162ca0b7966fc3b4'
            '3845aeb3744372b716c668283b23972d76e482d8c69b107e13a13669e5671d06'
            'ad0f318809d074ee387f48fdfcb711b0fa3eb378867ac65c6da3d490834e649d')


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

  # Here start x205ta patches
  # Refer to https://github.com/harryharryharry/x205ta-patches for harryharryharry's gathered patches
  # Refer to https://ubuntuforums.org/showthread.php?t=2254322&page=158&p=13625163#post13625163 for harryharryharry's kernel compile guide

  # Install wifi firmware with 5 Ghz support.
  # Refer to https://ubuntuforums.org/showthread.php?t=2254322&page=192&p=13756881#post13756881
  mkdir -p ${pkgdir}/usr/lib/firmware/brcm/
  cp ${srcdir}/brcmfmac43340-sdio.txt ${pkgdir}/usr/lib/firmware/brcm/

  # Harryharryharry's patch to allow power efficient s0i3 state to be entered during suspend
  # Refer to https://ubuntuforums.org/showthread.php?t=2254322&page=158&p=13625163#post13625163 for harryharryharry's kernel compile guide
#  patch -Np1 --verbose -i ../allow-s0i3-suspend-unified-4.16.patch

  # patch attempts to prevents baytrail kernel freezes - thanks to jbMacAZ
  # refer to https://bugzilla.kernel.org/show_bug.cgi?id=109051#c829 for statement that this seems the more effective patch.
  # refer to https://drive.google.com/file/d/1uZeTQa6sWdtwXBIa8de5hkwEKeDeUR30/view for the patch, but to
  # https://drive.google.com/drive/folders/0B4s5KNXf2Z36Nkxac245LTBGdjQ for an overview of patches for ASUS T100H, where this
  # patch is published.
#  patch --verbose -Np1 -i ../fix_c-state_patch_v4.16.patch

  # The next two patches come from Hans De Goede and should bring a lower power suspend.
  # Refer to https://github.com/jwrdegoede/linux-sunxi/commit/2a02df1192d2718ac7eaa871e2941840375f1e8c
  # and https://github.com/jwrdegoede/linux-sunxi/commit/bdb7d50f49e758ce78a59e894f9be98db6e15049
  #patch -Np1 -i ../i915-pm-Be-less-agressive-with-clockfreq-changes-on-Bay-Trail.patch
  #patch -Np1 -i ../intel_idle-Disable-C6N-and-C6S-on-Bay-Trail.patch

  # patch to hide dmesg errors of brcmfmac trying to enable a p2p device
  # refer to https://patchwork.kernel.org/patch/9592913/
  #patch -Np1 -i ../brcmfmac-p2p-and-normal-ap-access-are-not-always-possible-at-the-same-time.patch

  # x205ta patches end here

  # copying the x205ta config.
  # harryharryharry's x205ta config file, updated to current package version.
  # Upstream is not always available and not always at the version of core-x86_64.
  # Upstream should be at http://x205ta.myftp.org:1337/kernel/.config

  # Config changes required to build more closely to arch.

  # Harryharryharry seems to prefer STACK_VALIDATION and HAVE_STACK_VALIDATION = n , but arch's default kernel wants that to y.
  # That's related to the unwinder, where arch prefers ORC and not Frame point unwinder like H.
  # Therefore, don't forget to enable ORC unwinder, which enables STACK_VALIDATION, which provides objtool, which is required later on to package headers.
  # In menuconfig, kernel hacking, choose kernel unwinder at bottom, ORC
  #cp -Tf ../config_x205ta .config

  # Remove existing LOCALVERSION stuff from .config

  # Here ends x205ta stuff.
  make -s kernelrelease > ../version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<../version)"
}

build() {
  cd $_srcname
  make bzImage modules htmldocs
  make bzImage modules
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
  [[ $pkgbase = linux ]] && groups=(base)
  depends=(coreutils linux-firmware kmod mkinitcpio)
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
