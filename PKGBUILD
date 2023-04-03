# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Alexander Epaneshnikov <alex19ep@archlinux.org>

_brotli_ver=1.0.9
_openssl_ver=1.1.1s
pkgbase=edk2
pkgname=(edk2-arm edk2-aarch64)
pkgver=202211
_commit=fff6d81270b57ee786ea18ad74f43149b9f03494  # refs/tags/edk2-stable202211
pkgrel=3
pkgdesc="Modern, feature-rich firmware development environment for the UEFI specifications"
arch=(any)
url="https://github.com/tianocore/edk2"
license=(BSD)
makedepends=(aarch64-linux-gnu-gcc arm-none-eabi-gcc acpica git iasl util-linux-libs nasm python)
options=(!makeflags)
source=(
  git+$url#tag=$_commit
  $pkgbase-softfloat::git+https://github.com/ucb-bar/berkeley-softfloat-3.git
  https://www.openssl.org/source/openssl-$_openssl_ver.tar.gz
  brotli-$_brotli_ver.tar.gz::https://github.com/google/brotli/archive/v$_brotli_ver.tar.gz
  60-edk2-aarch64.json
  60-edk2-arm.json
  Revert-ArmVirtPkg-make-EFI_LOADER_DATA-non-executabl.patch
  $pkgbase-202202-brotli.patch
)
sha512sums=('SKIP'
            'SKIP'
            '2ef983f166b5e1bf456ca37938e7e39d58d4cd85e9fc4b5174a05f5c37cc5ad89c3a9af97a6919bcaab128a8a92e4bdc8a045e5d9156d90768da8f73ac67c5b9'
            'b8e2df955e8796ac1f022eb4ebad29532cb7e3aa6a4b6aee91dbd2c7d637eee84d9a144d3e878895bb5e62800875c2c01c8f737a1261020c54feacf9f676b5f5'
            '126822ef6198e87fb38014a5ba21969c9a163b41df3cdef6825317971ecc8df4a63099113e687634b88648acc93f24917d729e1c44295d2df7012288740307d3'
            'bbf663d539a985504d5fbc95552a2a60ac860a6bce4a62ecc551292d838b41cba3b5203f580a76a05e9f862ef98e7a3e5da39505c1f39d8ef48c08778fac584a'
            '1dcd12f9c243f47f7cb72642175956a3bc3ef81cd5cd1335e06590549825e8699cf1caf868122d0bc686ff694670d936651825b57c3e36e79ee97358edf7147f'
            'd074c794796d17d77eed7c34201d93d7ef3f1322fe1ea4a2ddd7137fae884d49f94f465ee39cfd8346b026142668a41f5a8671e521409505dd6d002f71c0eebc')
b2sums=('SKIP'
        'SKIP'
        'ecd19eaf84dbc80448b51651abe52a89cc0052f024537959c4ebe61528988f235d661244fce6967159a876dd038c817bad19df742e828ca1cbae97ce6a4124bb'
        '8b9939d5224396ef33b43e019250ba4bc8949903583615e8dc02c85340fc0a1e2d1632161e00b0ee7355d77f05529ac772f482e05d2089afd71a0bf71e803904'
        'f84ff505702e4b2a38b6fd23fbb732c25d3102a04bb6918b0cc3b3d7528a92626324199cea4ed91955aade98f308f1d1037255f26cc9ee21ace75fc6376e7df6'
        '04a7eb373d6ea1415d7cd6e8dea0d16b75cbb1fb88572a30b8ce9960dd0404adc7f25fce2ccfb103eb09405411dc4d4e0084236e4c814916d81e957dc6aedfd4'
        '4aabdde26038eefe6c5c15150cc7c54e0d2aa1c8d145bf82de33ab7e28a95979c3323594bb95d8083ce3217c81f69c651fc9b80cec9336b290d3d466bc88b5da'
        '644c071dc4fbbccaa64b0b1babcad60395ffce1a7a317a6f5380eff44cbb886be5f29156a8e967ab02b508a33954fcf5602606b43362cc3bb1936a8cfc3a3c07')
_arch_list=(ARM AARCH64)
_build_type=RELEASE
_build_plugin=GCC5

prepare() {
  # patch to be able to use brotli 1.0.9
  patch -Np1 -d $pkgbase -i ../$pkgbase-202202-brotli.patch

  patch -Np1 -d $pkgbase -i ../Revert-ArmVirtPkg-make-EFI_LOADER_DATA-non-executabl.patch

  cd $pkgbase

  git submodule init
  git submodule deinit BaseTools/Source/C/BrotliCompress/brotli
  git submodule deinit CryptoPkg/Library/OpensslLib/openssl
  git submodule deinit MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
  git submodule deinit MdeModulePkg/Universal/RegularExpressionDxe/oniguruma
  git submodule deinit RedfishPkg/Library/JsonLib/jansson
  git submodule deinit UnitTestFrameworkPkg/Library/CmockaLib/cmocka
  git submodule deinit UnitTestFrameworkPkg/Library/GoogleTestLib/googletest
  git config submodule.SoftFloat "$srcdir/$pkgbase-softfloat"
  git -c protocol.file.allow=always submodule update

  # symlinking openssl into place
  rm -rfv CryptoPkg/Library/OpensslLib/openssl
  ln -sfv "$srcdir/openssl-$_openssl_ver" CryptoPkg/Library/OpensslLib/openssl

  # symlinking brotli into place
  rm -rfv BaseTools/Source/C/BrotliCompress/brotli MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
  ln -sfv "$srcdir/brotli-$_brotli_ver" BaseTools/Source/C/BrotliCompress/brotli
  ln -sfv "$srcdir/brotli-$_brotli_ver" MdeModulePkg/Library/BrotliCustomDecompressLib/brotli

  # -Werror, not even once
  sed -e 's/ -Werror//g' -i BaseTools/Conf/*.template BaseTools/Source/C/Makefiles/*.makefile
}

# TODO: check TPM_ENABLE/TPM2_ENABLE
build() {
  local _arch
  local _build_options=()
  # shared targets for all
  local _common_args=(
    -b "$_build_type"
    -n "$(nproc)"
    -t "$_build_plugin"
  )
  # shared targets for all EFI binaries
  local _efi_args=(
    -D NETWORK_IP6_ENABLE
    -D TPM_CONFIG_ENABLE
    -D TPM1_ENABLE
    -D TPM2_ENABLE
  )

  cd $pkgbase
  export GCC5_AARCH64_PREFIX="aarch64-linux-gnu-"
  export GCC5_ARM_PREFIX="arm-none-eabi-"
  echo "Building base tools (AARCH64)"
  ARCH=AARCH64 make -C BaseTools
  echo "Building base tools (ARM)"
  ARCH=ARM make -C BaseTools
  echo "Building base tools"
  make -C BaseTools
  . edksetup.sh

  for _arch in ${_arch_list[@]}; do
    # ovmf
    case "$_arch" in
      AARCH64)
      echo "Building ArmVirtPkg ($_arch) with secure boot"
      local _build_options=(
        -p ArmVirtPkg/ArmVirtQemu.dsc
        -a "$_arch"
        "${_common_args[@]}"
        "${_efi_args[@]}"
        -D NETWORK_HTTP_BOOT_ENABLE
        -D NETWORK_TLS_ENABLE
        -D SECURE_BOOT_ENABLE
      )
      BaseTools/BinWrappers/PosixLike/build "${_build_options[@]}"
      dd if=/dev/zero of=Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/QEMU_CODE.fd bs=1M count=64
      dd if=Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/QEMU_EFI.fd of=Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/QEMU_CODE.fd conv=notrunc
      dd if=/dev/zero of=Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/QEMU_VARS.fd bs=1M count=64
      ;;
      ARM)
      echo "Building ovmf (${_arch}) with secure boot"
      local _build_options=(
        -p ArmVirtPkg/ArmVirtQemu.dsc
        -a "${_arch}"
        "${_common_args[@]}"
        "${_efi_args[@]}"
        -D NETWORK_HTTP_BOOT_ENABLE
        -D NETWORK_TLS_ENABLE
        -D SECURE_BOOT_ENABLE
        -D TPM_ENABLE
        -D TPM_CONFIG_ENABLE
      )
      BaseTools/BinWrappers/PosixLike/build "${_build_options[@]}"
      dd if=/dev/zero of=Build/ArmVirtQemu-$_arch/${_build_type}_$_build_plugin/FV/QEMU_CODE.fd bs=1M count=64
      dd if=Build/ArmVirtQemu-$_arch/${_build_type}_$_build_plugin/FV/QEMU_EFI.fd of=Build/ArmVirtQemu-$_arch/${_build_type}_$_build_plugin/FV/QEMU_CODE.fd conv=notrunc
      dd if=/dev/zero of=Build/ArmVirtQemu-$_arch/${_build_type}_$_build_plugin/FV/QEMU_VARS.fd bs=1M count=64
      ;;
    esac
  done
}

package_edk2-aarch64() {
  local _arch=AARCH64

  pkgdesc="Firmware for Virtual Machines (aarch64)"
  url="https://github.com/tianocore/tianocore.github.io/wiki/ArmVirtPkg"
  conflicts=('edk2-armvirt<202211')
  provides=(edk2-armvirt)
  replaces=('edk2-armvirt<202211')

  cd $pkgbase
  install -vDm 644 Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/*.fd -t "$pkgdir/usr/share/$pkgbase/${_arch,,}/"
  # add libvirt compatibility (which hardcodes the following paths)
  install -vdm 755 "$pkgdir/usr/share/AAVMF"
  ln -svf /usr/share/$pkgbase/${_arch,,}/QEMU_CODE.fd "$pkgdir/usr/share/AAVMF/AAVMF_CODE.fd"
  ln -svf /usr/share/$pkgbase/${_arch,,}/QEMU_VARS.fd "$pkgdir/usr/share/AAVMF/AAVMF_VARS.fd"
  # install qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  install -vDm 644 ../*$pkgname.json -t "$pkgdir/usr/share/qemu/firmware/"
  # license
  install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # add symlink for previous aarch64 location
  ln -svf /usr/share/$pkgbase "$pkgdir/usr/share/$pkgbase-armvirt"
}

package_edk2-arm() {
  local _arch=ARM

  pkgdesc="Firmware for Virtual Machines (armv7)"
  url="https://github.com/tianocore/tianocore.github.io/wiki/ArmVirtPkg"

  cd $pkgbase
  install -vDm 644 Build/ArmVirtQemu-$_arch/${_build_type}_$_build_plugin/FV/*.fd -t "$pkgdir/usr/share/$pkgbase/${_arch,,}/"
  # add libvirt compatibility (which hardcodes the following paths)
  install -vdm 755 "$pkgdir/usr/share/AAVMF"
  ln -svf /usr/share/$pkgbase/${_arch,,}/QEMU_CODE.fd "$pkgdir/usr/share/AAVMF/AAVMF32_CODE.fd"
  ln -svf /usr/share/$pkgbase/${_arch,,}/QEMU_VARS.fd "$pkgdir/usr/share/AAVMF/AAVMF32_VARS.fd"

  # install qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  install -vDm 644 ../*$pkgname.json -t "$pkgdir/usr/share/qemu/firmware/"
  # license
  install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
