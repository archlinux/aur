# Maintainer: Simao Gomes Viana <devel@superboring.dev>
# Packager: Simao Gomes Viana <devel@superboring.dev>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jonathan Chan <jyc@fastmail.fm>
# Contributor: misc <tastky@gmail.com>
# Contributor: NextHendrix <cjones12 at sheffield.ac.uk>
# Contributor: Shun Terabayashi <shunonymous at gmail.com>
# Contributor: Brad McCormack <bradmccormack100 at gmail.com>
# Contributor: Doug Johnson <dougvj at dougvj.net>

pkgbase=linux-nitrous
_srcname=linux-nitrous
pkgver=6.6.4
pkgrel=1
arch=('x86_64')
url="https://gitlab.com/xdevs23/linux-nitrous"
license=('GPL2')
makedepends=(
  'clang>=16'
  'llvm>=16'
  'lld>=16'
  'bc' 'cpio' 'gettext' 'libelf'
  'pahole' 'perl' 'python' 'tar'
  'xz' 'graphviz' 'imagemagick' 'python-sphinx'
  'texlive-latexextra' 'coreutils' 'git'
  'inetutils' 'kmod' 'lzop' 'rust'
)
options=('!strip')
source=('git+https://gitlab.com/xdevs23/linux-nitrous.git#tag=v'"$pkgver-$pkgrel"
        # standard config files for mkinitcpio ramdisk
        "${_srcname}.preset")
sha256sums=('SKIP'
            '59cf1dfe08c144868ad87705dd62a0400921c042b1e12691e42cf214fe9a9402')

_kernelname=${pkgbase#linux}

clang_major_ver() {
  clang --version | head -n1 | cut -d ' ' -f3 | cut -d '.' -f1
}

# "Modern performance" – modifies the config to enable
# performance tuned to your specific machine (native-intel or native-amd)
USE_MPERFORMANCE=${USE_MPERFORMANCE:=false}

pkgver() {
  echo ${pkgver}
}

prepare() {
  :
}

_handle_lsmod() {
  if [ -f "$HOME/.config/modprobed.db" ]; then
    make LLVM=1 LSMOD=$HOME/.config/modprobed.db localmodconfig
  fi
}

build() {
  cd "${_srcname}"

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  _defconfig="nitrous_defconfig"

  rm -f .clang
  make LLVM=1 $_defconfig
  _handle_lsmod

  if $USE_MPERFORMANCE; then
    local cpu_vendor="$(lscpu | grep "Vendor ID" | head -n1 | cut -d ':' -f2 | awk '{ print $1 }')"
    cpu_type=""
    if [ "$cpu_vendor" == "GenuineIntel" ]; then
      cpu_type="INTEL"
    elif [ "$cpu_vendor" == "AuthenticAMD" ]; then
      cpu_type="AMD"
    fi
    if [ -n "$cpu_type" ]; then
      # Enable native compilation
      sed -i -re "s/CONFIG_MSKYLAKEX=y/# CONFIG_MSKYLAKEX is not set/g" .config
      sed -i -re 's/CONFIG_LOCALVERSION=.*/CONFIG_LOCALVERSION="-nitrous-mperformance"/g' .config
      echo "CONFIG_MNATIVE_${cpu_type}=y" >> .config
    fi
  fi

  make -s kernelrelease > version

  makeflags="${MAKEFLAGS}"
  if [[ "$MAKEFLAGS" != *"-j"* ]]; then
    makeflags="$makeflags -j$(grep -E '^processor\W' < /proc/cpuinfo | wc -l)"
  fi
  make LLVM=1 ${makeflags} all
}

_package() {
  pkgdesc="Modified Linux kernel optimized for Skylake X and newer, compiled using clang"
  depends=('coreutils' 'kmod' 'initramfs')
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    "linux-nitrous-headers=${pkgver}-${pkgrel}: to build DKMS modules against this kernel"
    'linux-firmware: Additional firmware blobs'
  )
  provides=(WIREGUARD-MODULE NTFS3-MODULE BINDER-MODULE binder_linux-dkms=${pkgver})
  __kernelname=linux-nitrous
  backup=("etc/mkinitcpio.d/linux-nitrous.preset")
  install=${pkgbase}.install

  cd "${_srcname}"

  KARCH=x86

  # get kernel version
  _kernver="$(make kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  local modulesdir="$pkgdir/usr/lib/modules/${_kernver}"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  # Also initramfs generators are using this for install/remove/upgrade detection
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  mkdir -p "${pkgdir}"/usr/{lib/modules,lib/firmware,boot}
  ZSTD_CLEVEL=19 make LLVM=1 INSTALL_MOD_PATH="${pkgdir}/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/does/not/exist modules_install

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/${__kernelname}.preset" "${pkgdir}/etc/mkinitcpio.d/${__kernelname}.preset"
  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${__kernelname}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${__kernelname}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${__kernelname}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${__kernelname}.preset"

  rm -f "${pkgdir}/"*.pkg.tar*
  rm -f "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for Linux kernel (tagged git version)"
  depends=('dkms' 'lld>=16' 'clang>=16')

  cd "${_srcname}"
  local builddir="$pkgdir/usr/lib/modules/${_kernver}/build"

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"
  mkdir -p "${pkgdir}/usr/lib/modules/build/"{include,arch/x86}

  export CFLAGS="$CFLAGS -Wno-strict-prototypes"

  # Fix for DKMS because clang doesn't like this
  # and to disable LTO
  for f in Makefile kernel/Makefile; do
    sed -i -re '/^.*[+]?= *(-Qunused-arguments|-mno-global-merge|-ftrivial-auto-var-init=pattern|-Wno-initializer-overrides|-Wno-gnu|-mretpoline.*|-ftrivial-auto-var-init=zero|-Wno-format-invalid-specifier|-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang|-flto(=[a-z]+)?)$/d' $f
    sed -i -re 's/-flto(=([a-z]+)?)//g' $f
  done
  echo -e "\nKBUILD_CFLAGS += -Wno-error -Wno-unused-variable -Wno-incompatible-pointer-types -Wno-strict-prototypes" >> Makefile
  echo -e "\nKBUILD_CFLAGS += -Wno-strict-prototypes" >> kernel/Makefile
  echo -e "\nCONFIG_LTO := n" >> Makefile
  echo -e "\nLD = ld.lld" >> Makefile
  sed -i -re 's/^(.*(_|[A-Z]+)LTO(_.*)?)=y/\1=n/g' .config
  echo "CONFIG_LTO_NONE=y" >> .config

  install -D -m644 Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

  for i in $(ls include/); do
    cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
  done

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

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

  rm -f "${pkgdir}/"*.pkg.tar*
}

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
