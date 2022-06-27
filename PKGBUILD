# Maintainer: robertfoster

_brotli_ver=1.0.9
_openssl_ver=1.1.1p
pkgname=edk2-arm
pkgver=202205
pkgrel=1
pkgdesc="Modern, feature-rich firmware development environment for the UEFI specifications (ARM v7)"
arch=(any)
url="https://github.com/tianocore/edk2"
license=(BSD)
makedepends=(arm-none-eabi-gcc acpica git iasl util-linux-libs nasm python seabios)
options=(!makeflags)
source=(
  "edk2-$pkgver.tar.gz::https://github.com/tianocore/edk2/archive/edk2-stable${pkgver}.tar.gz"
  "https://www.openssl.org/source/openssl-${_openssl_ver}.tar.gz"
  "brotli-${_brotli_ver}.tar.gz::https://github.com/google/brotli/archive/v${_brotli_ver}.tar.gz"
  "http://www.jhauser.us/arithmetic/SoftFloat-3e.zip"
  "edk2-202202-brotli.patch"
  "60-edk2-armvirt-arm.json"
)

_arch_list=(ARM)
_build_type=RELEASE
_build_plugin=GCC5

prepare() {
  mv -v "edk2-edk2-stable$pkgver" "edk2-$pkgver"
  cd "edk2-$pkgver"

  # patch to be able to use brotli 1.0.9
  patch -Np1 -i "../edk2-202202-brotli.patch"

  # symlinking openssl into place
  rm -rfv CryptoPkg/Library/OpensslLib/openssl
  ln -sfv "${srcdir}/openssl-$_openssl_ver" CryptoPkg/Library/OpensslLib/openssl

  # symlinking brotli into place
  rm -rfv BaseTools/Source/C/BrotliCompress/brotli MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
  ln -sfv "${srcdir}/brotli-${_brotli_ver}" BaseTools/Source/C/BrotliCompress/brotli
  ln -sfv "${srcdir}/brotli-${_brotli_ver}" MdeModulePkg/Library/BrotliCustomDecompressLib/brotli

#  cp -r "${srcdir}"/SoftFloat-3e/* \
#    ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3/

  # -Werror, not even once
  sed -e 's/ -Werror//g' \
    -i BaseTools/Conf/*.template BaseTools/Source/C/Makefiles/*.makefile

  # copy seabios's CSM binary into place, so that it can be included in the binaries:
  cp -v /usr/share/qemu/bios-csm.bin OvmfPkg/Csm/Csm16/Csm16.bin
}

# TODO: check TPM_ENABLE/TPM2_ENABLE
build() {
  cd "edk2-$pkgver"
  export GCC5_ARM_PREFIX="arm-none-eabi-"
  local _arch
  echo "Building base tools (ARM)"
  ARCH=ARM make -C BaseTools
  echo "Building base tools"
  make -C BaseTools
  . edksetup.sh
  for _arch in ${_arch_list[@]}; do
    # shell
    echo "Building shell (${_arch})."
    BaseTools/BinWrappers/PosixLike/build -p ShellPkg/ShellPkg.dsc \
      -a "${_arch}" \
      -b "${_build_type}" \
      -n "$(nproc)" \
      -t "${_build_plugin}"
    # ovmf
    if [[ "${_arch}" == 'ARM' ]]; then
      echo "Building ovmf (${_arch}) with secure boot"
      BaseTools/BinWrappers/PosixLike/build -p "ArmVirtPkg/ArmVirtQemu.dsc" \
        -a "${_arch}" \
        -b "${_build_type}" \
        -n "$(nproc)" \
        -t "${_build_plugin}" \
        -D NETWORK_IP6_ENABLE \
        -D NETWORK_HTTP_BOOT_ENABLE \
        -D NETWORK_TLS_ENABLE \
        -D SECURE_BOOT_ENABLE \
        -D TPM_ENABLE \
        -D TPM_CONFIG_ENABLE
      dd if="/dev/zero" \
        of="Build/ArmVirtQemu-${_arch}/${_build_type}_${_build_plugin}/FV/QEMU_CODE.fd" \
        bs=1M count=64
      dd if="Build/ArmVirtQemu-${_arch}/${_build_type}_${_build_plugin}/FV/QEMU_EFI.fd" \
        of="Build/ArmVirtQemu-${_arch}/${_build_type}_${_build_plugin}/FV/QEMU_CODE.fd" \
        conv=notrunc
      dd if="/dev/zero" \
        of="Build/ArmVirtQemu-${_arch}/${_build_type}_${_build_plugin}/FV/QEMU_VARS.fd" \
        bs=1M count=64
    fi
  done
}

package() {
  pkgdesc="Firmware for Virtual Machines (armv7)"
  url="https://github.com/tianocore/tianocore.github.io/wiki/ArmVirtPkg"
  local _arch=ARM

  cd "edk2-$pkgver"
  install -vDm 644 "Build/ArmVirtQemu-${_arch}/${_build_type}_${_build_plugin}/FV/"*.fd \
    -t "${pkgdir}/usr/share/edk2-armvirt/${_arch,,}/"

  # install qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  install -vDm 644 ../*"${pkgname}"*.json -t "${pkgdir}/usr/share/qemu/firmware"
  # license
  install -vDm 644 License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
sha256sums=('e6cf93bae78b30a10732b8afb5cc438735dc9ec976ae65d12dab041c18bb7987'
            'bf61b62aaa66c7c7639942a94de4c9ae8280c08f17d4eac2e44644d9fc8ace6f'
            'f9e8d81d0405ba66d181529af42a3354f838c939095ff99930da6aa9cdf6fe46'
            '21130ce885d35c1fe73fc1e1bf2244178167e05c6747cad5f450cc991714c746'
            '0a30739348fe448c9289625fcf80d6e5705a6ada0f3dd43cf42e52a31bbfa0ec'
            '40560e812e9fc56b1cf255abe938812c97aa8475e85e2388da0d4217e30af4b9')
