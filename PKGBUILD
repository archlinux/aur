# Maintainer: Émile Nemo <emile.nemo@protonmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

# This PKGBUILD is just a lightly modified version of
# https://gitlab.archlinux.org/packaging/packages/linux
# maintained by Heftig for the 'linux' package in the Arch 'Core' repo. 

pkgbase=linux-stub
pkgver=6.17.6.arch1
pkgrel=1
#pkgdesc
  _oldpkgdesc='Linux'
  _newpkgdesc="with initramfs dependency made optional and CONFIG_DEV_BLK_NVME=y"
  pkgdesc="$_oldpkgdesc, $_newpkgdesc."
url='https://github.com/archlinux/linux'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(
  bc
  cpio
  gettext
  libelf
  pahole
  perl
  python
  rust
  rust-bindgen
  rust-src
  tar
  xz
)
options=(
  !debug
)
_srcname=linux-${pkgver%.*}
_srctag=v${pkgver%.*}-${pkgver##*.}
source=(
  # Linux kernel source
    https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  # Patch(s) for the Linux kernel for Arch
      $url/releases/download/$_srctag/linux-$_srctag.patch.zst{,.sig}
  # The main kernel config file from the 'linux' package for the Arch 'Core' repo
    config::https://gitlab.archlinux.org/api/v4/projects/42594/repository/files/config/raw/\?ref\=$pkgver-$pkgrel
)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
  83BC8889351B5DEBBB68416EB8AC08600F108CDF  # Jan Alexander Steffens (heftig)
)
# https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
# https://gitlab.archlinux.org/packaging/packages/linux/blob/6.17.6.arch1-1/PKGBUILD
sha256sums=('8ecfbc6b693448abb46144a8d04d1e1631639c7661c1088425a2e5406f13c69c'
            'SKIP'
            '2e3bf9e69ac48051577b68c84ec19848398f30ee756e34eac20bfff61a8c8c0f'
            'SKIP'
            '0375e500f576666d0fe96ebac09063140222ec710d4df0ad2f46b87dd717ad8a')
b2sums=('00861fe396f5024c50aa62d0cb235281726061200aa32aa27ae7aeeda13928c5d92cab8a27687884ae7c317f0e682ea2c779ab0ce2ebec19dc0b1f4740e2d143'
        'SKIP'
        '5c9e1fc22dff7a0e38c42e882a0b563cd07016a0a8c7f13fde0fc886175f642612f6623166a63942500d1972ddcb61a5b751fe0ed6160d756573162418a3f745'
        'SKIP'
        '23373d4c5f20f37ef4a1a47c9abadaa7dbe613adb22fa7b1cc650234b77103c31b4d2a89af1774d6353405a742cc3cd0d7dd791c31ac1b16881af17a0e5fe701')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
    echo "-$pkgrel" > localversion.10-pkgrel
    echo "${pkgbase#linux}" > localversion.20-pkgname

  #Applying patchs
    local src
    for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      src="${src%.zst}"
      [[ $src = *.patch ]] || continue
      echo "Applying patch $src..."
      patch -Np1 < "../$src"
    done

  echo "Setting config..."
    sed -i 's/CONFIG_BLK_DEV_NVME=m/CONFIG_BLK_DEV_NVME=y/' ../config
    cp ../config .config
    make olddefconfig
    diff -u ../config .config || :

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make all
  make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
}

_package() {
  pkgdesc="kernel and modules for the $_oldpkgdesc kernel, $_newpkgdesc."
  depends=(
    coreutils
    kmod
  )
  optdepends=(
    'initramfs: for early-userspace boot support'
    'linux-firmware: firmware images needed for some devices'
    'scx-scheds: to use sched-ext schedulers'
    'wireless-regdb: to set the correct wireless channels of your country'
  )
  provides=(
    KSMBD-MODULE
    NTSYNC-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
    # From replace:
      virtualbox-guest-modules-arch
      wiregard-arch
  )

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
    _imagename="$(make -s image_name)"

  # Add the vmlinuz to /boot/
    install -Dm644 "$_imagename" "$pkgdir/boot/vmlinuz-$pkgbase"
  
  # Systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 "$_imagename" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
    echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
    ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 DEPMOD=/doesnt/exist \
     modules_install
    # Suppress depmod

  # Remove build link
    rm "$modulesdir"/build
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $_oldpkgdesc kernel, $_newpkgdesc."
  depends=(pahole)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
    install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map localversion.* \
     version vmlinux tools/bpf/bpftool/vmlinux.h
    install -Dt "$builddir/kernel" -m644 kernel/Makefile
    install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
    cp -t "$builddir" -a scripts
    ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

  # Required when STACK_VALIDATION is enabled
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # Required when DEBUG_INFO_BTF_MODULES is enabled
    install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  echo "Installing headers..."
    cp -t "$builddir" -a include
    cp -t "$builddir/arch/x86" -a arch/x86/include
    install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  # idk :')
    install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
    install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
    install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
    install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
    install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
    install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
    install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
    find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Installing Rust files..."
    install -Dt "$builddir/rust" -m644 rust/*.rmeta
    install -Dt "$builddir/rust" rust/*.so

  echo "Installing unstripped VDSO..."
    make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install link=  # Suppress build-id symlinks

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
      case "$(file -Sib "$file")" in
        application/x-sharedlib\;*)           # Libraries (.so)
          strip -v $STRIP_SHARED "$file" ;;
        application/x-archive\;*)             # Libraries (.a)
          strip -v $STRIP_STATIC "$file" ;;
        application/x-executable\;*)          # Binaries
          strip -v $STRIP_BINARIES "$file" ;;
        application/x-pie-executable\;*)      # Relocatable binaries
          strip -v $STRIP_SHARED "$file" ;;
      esac
    done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Stripping vmlinux..."
    strip -v $STRIP_STATIC "$builddir/vmlinux"

  echo "Adding symlink..."
    mkdir -p "$pkgdir/usr/src"
    ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

pkgname=(
  "$pkgbase"
  "$pkgbase-headers"
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done