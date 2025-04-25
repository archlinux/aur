# Maintainer: Charlie Wolf <charlie@wolf.is>
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_rtver=51
_rtbase=6.1.134
pkgbase=linux-rt-lts61
pkgver=6.1.134
pkgrel=1
pkgdesc='LTS Linux with realtime patches'
url='https://www.kernel.org'
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc
  cpio
  gettext
  libelf
  pahole
  perl
  python
  tar
  xz

  # htmldocs
  graphviz
  imagemagick
  python-sphinx
  texlive-latexextra
)
options=('!strip')
_srcname=linux-$pkgver
_srctag=v$pkgver
source=(
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  https://cdn.kernel.org/pub/linux/kernel/projects/rt/${pkgver:0:3}/patches-${_rtbase}-rt${_rtver}.tar.{gz,sign}
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  0004-Sphinx-7.2.2-8.0-PosixPath.patch
  '0005-depmod-remove-depmod_hack_needed.patch'
  '0006-kernel-6.1-depmod-disable-for-packaging.patch'
  config  # the main kernel config file
)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
  D5653EA39C8675DA4BD5971C13B55DD07C53B851  # Clark Williams
)
# https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
md5sums=('76e3de2ec40534b2003c4a0d963c458e'
         'SKIP'
         'eb21b9d3e7ce7408036d253dcf3e1471'
         'SKIP'
         'cb32cb125ea45ac05782630dfc9fc951'
         '806e76e95002ecbf49b03d6e655dc567'
         'd15820a808c3cc159e6e5916a8c05e8f'
         'f24ee48c4c30cb428d0258aa3c25bd19'
         'ba035ba9a8d8cd396d3e368de8c4c7fb')
sha256sums=('60c70cdd70ddee384c004242e67844e3dd1fe28f75b26b3586859fff0a07bd23'
            'SKIP'
            'e5f7376f1ce561b3912ac346e09561bbace3ddc4a897216d1e1a60c7af91933a'
            'SKIP'
            '21195509fded29d0256abfce947b5a8ce336d0d3e192f3f8ea90bde9dd95a889'
            '08ef05d8a4fc8117d131f219d753caa138a0fb7c8f00690ff6dc35ac6aacdb83'
            '64b521b3963781c60e9a33db40c523bf65a119cb1dfec182a737e90d2609df5a'
            '20d2afcc83f04d5409dcb5452763c625069dc00bfa7e60457902256dfbb58bdd'
            'f02a74973a4e3a2165a82e62cb682e0eed8bb5ade6f951564c45d24e2b5f07ff')
b2sums=('40738667b2878f75f063baaab0208fc9f43309026c9a4518d898292fcf7f04e7d9adbcab1e57e8501e8caa87dbf7dc581a5c9c9eea99bd80fa6e7c6c31d71d47'
        'SKIP'
        '651b69bf3a0cf90e8caabe353c76581a47da1278a0535826091e5a1704221f1576e746f14f8c28d530b99f5a2925d68acea185bffecf4f03b5d58dabaf20775a'
        'SKIP'
        '02a10396c92ab93124139fc3e37b1d4d8654227556d0d11486390da35dfc401ff5784ad86d0d2aa7eacac12bc451aa2ff138749748c7e24deadd040d5404734c'
        'a208eece0028ca98e64637b58d0d4c2e641a111d2f8f9f4a9c71531bb12f75edae14c9e7dbeb840d88be9fdc0b0022cf0a30e3f6a9c34d58e068e02a79940ea8'
        'a0cb29f2c4a4bbd815daa2fc399c7014dcc880a73130f5cf26a0e428b73e23911858a9274e15b62c3cd90a82f6c46c83ecfb4b2fdcdaef8e10bf24f6766ae049'
        '7b24fa23ffb4ef7c998e7b43a60d3df094220ff6e60f49cb4a9dcd712f657b40c022bf1b94f81d41ddb4008ef3200649a672025ccf63f50079320a951538cb4f'
        '1a1adfb82e2d8a7fa9153ef4277a3d660e7f44af213e8b4039c4675991a115c05dc563575157c470341d4d990a02b74fefba322fbce22ad060d369be69e67fe9')
export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  for patch in ../patches/*.patch; do
    echo "Applying patch $patch..."
    patch -Np1 < "$patch"
  done

  echo "Setting config..."
  cp ../config .config
  make olddefconfig
  diff -u ../config .config || :

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  nice -n1 make all
  nice -n1 make -i htmldocs SPHINXOPTS='--keep-going'
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed for some devices'
  )
  provides=(
    KSMBD-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )
  replaces=(
    wireguard-lts
  )

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=(pahole)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

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

pkgname=(
  "$pkgbase"
  "$pkgbase-headers"
  "$pkgbase-docs"
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
