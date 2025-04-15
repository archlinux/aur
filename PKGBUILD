# based on https://gitlab.archlinux.org/archlinux/packaging/packages/linux-zen/-/raw/main/PKGBUILD

# Maintainer: nuvole <mitltlatltl@gmail.com>
# EOL: Apr, 2025 (Unlikely to continue maintenance, you cna adopt it if necessary)

_variant=gaokun3
pkgbase=linux-$_variant
pkgver=6.14.y
pkgrel=3
pkgdesc='Linux for HUAWEI MateBook E Go (sc8280xp)'
url='https://github.com/steev/linux.git'
arch=('any')
license=('GPL-2.0-only')
makedepends=(
  bc
  cpio
  curl
  gettext
  git
  libelf
  pahole
  perl
  python
  tar
  xz
)
options=(
  !debug
  !strip
)

_srcname=linux

# Apr, 2025
# Since 6.14, dsi_related_rebase_required/*patch can't be applied anymore,
# I will not fix them anymore, it is EOL for me. but don't worry, these
# patches are not necessary to enable any notable features, check it only
# when you are planning to bring up internal panel.
_patch_list=(
0001-Revert-clk-qcom-Park-shared-RCGs-upon-registration.patch
0013-arm64-dts-qcom-sc8280xp-add-MDSS-registers-interconn.patch
0014-arm64-dts-qcom-add-the-slpi-node-for-sc8280xp.patch
)

_patch_list_sha256sums=(
798a05ea08755422a85a75d0eb88de268af4ad76589f9f17232911eb791573c5
d6e473571cd9fd214e5c177efc6820015225faf46f3567763f2f69c0af2abd08
cb6dd640354a85149190a05b9404c0869114a6873fcf9f5869a64e0dadc76085
)

source=(
  config
  linux-gaokun3.preset
  mkinitcpio-gaokun3.conf
  sc8280xp-huawei-gaokun3.dts
  sc8280xp-huawei-gaokun3-camera.dtsi
  update-grub
)
sha256sums=(
  'f6ebfccba580ed254fb0441ef035f3a2a8d0ca835cf94cdbf038208c417acb32'
  '53b52ebe0de167308134725740651371f90b34a290cbe7dc1727adf2a1fcb62d'
  '739469d0083cd08f685870f5ae832546243cb97d0843b70b76867485e6502a9f'
  'afef7e0d1e355ca6a7c403d53611d1f9b3db2ea5eac000e45c1c47613c3e8872'
  'daffd3bdd3de87d454954eaa471ff8bcfa321e50cdb82a4452226b17c698ebf2'
  '3bb0d75940d7ff605f412608bc4d83c08938d0c52c705ed2bc5b265f084bea29'
)

source+=("${_patch_list[@]}")
sha256sums+=("${_patch_list_sha256sums[@]}")

case "$CARCH" in
  'x86_64')
    build_flag="ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc)"
    makedepends+=(aarch64-linux-gnu-gcc)
    STRIP=aarch64-linux-gnu-strip
    ;;
  'aarch64')
    build_flag="-j$(nproc)"
    STRIP=strip
    ;;
esac

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=nuvole
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  git clone --depth=1 $url -b lenovo-x13s-linux-$pkgver
  cd $_srcname
  git apply $srcdir/00*patch # Not using git am to avoid setting git identity
  rm -rf .git # to avoid getting our kernel name polluted with the hash tag or dirty or +
  cp $srcdir/sc8280xp-huawei-gaokun3*.dts* arch/arm64/boot/dts/qcom/

  # when we repeat build something
  rm scripts/kconfig/conf scripts/mod/modpost scripts/mod/mk_elfconfig \
     scripts/dtc/dtc scripts/dtc/fdtoverlay scripts/basic/fixdep \
     scripts/asn1_compiler scripts/kallsyms scripts/sorttable \
     scripts/kconfig/mconf || :

  echo "Setting config..."
  cp $srcdir/config .config
  make $build_flag olddefconfig
  diff -u $srcdir/config .config || :

  make $build_flag -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make $build_flag all
#   make $build_flag -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
#   make htmldocs
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'linux-firmware: firmware images needed for some devices'
    'linux-firmware-gaokun3: Firmware files for HUAWEI MateBook E Go (sc8280xp)'
    'linux-firmware-qcom: Firmware files for Qualcomm SoCs'
    'wireless-regdb: to set the correct wireless channels of your country'
  )
  provides=(
    KSMBD-MODULE
    UKSMD-BUILTIN
    VHBA-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )
  replaces=(
  )

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make $build_flag -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 make $build_flag INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build link
  rm "$modulesdir"/build

  # devicetree & files
  install -Dm644 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb -T "$pkgdir/boot/sc8280xp-huawei-$_variant.dtb"

  # _variant allow you to repeat the package as another name (for test purpose when you have already installed the kernel)
  sed -i "s/#VARIANT#/$_variant/g" "$srcdir/linux-gaokun3.preset" "$srcdir/update-grub"
  install -Dm644 "${srcdir}/mkinitcpio-gaokun3.conf" -T "$pkgdir/etc/mkinitcpio-$_variant.conf"
  install -Dm644 "${srcdir}/linux-gaokun3.preset" -T "$pkgdir/etc/mkinitcpio.d/linux-$_variant.preset"
  install -Dm744 "${srcdir}/update-grub" -t "$pkgdir/usr/bin/"
}

_cross_compile_tools() {
  if [[ "$CARCH" != 'x86_64' ]]; then
    echo 'No need to cross compile tools'
    return
  fi

  # generate from make XXXXXX V=1
  cd "$srcdir/$_srcname"

  # fixdep
  aarch64-linux-gnu-gcc -o scripts/basic/fixdep scripts/basic/fixdep.c -I scripts/include -O2

  # mk_elfconfig, modpost
  aarch64-linux-gnu-gcc -o scripts/mod/mk_elfconfig scripts/mod/mk_elfconfig.c -O2
  aarch64-linux-gnu-gcc -o scripts/mod/modpost scripts/mod/modpost.c scripts/mod/file2alias.c scripts/mod/sumversion.c scripts/mod/symsearch.c -I scripts/include -O2

  # conf
  aarch64-linux-gnu-gcc -o scripts/kconfig/conf scripts/kconfig/conf.c scripts/kconfig/confdata.c scripts/kconfig/expr.c scripts/kconfig/lexer.lex.c scripts/kconfig/menu.c scripts/kconfig/parser.tab.c scripts/kconfig/preprocess.c scripts/kconfig/symbol.c scripts/kconfig/util.c -I scripts/include -O2

  # fdtoverlay, dtc
  aarch64-linux-gnu-gcc -o scripts/dtc/fdtoverlay scripts/dtc/libfdt/fdt.c scripts/dtc/libfdt/fdt_ro.c scripts/dtc/libfdt/fdt_wip.c scripts/dtc/libfdt/fdt_sw.c scripts/dtc/libfdt/fdt_rw.c scripts/dtc/libfdt/fdt_strerror.c scripts/dtc/libfdt/fdt_empty_tree.c scripts/dtc/libfdt/fdt_addresses.c scripts/dtc/libfdt/fdt_overlay.c scripts/dtc/fdtoverlay.c scripts/dtc/util.c -I scripts/include -I scripts/dtc/libfdt -DNO_YAML -O2
  aarch64-linux-gnu-gcc -o scripts/dtc/dtc scripts/dtc/dtc.c scripts/dtc/flattree.c scripts/dtc/fstree.c scripts/dtc/data.c scripts/dtc/livetree.c scripts/dtc/treesource.c scripts/dtc/srcpos.c scripts/dtc/checks.c scripts/dtc/util.c scripts/dtc/dtc-lexer.lex.c scripts/dtc/dtc-parser.tab.c -I scripts/include -I scripts/dtc/libfdt -DNO_YAML -O2

  # asn1_compiler, kallsyms, sorttable
  aarch64-linux-gnu-gcc -o scripts/kallsyms scripts/kallsyms.c  -I scripts/include -O2
  aarch64-linux-gnu-gcc -o scripts/sorttable scripts/sorttable.c -I tools/include/ -O2
  aarch64-linux-gnu-gcc -o scripts/asn1_compiler scripts/asn1_compiler.c -I include -O2
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=(pahole)

  _cross_compile_tools # fix headers when building with x86_64, it may be buggy

  cd "$srcdir/$_srcname"
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map version vmlinux #tools/bpf/bpftool/vmlinux.h
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/arm64" -m644 arch/arm64/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
#   install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
#   install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/arm64" -a arch/arm64/include
  install -Dt "$builddir/arch/arm64/kernel" -m644 arch/arm64/kernel/asm-offsets.s
  mkdir -p "$builddir/arch/arm"
  cp -t "$builddir/arch/arm" -a arch/arm/include

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
    [[ $arch = */arm64/ || $arch == */arm/ ]] && continue
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
        $STRIP -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        $STRIP -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        $STRIP -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        $STRIP -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Stripping vmlinux..."
  $STRIP -v $STRIP_STATIC "$builddir/vmlinux"

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

# vim:set ts=8 sts=2 sw=2 et:
