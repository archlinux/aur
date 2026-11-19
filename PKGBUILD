# Maintainer: Émile Nemo <emile.nemo@protonmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

# This PKGBUILD is just a lightly modified version of
# https://gitlab.archlinux.org/packaging/packages/linux
# maintained by Heftig for the 'linux' package in the Arch 'Core' repo. 

pkgbase=linux-stub
pkgver=7.3.5.arch1
pkgrel=1
#pkgdesc
  _oldpkgdesc='Linux'
  _newpkgdesc="with initramfs dependency made optional and CONFIG_DEV_BLK_NVME=y"
  pkgdesc="$_oldpkgdesc, $_newpkgdesc."
url='https://github.com/archlinux/linux'
arch=(
  x86_64
)
license=(GPL-2.0-only)
makedepends=(
  bc
  binutils
  cpio
  gettext
  glibc
  libelf
  libgcc
  openssl
  pahole
  perl
  python
  rust
  rust-bindgen
  rust-src
  tar
  xxhash
  xz
  zlib
  zstd
)
options=(
  !debug
  !strip
)
_srcname=linux-${pkgver%.*}
_srctag=v${pkgver%.*}-${pkgver##*.}
source=(
  # Linux kernel source
    https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  # Patch(s) for the Linux kernel for Arch
    $url/releases/download/$_srctag/linux-$_srctag.patch.zst{,.sig}
)
source_x86_64=(
  # The x86_64 kernel config file from the 'linux' package for the Arch 'Core' repo
    config-$pkgver-$pkgrel.x86_64::https://gitlab.archlinux.org/api/v4/projects/42594/repository/files/config.x86_64/raw/\?ref\=$pkgver-$pkgrel
)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
  83BC8889351B5DEBBB68416EB8AC08600F108CDF  # Jan Alexander Steffens (heftig)
)

# https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
# https://gitlab.archlinux.org/packaging/packages/linux/blob/7.3.5.arch1-1/PKGBUILD
sha256sums=('8f293f83d54f0b7b9be56863ebc5e4ea79d73e530b4ae55c572be97ef39f0990'
            'SKIP'
            'ab8cc9a56046bfdcbe8741283cb642fcb1ab25de4ac2b66fe655dd34e3ddc3b6'
            'SKIP')
sha256sums_x86_64=('75366b057ddfafeb2c02a902aebdcbeb36ddcd56de74c82b1eadf4fac308555a')
b2sums=('333bad17d6e6ae06935b08e8715cc617f59c0fdbab52dd1026a16b1125c8e693482946dc46f5b6e1f7c24a3919ddc44a8dd39f045dcb3d2da8b8001c113f13c0'
        'SKIP'
        'b4517a6cf6abb495af1df4884f66ffe79833fa8fe2cae08a00a88ee2ae508c3e68ce1f028faedf9dfcd0c8e687bbd7f9df5ed701417b9e23058f178256975f02'
        'SKIP')
b2sums_x86_64=('9862de977018fa89882f29a794cf73acfe410d3f4ff9a0a2b9529847af48a1b847887c8c75cf14beffcc5a5199895aa17c4319c047b8129f16d3964474081943')

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
    sed -i 's/CONFIG_BLK_DEV_NVME=m/CONFIG_BLK_DEV_NVME=y/' ../config-$pkgver-$pkgrel.$CARCH
    cp ../config-$pkgver-$pkgrel.$CARCH .config
    make olddefconfig
    diff -u ../config-$pkgver-$pkgrel.$CARCH .config || :

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
    "$pkgbase-headers: headers and scripts for building modules"
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

  # Suppress depmod
    ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install

  # Remove build link
    rm "$modulesdir"/build
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $_oldpkgdesc kernel, $_newpkgdesc."
  depends=(
    binutils
    glibc
    libelf
    lbgcc
    pahole
    xxhash
    zlib
    zstd
  )
  provides=(LINUX-HEADERS)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  local karch
  case $CARCH in
    x86_64) karch=x86 ;;
    *) echo "Unknown CARCH $CARCH"; exit 1 ;;
  esac

  echo "Installing build files..."
    install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map localversion.* \
     version vmlinux tools/bpf/bpftool/vmlinux.h
    install -Dt "$builddir/kernel" -m644 kernel/Makefile
    install -Dt "$builddir/arch/$karch" -m644 arch/$karch/Makefile
    cp -t "$builddir" -a scripts
    ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

    if [[ $(scripts/config -s CONFIG_HAVE_STACK_VALIDATION) = y ]]; then
      install -Dt "$builddir/tools/objtool" tools/objtool/objtool
    fi
     
    if [[ $(scripts/config -s CONFIG_DEBUG_INFO_BTF_MODULES) = y ]]; then
      install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
    fi
    
    echo "Installing headers..."
      cp -t "$builddir" -a include
      cp -t "$builddir/arch/$karch" -a arch/$karch/include
      install -Dt "$builddir/arch/$karch/kernel" -m644 arch/$karch/kernel/asm-offsets.s
    
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
    
    if [[ $(scripts/config -s CONFIG_RUST) = y ]]; then
      echo "Installing Rust files..."
        install -Dt "$builddir/rust" -m644 rust/*.rmeta
        install -Dt "$builddir/rust" rust/*.so
    fi
  
  echo "Installing unstripped VDSO..."
    make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install link=  # Suppress build-id symlinks
  
  echo "Removing unneeded architectures..."
    local arch
    for arch in "$builddir"/arch/*/; do
      [[ $arch = */$karch/ ]] && continue
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
