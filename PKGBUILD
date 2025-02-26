# based on https://gitlab.archlinux.org/archlinux/packaging/packages/linux-zen/-/raw/main/PKGBUILD

# Maintainer: nuvole <mitltlatltl@gmail.com>

_variant=gaokun3
pkgbase=linux-$_variant
# TODO: 6.12.y is a branch version, try to fetch from 6.12 to 6.20
# to get the latest branch, then fetch kernel version from Makefile
pkgver=6.13.y
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

_patch_list=(
0001-Revert-clk-qcom-Park-shared-RCGs-upon-registration.patch
0002-drm-msm-dsi-change-sync-mode-to-sync-on-DSI0-rather-.patch
0003-drm-msm-dpu1-improve-support-for-active-CTLs.patch
0004-drm-msm-dpu1-use-one-active-CTL-if-it-is-available.patch
0005-drm-msm-dpu-populate-has_active_ctls-in-the-catalog.patch
0006-drm-msm-dpu1-dpu_encoder_phys_-proper-support-for-ac.patch
0007-drm-msm-dpu-Drop-BIT-DPU_CTL_SPLIT_DISPLAY-from-acti.patch
0008-drm-msm-dpu-uncap-intf-num-limit.patch
0009-drm-msm-dsi-Add-support-for-DSI-2.5.1.patch
0010-drm-msm-dsi-add-support-for-DSI-PHY-on-SC8280XP.patch
0011-arm64-dts-qcom-sx8280xp-Add-dsi-node-for-SC8280XP.patch
0012-arm64-dts-qcom-sx8280xp-add-refgen-regulator.patch
0013-arm64-dts-qcom-sc8280xp-add-MDSS-registers-interconn.patch
0014-arm64-dts-qcom-add-the-slpi-node-for-sc8280xp.patch
0015-firmware-qcom-uefisecapp-add-Huawei-Matebook-E-GO.patch
0016-arm64-dts-qcom-Add-support-for-Huawei-Matebook-E-Go-.patch
)

_patch_list_sha256sums=(
798a05ea08755422a85a75d0eb88de268af4ad76589f9f17232911eb791573c5
93df8188996451e8a14ff1f38cf18e28b71e9c70549e27b54f93e9321072b108
0b6e50ba23dd4f9f7d159e56ef92fd65d8490e351387f880f384e995eebe4691
31be29393e04ef80a7ddeb6395f00402c90e446265b2b81ea010b7869337dd5d
694ae27d0348f6562d592d2481e5f81828e11bc723c1dd53cc09b622595d67cb
1c210b6ef50fc20c9f76cd5de2a7dc9e3b301dc0aab637ff6cf408da117cbe92
32ad4d7c9084cc11604621879b07a1c7b3f5da09aa854c7e6f7f4e66ae3ab512
120305412f40b66fa06b7a883f5d73531bedb82f751e43365af2d2743d2540f7
f2ca6e74cf1c9ed65eb68ae7c0e242c4e4277d118be465ad5f2ee7a9d74e6924
a78055b07fed6bb53ec8c2a6ca5f54f4adc60afa0d623d2a9e2377e531bf3926
4e07c5b271c5d4948137839440a380e5d7123f330167070ffb89603e3accff64
188245e8115f0e79bc6b65c66c833229c0976f7bedbbe70e04debc97d2797cd6
d6e473571cd9fd214e5c177efc6820015225faf46f3567763f2f69c0af2abd08
cb6dd640354a85149190a05b9404c0869114a6873fcf9f5869a64e0dadc76085
2d5ac92500450c884bc94b6f54d64269c21dc924464b48c1be154de73bb3320e
3a522391fd53f545deb4e56af872dfe0709629ccdf23d8f787d8d670a924be37
)

source=(
  config # dirty, need clean
  linux-gaokun3.preset
  mkinitcpio-gaokun3.conf
  sc8280xp-huawei-gaokun3.dts
  update-grub
)
sha256sums=(
  '2d165a723cdc8d8cbfea185a346bd82b1a20371485ba166943de198f3968ee5e'
  '53b52ebe0de167308134725740651371f90b34a290cbe7dc1727adf2a1fcb62d'
  '8c2bea7956eabbdd296dd5a8345007048d2a71f586927fba9ec6b07c31e6e6a3'
  '754cae9bb18ff65b18eb868c1112b8486a621e05775a44ec6f7ef0b5835a5bae'
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
  rm -rf .git # or our kernel name with the hash tag
  cp $srcdir/sc8280xp-huawei-gaokun3.dts arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts

  echo "Setting version..."
  echo "${pkgbase#linux}" > localversion.10-pkgname
  echo "-$pkgrel" > localversion.20-pkgrel

  # when we repeat build something
  rm scripts/kconfig/conf scripts/mod/modpost scripts/mod/mk_elfconfig \
     scripts/dtc/dtc scripts/dtc/fdtoverlay scripts/basic/fixdep \
     scripts/asn1_compiler scripts/kallsyms scripts/sorttable || :

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
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map localversion.* version vmlinux #tools/bpf/bpftool/vmlinux.h
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
