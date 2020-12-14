# Maintainer: NobodyDBG <niemandausduisburg@gmx.net>

pkgbase=linux-vanilla-selinux-54
pkgname=linux-vanilla-selinux-54
pkgver=5.4.82
pkgrel=1
pkgdesc="Vanilla-Linux-Kernel (5.4) from kernel.org with Selinux enabled"
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=(bc kmod libelf
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git)
options=('!strip')
_srcname=linux-vailla-selinux-54${pkgver}
_origsrcname=linux-${pkgver}
source=(https://www.kernel.org/pub/linux/kernel/v5.x/${_origsrcname}.tar.{xz,sign}
        'config'         # the main kernel config file
        'linux-vanilla-selinux-54.install' # Installfile
        '60-linux.hook'  # pacman hook for depmod
        '90-linux.hook'  # pacman hook for initramfs regeneration
        'linux-vanilla-selinux-54.preset'   # standard config files for mkinitcpio ramdisk
        'sphinx.patch' # Sphinx Patch for generating docs
)
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds <torvalds@linux-foundation.org>
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman (Linux kernel stable release signing key) <greg@kroah.com>
              )
# https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
sha512sums=('ec3ebb354a9949e007fd58ec0eb62739e1faab43a08f0f36c2e44c4fc743d6f7ead611e881553a6caebaee3c1c2d6a3d55abb2b8b3f22abaaf327a66fbf9d863'
            'a9dfea8115a080d0502ac93bf697e75492d9b9f6c0856cde68cd8ab362a3d94fa23575bcde1816e13db35dd6791b398f02a6a1f3fef3a5f5608b2e9d246ddc53'
	    '9f11f0b4097a1c87680255d39a6040db8c7becc3d5e1c435121e8966402c853fbd7ea68a68387d436bd0388664de20dcad82ba8eb799718846db1c385c5907b2'
            'fc52feda32be644deeadf267fdff124ffcc0d0870c36e736024a7be0958ba4b50cea5ef0ec33c2681ad00f36b42ebed354fa3e63bd4827acbeedebc39029229c'
            '7132a74149b39e30f57a0ef70330fbdf8f38a33bd88ba94f1115de098319e41af0ae86091a1e610e209fc87a9823f69da5c883b0a2fd7adc203578cc4ab08733'
            '06481e0492d8ec0f353672fbd1d71322b105849871975f434f87bcb33ca898f85407403ba935153e5d8cca44fea62bfbb43404871d12f26891579067a36fae19'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf'
            '8081673a6594e5fc2fddc98fa434e99817aa822f7136d3c14c8d465fa7b93c9ac5d3a4150a5b632e25b1dc76a814dfa19d8aede37d58b935db288465b6585c58')

_kernelname=${pkgbase#}
: ${_kernelname:=-Arch-vanilla-selinux-54}

prepare() {
  cd $_origsrcname

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

  make -s kernelrelease > version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"
}

build() {
  cd $_origsrcname
  make all
  make htmldocs
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  backup=("etc/mkinitcpio.d/$pkgbase.preset")
  install=$pkgbase.install

  cd $_origsrcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
  install -Dm644 "$modulesdir/vmlinuz" "$pkgdir/boot/vmlinuz-$pkgbase"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  msg2 "Installing hooks..."
  # sed expression for following substitutions
  local subst="
    s|%PKGBASE%|$pkgbase|g
    s|%KERNVER%|$kernver|g
  "

  # hack to allow specifying an initially nonexisting install file
  sed "$subst" "$startdir/$install" > "$startdir/$install.pkg"
  true && install=$install.pkg

  # fill in mkinitcpio preset and pacman hooks
  sed "$subst" ../$pkgbase.preset | install -Dm644 /dev/stdin \
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

  cd $_origsrcname
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
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"

  cd $_origsrcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

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
