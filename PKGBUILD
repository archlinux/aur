# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Pieter Lenaerts <pieter dot aj dot lenaerts at gmail>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=linux-x205ta
pkgver=4.19.123
pkgrel=2
pkgdesc='Linux Kernel with x205ta patches (LTS as there are no newer patches)'
url="https://www.kernel.org/"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc kmod libelf
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
)
options=('!strip')
_srcname=linux-$pkgver
source=(
  https://www.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  config         # the main kernel config file
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  sphinx-workaround.patch
  # Start x205ta sources
  https://raw.githubusercontent.com/harryharryharry/x205ta-iso2usb-files/master/brcmfmac43340-sdio.txt
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.18-patches/i915-pm-Be-less-agressive-with-clockfreq-changes-on-Bay-Trail.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.18-patches/intel_idle-Disable-C6N-and-C6S-on-Bay-Trail.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.18-patches/brcmfmac-p2p-and-normal-ap-access-are-not-always-possible-at-the-same-time.patch
  # End x205ta sources
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
# https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
sha256sums=('a79914d31a8d8c6b0e2bb0f2b143d615fe8a6c4dd2e0f36e97aa20efd69a993f'
            'SKIP'
            '4e68572e7cc4c5368f0236e0792660ae8498373988625dca46e509399a7eaea6'
            'a13581d3c6dc595206e4fe7fcf6b542e7a1bdbe96101f0f010fc5be49f99baf2'
            'a369e89baf2f87be196c7e044ca719ee2985beebfdaa16dcd4592afa52caea5c'
            'aea75c0b07673f701856e3c2a35db33c041fdaf0bd5ef2927fb25b1bce2c2b62'
            '5ad7e021452deffd387a5b81abcd0f608f8141eaab56fbdd162ca0b7966fc3b4'
            '3845aeb3744372b716c668283b23972d76e482d8c69b107e13a13669e5671d06'
            'ad0f318809d074ee387f48fdfcb711b0fa3eb378867ac65c6da3d490834e649d')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

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


  # Here ends x205ta stuff.
  make -s kernelrelease > ../version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<../version)"
}

build() {
  cd $_srcname
  make bzImage modules htmldocs
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with harryharryharry's patches for the ASUS x205ta."
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

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

  msg2 "Installing hooks..."
  # sed expression for following substitutions
  local subst="
    s|%PKGBASE%|$pkgbase|g
    s|%KERNVER%|$kernver|g
    s|%EXTRAMODULES%|$extramodules|g
  "

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel with harryharryharry's patches for the ASUS x205ta."

  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  cd $_srcname

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
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel with harryharryharry's patches for the ASUS x205ta."

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
