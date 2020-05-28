# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>

pkgbase=linux-archmm
pkgver=5.6.15.arch1
pkgrel=1
pkgdesc='Linux with the BMQ CPU Scheduler and Multimedia Patches'
_srctag=v${pkgver%.*}-${pkgver##*.}
url="http://cchalpha.blogspot.com/"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc kmod libelf
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git
)
options=('!strip')

## Enable 1000HZ timer (UNCOMMENT)
_1k_HZ_ticks=y

## Enable Setup Menu (UNCOMMENT)
_menuconfig=y

## Linux Sources
_srcname=archlinux-linux

## BMQ CPU Scheduler
_bmqversion=5.6-r4
_bmq_patch="bmq_v${_bmqversion}.patch"

## GCC Optimization Patch
_reponame_gcc_patch="kernel_gcc_patch"
_repo_url_gcc_patch="https://github.com/graysky2/$_reponame_gcc_patch"
_gcc_patch_name="enable_additional_cpu_optimizations_for_gcc_v9.1+_kernel_v5.5+.patch"

source=(
  "$_srcname::git+https://git.archlinux.org/linux.git?signed#tag=$_srctag"
  config         # the main kernel config file
  sphinx-workaround.patch
  "${_bmq_patch}::https://gitlab.com/alfredchen/bmq/raw/master/${_bmqversion%-*}/${_bmq_patch}"
  "git+$_repo_url_gcc_patch"
  "futex-wait-multiple-5.2.1.patch"
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30'  # Jan Alexander Steffens (heftig)
)
sha256sums=('SKIP'
            'f392c9ecbb5177ea2573aaf22935322940ea2be0366f3fb9c9f861431f4aed21'
            '8cb21e0b3411327b627a9dd15b8eb773295a0d2782b1a41b2a8839d1b2f5778c'
            '1b95d36635c7dc48ce45a33d6b1f4eb6d34f51600901395d28fd22f28daee8e9'
            'SKIP'
            'b8a9225b4b5cbabac26398d11cc26566e4407d150dacb92f3411c9bb8cc23942')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname
  
  ## Setting Version
  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname
  
  ### GCC Optimization Patch
  msg2 "Patching with Graysky's additional gcc CPU optimizatons..."
  patch -Np1 -i "$srcdir/$_reponame_gcc_patch/$_gcc_patch_name"
  
  ## Apply BMQ CPU Scheduler Patch
  msg2 "Applying patch ${_bmq_patch}..."
  patch -Np1 -i "$srcdir/${_bmq_patch}"
  
  ## Apply FSYNC Patch
  msg2 "Applying the fsync patch"
  patch -Np1 -i "$srcdir/futex-wait-multiple-5.2.1.patch"
  
  echo "Setting config..."
  cp ../config .config
  make olddefconfig
  
  ### Optionally Set Tickrate To 1000
  if [ -n "${_1k_HZ_ticks}" ]; then
    msg2 "Setting tick rate to 1k..."
      sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' \
          -i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
          -i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' ./.config
  fi
  
  ### Optionally Run Setup Menu 
  if [ -n "${_menuconfig}" ]; then
    msg2 "Setup Menu"
      make nconfig
  fi
  
  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make -j$(nproc) all
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  replaces=(virtualbox-guest-modules-arch wireguard-arch)

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
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"

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

# vim:set ts=8 sts=2 sw=2 et:
