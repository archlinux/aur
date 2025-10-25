# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: Dragonn <dragonn@op.pl>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-g14
pkgver=6.17.5.arch1
pkgrel=1
pkgdesc='Linux-g14'
url="https://gitlab.com/dragonn/linux-g14.git"
_url='https://github.com/archlinux/linux'
arch=(x86_64 x86_64_v3)
license=(GPL-2.0-only)
makedepends=(
  bc
  cpio
  gettext
  git
  libelf
  pahole
  perl
  python
  rust
  rust-bindgen
  rust-src
  tar
  xz
  #  modprobed-db
)
options=('!strip' '!debug')
_srcname=linux-${pkgver%.*}
_srctag=v${pkgver%.*}-${pkgver##*.}
source=(
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/$_srcname.tar.{xz,sign}
  $_url/releases/download/$_srctag/linux-$_srctag.patch.zst{,.sig}
  config         # the main kernel config file
  
  # patches to config & for tuning purposes
  #  modprobed.db
  choose-gcc-optimization.sh
  more-uarches-for-kernel-6.16+.patch::"https://raw.githubusercontent.com/graysky2/kernel_compiler_patch/refs/heads/master/lite-more-x86-64-ISA-levels-for-kernel-6.16%2B.patch"

  # actual kernel patch series
  # 0000-asus-patch-series.patch::"https://gitlab.com/asus-linux/fedora-kernel/-/raw/rog-6.14/asus-patch-series.patch"
  0000-asus-patch-series.patch::"https://raw.githubusercontent.com/CachyOS/kernel-patches/refs/heads/master/6.17/0001-asus.patch"
  # asus-patch-series.patch
  0001-acpi-proc-idle-skip-dummy-wait.patch
  0004-ACPI-resource-Skip-IRQ-override-on-ASUS-TUF-Gaming-A.patch
  0005-ACPI-resource-Skip-IRQ-override-on-ASUS-TUF-Gaming-A.patch
  0007-workaround_hardware_decoding_amdgpu.patch
  0009-asus-nb-wmi-Add-tablet_mode_sw-lid-flip.patch
  0010-asus-nb-wmi-fix-tablet_mode_sw_int.patch
  0011-amdgpu-adjust_plane_init_off_by_one.patch
)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
  83BC8889351B5DEBBB68416EB8AC08600F108CDF  # Jan Alexander Steffens (heftig)
)

sha256sums=('c05faf36e9c2164be723cf6ada8533788804d48f9dd2fe1be2ccee3616a92bce'
            'SKIP'
            '4d32082c82c9bfd85ff2840ad59a7c073450577be272a3235e1523c45f9d6548'
            'SKIP'
            'e8ca1849fc8c1ebea39d81b4307455c0eb4585aaed606da0c87c023f9807ff6e'
            '278118011d7a2eeca9971ac97b31bf0c55ab55e99c662ab9ae4717b55819c9a2'
            '11e570d8a355c2c6ccd413b7ecea9ae1f9b9801eb9a16249f8c4c5e6c80a1ead'
            '2b9d31f0fb79dee44171a01bbb8aa505487cf3a96c14738ae6bb717f54a35714'
            '0a7ea482fe20c403788d290826cec42fe395e5a6eab07b88845f8b9a9829998d'
            '4912b1319e46ddd6670147f5e878b4aca8bcfbd7b5c852fe11e434e424666365'
            'a00b952d53df9d3617d93e8fba4146a4d6169ebe79f029b3a55cca68f738d8ea'
            'e41198b29cee4de7a5132d8df606f48c2d0f9c9076fe4230b00a33c7e0b22c71'
            '15e912a66e4bbce1cf0450f1dc6610653df29df8dd6d5426f9c1b039490436c8'
            '444f2d86de8c2177655b01596f939f99c2e7abfa8efad8a509e0a334f42dfa85'
            'e90bb17f74c5b232001de5558ff96e09612f35a8552e1fa506c8a3451b0516b7')

# notable microarch levels:
#
# 14, Zen2 = CONFIG_MZEN2
# 15, Zen3 = CONFIG_MZEN3
# 38, Skylake (Comet Lake laptops) = CONFIG_MSKYLAKE
# 93, x86-64-v3 (package default) = CONFIG_GENERIC_CPU3
# 98, Intel Native = CONFIG_MNATIVE_INTEL
# 99, AMD Native = CONFIG_MNATIVE_AMD
#if [ -z ${_microarchitecture+x} ]; then
#  _microarchitecture=93
#fi
#if [ -z ${Microarchitecture+x} ]; then
#  Microarchitecture='CONFIG_GENERIC_CPU3'
#fi

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
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # if throw is defined we had a hard patch failure, propagate it and stop so we can address
  [[ -z "$_throw" ]]

  echo "Setting config..."
  cp ../config .config
  make olddefconfig
  diff -u ../config .config || :
  
  ## Make use of modprobed-db, if installed
  ## To do this, you need to copy the database into this directory and enable the relevant lines 
  ## at the top of this file!
  # make LSMOD=../modprobed.db localmodconfig 

  ## choose microarchitecture optimization in GCC here
  ## this needs to run *after* `make olddefconfig` so that our newly added configuration macros exist
  scripts/config  -d CONFIG_GENERIC_CPU \
                  -d CONFIG_GENERIC_CPU2 \
                  -e CONFIG_MNATIVE_AMD
 
  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
  
  ## Here comes a section where you can uncomment additional modules that you do not need on your machine
  ## in order to speed up building the kernel
  
  ## Enable this, if your systems is ALL AMD
  # scripts/config --disable CONFIG_DRM_I915 \
  #                --disable CONFIG_DRM_GMA500 \
  #                --disable CONFIG_PINCTRL_INTEL \
  #                --disable CONFIG_AGP_INTEL \
  #                --disable CONFIG_INTEL_GTT \
  #                --disable CONFIG_SND_INTEL_NHLT \
  #                --disable CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL \
  #                --disable CONFIG_SND_SOC_INTEL_SST_TOPLEVEL \
  #                --disable CONFIG_SND_SOC_INTEL_MACH \
  #                --disable CONFIG_INTEL_WMI \
  #                --disable CONFIG_INTEL_IOMMU

  # Disable NUMA (from CachyOS)
  scripts/config  -d NUMA \
                  -d AMD_NUMA \
                  -d X86_64_ACPI_NUMA \
                  -d NODES_SPAN_OTHER_NODES \
                  -d NUMA_EMU \
                  -d USE_PERCPU_NUMA_NODE_ID \
                  -d ACPI_NUMA \
                  -d ARCH_SUPPORTS_NUMA_BALANCING \
                  -d NODES_SHIFT \
                  -u NODES_SHIFT \
                  -d NEED_MULTIPLE_NODES \
                  -d NUMA_BALANCING \
                  -d NUMA_BALANCING_DEFAULT_ENABLED

  
  # Stuff from Fedora
  scripts/config --enable CONFIG_ASUS_WMI_DEPRECATED_ATTRS \
                 --enable CONFIG_ASUS_ARMOURY \
                 --enable CONFIG_ASUS_WMI_BIOS \
                 --module CONFIG_HID_ASUS_ALLY \
                 --enable CONFIG_CRYPTO_LZ4 \
                 --enable CONFIG_CRYPTO_LZO \
                 --enable CONFIG_DRM_PRIVACY_SCREEN

  scripts/config --enable CONFIG_PINCTRL_AMD
  scripts/config --enable CONFIG_X86_AMD_PSTATE
  scripts/config --module CONFIG_AMD_PMC

  scripts/config --disable CONFIG_MODULE_COMPRESS_NONE \
                 --enable CONFIG_MODULE_COMPRESS_ZSTD

  ## SET default LRU parameters
  scripts/config --enable CONFIG_LRU_GEN
  scripts/config --enable CONFIG_LRU_GEN_ENABLED
  scripts/config --disable CONFIG_LRU_GEN_STATS
  scripts/config --set-val CONFIG_NR_LRU_GENS 7
  scripts/config --set-val CONFIG_TIERS_PER_GEN 4

  # DISABLE not need modules on ROG laptops
  # XXX: I'm going to make an opinionated decision here and save everyone some compilation time
  # XXX: on drivers almost no-one is going to use; if you need any of theese turn them on in myconfig
  scripts/config  --disable CONFIG_INFINIBAND \
                  --disable CONFIG_DRM_NOUVEAU \
                  --disable CONFIG_DRM_RADEON \
                  --disable CONFIG_IIO \
                  --disable CONFIG_CAN_DEV \
                  --disable CONFIG_PCMCIA_WL3501 \
                  --disable CONFIG_PCMCIA_RAYCS \
                  --disable CONFIG_IWL3945 \
                  --disable CONFIG_IWL4965 \
                  --disable CONFIG_IPW2200 \
                  --disable CONFIG_IPW2100 \
                  --disable CONFIG_FB_NVIDIA \
                  --disable CONFIG_SENSORS_ASUS_EC \
                  --disable CONFIG_SENSORS_ASUS_WMI_EC

  # select slightly more sane block device driver options; NVMe really should be built in 
  scripts/config  --disable CONFIG_RAPIDIO \
                  --module CONFIG_CDROM \
                  --disable CONFIG_PARIDE \

  # enable back EFI_HANDOVER_PROTOCOL and EFI_STUB
  scripts/config  --enable CONFIG_EFI_HANDOVER_PROTOCOL \
                  --enable CONFIG_EFI_STUB

  # try to fix stuttering on some ROG laptops
  scripts/config --disable CONFIG_HW_RANDOM_TPM
}

build() {
  cd $_srcname
  make all
  make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
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
    'scx-scheds: to use sched-ext schedulers'
    'wireless-regdb: to set the correct wireless channels of your country'
  )
  provides=(
    KSMBD-MODULE
    NTSYNC-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )
  replaces=(
    virtualbox-guest-modules-arch
    wireguard-arch
  )

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
  echo "#!/bin/bash" > ignore_depmod
  chmod +x ignore_depmod
  echo "Installing modules..."
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=./ignore_depmod modules_install  # Suppress depmod

  # remove build link
  rm "$modulesdir"/build || true
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  provides=(linux-rog-headers)
  depends=(pahole)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux tools/bpf/bpftool/vmlinux.h
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts
  ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

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

  echo "Installing Rust files..."
  install -Dt "$builddir/rust" -m644 rust/*.rmeta
  install -Dt "$builddir/rust" rust/*.so
  
  echo "Installing unstripped VDSO..."
  make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install \
    link=  # Suppress build-id symlinks

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


pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
