# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Peter Jung (ptr1337) <admin@ptr1337.dev>


pkgbase=linux-cacule-rdb-rt
_major=5.10
_minor=42
pkgver=${_major}.${_minor}
_pkgver=${_major}.${_minor}
_srcname=linux-${_pkgver}
pkgrel=2
pkgdesc='Linux-Cacule-RDB-RT'
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc kmod libelf pahole cpio perl tar xz
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git
  )
options=('!strip')
_patchsource="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/5.10"
_caculepatches="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/CacULE"
source=(
  "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
  config         # the main kernel config file
  "${_caculepatches}/v5.10/cacule-5.10-rt.patch"
  "${_caculepatches}/v5.10/rdb-5.10-rt.patch"
  "${_patchsource}/bbr2-patches-v3/0001-bbr2-5.10-introduce-BBRv2.patch"
# ${_patchsource}/bfq-patches-v5/0001-bfq-patches.patch"
# "${_patchsource}/block-patches-v3/0001-block-patches.patch"
  "${_patchsource}/cpu-patches-v2/0001-cpu-patches.patch"
# "${_patchsource}/fixes-miscellaneous-v11/0001-fixes-miscellaneous.patch"
  "${_patchsource}/mm-patches-v4/0001-mm-patches.patch"
  "${_patchsource}/lqx-patches-v4/0001-lqx-patches.patch"
  "${_patchsource}/zstd-upstream-patches/0001-zstd-upstream-patches.patch"
# ${_patchsource}/clearlinux-patches/0001-clearlinux-patches.patch"
  "${_patchsource}/futex-dev-patches/0001-futex-dev-patches.patch"
# "${_patchsource}/futex2-trunk-patches-v3/0001-futex2-resync-from-gitlab.collabora.com.patch"

)

sha512sums=('c55fadf0a2b3cf43ef65fdd58768fe13cc3e4d8cd6876897a6feca75c414c4e5ecaed61b96128c16ccdeb184ea0044dd36eb02bcb09c58d9a8ee88946d88c0be'
            'a578e9c04507b51d2f632df7e2dc03a73ac60008da9c377615fb969fe46904d17fa568292f65e7f4d270ad7cecf347b9ea7521fed50b2e014a03f8928ace99cd'
            '65d8ac151edeec80facf82f729381ff48bd6a8f346d305b42e51c1fcaa3d9221b1f907c75547eb860732329ba167f09b64adbdedc00421f90c18e369e6c0569b'
            '71725cc17f1d4d3ee0a6f040bad8be2775d85dda3b44733e9dc8cf76776d3d3acbb09bf3d252a0b48e7e3e773940af9f9ef31780cc454d7ff1a2f1e158acbe93'
            '1ecbd7a28489ce68939a78eeeafd0a4b0064b26dd68cd8df661effa3729fa9c087211c1758db98289d3ec6f9f9071fea0f815ed57fa6188ef5fcca3f85ef6e9d'
            'cc33f1db2b449e1e277100fd87e099a4addbfef69e8ba77f92f30b5e2273aee31d04a09c26a3175ad1d2b269764df57934107d55cc615f121529ed0a42c34524'
            'f649ffc0c4ecdc0168aaa852751336209f4166976470a47f912550e64bbe0e0c128fc3ab7dc23d6f0fcdce56bcc2562d1e11826c5be866811eb58f5b15a5c1fd'
            '61dddce21ae29042b952f145698f47ca6dce8a6d36e1a1a60efe01bb78d6defaaa9ba3cd69314519363d6e853a9de0ef8af5154c0b3af95789dbe6f0706bfc21'
            '40b2139abe3f946c550e2b4c5e3d7360db8fecc9837defca13b445503c7a3eb05bd746dc4a11d516f575cfacb266548627feec1d29b8c21182871c20cf2f8b6e'
            '164f33f8d7e9a55acd82c789d7204f41f0a32c9aaea2b77c8ce9d6aa0eac883c77d992fa72254fad7f53177d2240dccc0d3c8a999f94aa1eaef34ab3d410240a')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

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

  #  make LSMOD=$HOME/.config/modprobed.db localmodconfig ## For modprobed

    source "${startdir}"/configure

    cacule_config

    cpu_arch

  make menuconfig

  cat .config > "${startdir}/config.last"


}

build() {
  cd $_srcname
  make all
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
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

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

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
