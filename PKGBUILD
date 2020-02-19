# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributorr: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-rc
pkgrel=1
_srcname=linux-5.5
_major=5.5
### on initial release this is null otherwise it is the current stable subversion
### ie 1,2,3 corresponding $_major.1, $_major.3 etc.
_minor=4
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
0002-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch
0003-iwlwifi-mvm-Do-not-require-PHY_SKU-NVM-section-for-3.patch
0004-drm-i915-Wean-off-drm_pci_alloc-drm_pci_free.patch
0005-drm-Remove-PageReserved-manipulation-from-drm_pci_al.patch
0006-drm-i915-execlists-Always-force-a-context-reload-whe.patch
0007-drm-i915-Serialise-i915_active_acquire-with-__active.patch
0008-drm-i915-gem-Take-runtime-pm-wakeref-prior-to-unbind.patch
0009-drm-i915-gem-Avoid-parking-the-vma-as-we-unbind.patch
0010-drm-i915-gem-Try-to-flush-pending-unbind-events.patch
0011-drm-i915-gem-Reinitialise-the-local-list-before-repe.patch
0012-drm-i915-Add-a-simple-is-bound-check-before-unbindin.patch
0013-drm-i915-Introduce-a-vma.kref.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('48c03db86f96e1edffbd66c6eed953c84c76de42f23e1c6756b4fa09a2c90ecf'
            'SKIP'
            'ea40fd0deb0ba043c628ad4039c67ca9e4d8adc88d67d8b8c5a20f264403a6fb'
            'SKIP'
            'e967ac8bd663509cc0ca6451a95a9965eb59832e316eec77484960dcedec8c1c'
            '2be34867fcb55a5ab7ee0f25b3fbe4da1b4c55fd118053c9510a9b1e87ed0960'
            '39e2bd569c5efe83c2facddd9e0b846a6c35937b1280a9ddead5c150fa8ca10d'
            '07d60156eb70be84adc1376a3d7434811f1373282c0b5198c4cd580c8bfcaa7e'
            '853403b019a9495c72df52cabe85653590b9a4021343c09e2438c25b96aae163'
            '8385a3771e4d747a8c6d06bb9a3dd73870fc378ded8d0d0f2b1388b89813719b'
            '9556c74b7744ad863da61384d2b2b9e996be4652dd4d93d3fcab7f256b224f06'
            'fe4a15e4e85e0a1ab2e6e3ab790ba53eb5cf538b9a16b6e2327cb3c89f66fc75'
            'f0177eb3395c910064a9bbd7ae5849f0e6e0094227d2b01367978ca6553fc10c'
            '51d6e34f69be927600edb3fddbd0dda75773fb28818bcc35f540cf14501e1ef6'
            'b74618c46e3d2f17d851ccf36d57142a2187787f0e1f529e72898b1d267ab422'
            '586b7a558b47c443ccccbb6267ffe3fef59d14004b9d5c4591daca4999766fe9'
            '466cd85077249c54168dba181378d590009f0bb7215a119d1bed6ebbdfe35cd5'
            '127e6d1ead0c2ba5414038a7a3680e2303a230e88c55d2b6cbf35495dbe345e3')

_kernelname=${pkgbase#linux}

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd linux-${_fullver}

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  echo "Applying $_rcpatch..."
  patch -Np1 <"../$_rcpatch"

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

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
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

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  echo "Fixing permissions..."
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
