# Maintainer: Mark King <mark.king@markzz.com>

_brotli_ver=1.1.0
_openssl_ver=3.5.0
pkgbase=edk2-git
pkgname=(edk2-armvirt-git edk2-shell-git edk2-ovmf-git)
pkgver=r34315.93aeaa0812
pkgrel=1
pkgdesc="Modern, feature-rich firmware development environment for the UEFI specifications"
arch=(any)
url="https://github.com/tianocore/edk2"
license=(BSD)
makedepends=(aarch64-linux-gnu-gcc acpica git iasl util-linux-libs nasm python seabios)
options=(!makeflags)
source=(
  "edk2::git+https://github.com/tianocore/edk2#branch=master"
	"public-mipi-sys-t::git+https://github.com/MIPI-Alliance/public-mipi-sys-t#branch=main"
	"libfdt::git+https://github.com/devicetree-org/pylibfdt.git#branch=main"
	"libspdm::git+https://github.com/DMTF/libspdm.git#branch=main"
	"mbedtls::git+https://github.com/ARMmbed/mbedtls.git#branch=development"
  "https://www.openssl.org/source/openssl-${_openssl_ver}.tar.gz"{,.asc}
  "brotli-${_brotli_ver}.tar.gz::https://github.com/google/brotli/archive/v${_brotli_ver}.tar.gz"
  "50-edk2-ovmf-git-i386-secure.json"
  "50-edk2-ovmf-git-x86_64-secure.json"
  "60-edk2-ovmf-git-i386.json"
  "60-edk2-ovmf-git-x86_64.json"
  "60-edk2-armvirt-git-aarch64.json"
  "70-edk2-ovmf-git-i386-csm.json"
  "70-edk2-ovmf-git-x86_64-csm.json"
  "80-edk2-ovmf-git-ia32-on-x86_64-secure.json"
  "81-edk2-ovmf-git-ia32-on-x86_64.json"
  "82-edk2-ovmf-git-ia32-on-x86_64-csm.json"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '39cc80e2843a2ee30f3f5de25cd9d0f759ad8de71b0b39f5a679afaaa74f4eb58d285ae50e29e4a27b139b49343ac91d1f05478f96fb0c6b150f16d7b634676f'
            'SKIP'
            '6eb280d10d8e1b43d22d00fa535435923c22ce8448709419d676ff47d4a644102ea04f488fc65a179c6c09fee12380992e9335bad8dfebd5d1f20908d10849d9'
            '603cae145a87bae371bd069d05128beebddb7048e78b93650b19c44b86b2d27cabbcf3bc4c0b2384b862f32383ce7a914a10fc0ad564632bcadd6e4f9389fede'
            '3e10bdc9ad13aadbd4111230fb8f37d5f16306aeb7bce2af5ec31c1e2b5adea26d5875cd0d7070ea82eca7546ecbacc8c195ed68425428bf6d2533b58e307b2d'
            '56d0bffd6dd7be79709f66bcfba2112e8ef6208de9b5018e90251e3ba68b37f9d911f0bd5a03987b49bb19bd0d62f7fa9ac3ca9f234e80ada3c4dbdd619705b9'
            '04b4c86f5afeab6170ad1b7b9937fa775a920c78719a33b213f7f8924e4e905709335307c38b8d5d9c127dd8c7000ddbe740b77f1ddfb68035819b7b4cf2b1e4'
            '6d2799171058b45ff4205441ad222893ebe2fce5c5c71c9c52c97efc95e4cad65d66d390b6a554ce7a2ce505ceba7431d18f79f2c2c1101addccee55141d4a66'
            '4ee69302de1cec37e4bf4c6a5525d887392f8f733ae8a95a54021f6531741e95baef31da1538b45667a1b198cbbab3069678169069f9ba8db641d603ebb3735b'
            '77e23f0c116ae5a087553edb2754df172b2c4fe5bc346356abe0e1f2acfb41a346d06d87b0569102ca4ac9356e189198c0c74476cb35f1b62773a956cb6a1e04'
            '8e5eb4e24fad4644a66eb52c95a90a82f01df0af6e57208ad61cb0859dd4425e623e75d93846e8fc3235370a88d93a1d27a512dc4e559bedfe3249404797838b'
            '7c9f8e7ce7451e7aa852998ffcd3ca95c08083c313dc8dcf0877969ef23d9da6f69c60bb1e652387a223da6e690524fa094bfbaed14d8bdae2853e68530b2f82'
            '891d3ea36d966114ff1f79c3619675a46b30b68def16ab426f2dee00bd0768f82ca0ee26acd7adedd379f25613e309ec9dfaed4e8a5d3f3e4fa7e8d845f55b18')

validpgpkeys=('BA5473A2B0587B07FB27CF2D216094DFD0CB81EF') # OpenSSL <openssl@openssl.org>
_arch_list=(AARCH64 IA32 X64)
_build_type=RELEASE
_build_plugin=GCC5

pkgver() {
  cd "${srcdir}"/edk2
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgbase%-git}"
  # Link submodules - https://github.com/tianocore/edk2/blob/master/.gitmodules

  # symlink public-mipi-sys-t
  rm -rfv MdePkg/Library/MipiSysTLib/mipisyst
  ln -sfv "${srcdir}/public-mipi-sys-t" MdePkg/Library/MipiSysTLib/mipisyst

  # symlink libfdt
  rm -rfv MdePkg/Library/BaseFdtLib/libfdt
  ln -sfv "${srcdir}/libfdt" MdePkg/Library/BaseFdtLib/libfdt

  # symlink libspdm
  rm -rfv SecurityPkg/DeviceSecurity/SpdmLib/libspdm
  ln -sfv "${srcdir}/libspdm" SecurityPkg/DeviceSecurity/SpdmLib/libspdm

  # symlink mbedtls
  rm -rfv CryptoPkg/Library/MbedTlsLib/mbedtls
  ln -sfv "${srcdir}/mbedtls" CryptoPkg/Library/MbedTlsLib/mbedtls

  # symlink openssl
  rm -rfv CryptoPkg/Library/OpensslLib/openssl
  ln -sfv "${srcdir}/openssl-$_openssl_ver" CryptoPkg/Library/OpensslLib/openssl
	# TODO hack - https://github.com/tianocore/edk2/issues/11119
  ln -sfv ssl_err_legacy.c CryptoPkg/Library/OpensslLib/openssl/ssl/ssl_err.c

  # symlink brotli
  rm -rfv BaseTools/Source/C/BrotliCompress/brotli MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
  ln -sfv "${srcdir}/brotli-${_brotli_ver}" BaseTools/Source/C/BrotliCompress/brotli
  ln -sfv "${srcdir}/brotli-${_brotli_ver}" MdeModulePkg/Library/BrotliCustomDecompressLib/brotli

  # -Werror, not even once
  sed -e 's/ -Werror//g' \
      -i BaseTools/Conf/*.template BaseTools/Source/C/Makefiles/*.makefile

  # copy seabios's CSM binary into place, so that it can be included in the binaries:
  cp -v /usr/share/qemu/bios-csm.bin OvmfPkg/Csm/Csm16/Csm16.bin
}

# TODO: check TPM_ENABLE/TPM2_ENABLE
build() {
  cd "${pkgbase%-git}"
  export GCC5_IA32_PREFIX="x86_64-linux-gnu-"
  export GCC5_X64_PREFIX="x86_64-linux-gnu-"
  export GCC5_AARCH64_PREFIX="aarch64-linux-gnu-"
  local _arch
  echo "Building base tools (AARCH64)"
  ARCH=AARCH64 make -C BaseTools
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
    if [[ "${_arch}" == 'IA32' ]]; then
      echo "Building ovmf (${_arch}) with secure boot support"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "${_arch}" \
                       -b "${_build_type}" \
                       -n "$(nproc)" \
                       -t "${_build_plugin}" \
                       -D LOAD_X64_ON_IA32_ENABLE \
                       -D NETWORK_IP6_ENABLE \
                       -D TPM_ENABLE \
                       -D TPM_CONFIG_ENABLE \
                       -D HTTP_BOOT_ENABLE \
                       -D TLS_ENABLE \
                       -D FD_SIZE_2MB \
                       -D SECURE_BOOT_ENABLE \
                       -D SMM_REQUIRE \
                       -D EXCLUDE_SHELL_FROM_FD
      mv -v Build/Ovmf{Ia32,IA32-secure}
      echo "Building ovmf (${_arch}) with CSM support"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "${_arch}" \
                       -b "${_build_type}" \
                       -n "$(nproc)" \
                       -t "${_build_plugin}" \
                       -D LOAD_X64_ON_IA32_ENABLE \
                       -D NETWORK_IP6_ENABLE \
                       -D TPM_ENABLE \
                       -D TPM_CONFIG_ENABLE \
                       -D HTTP_BOOT_ENABLE \
                       -D TLS_ENABLE \
                       -D CSM_ENABLE \
                       -D FD_SIZE_2MB
      mv -v Build/Ovmf{Ia32,IA32-csm}
      echo "Building ovmf (${_arch}) default"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "${_arch}" \
                       -b "${_build_type}" \
                       -n "$(nproc)" \
                       -t "${_build_plugin}" \
                       -D LOAD_X64_ON_IA32_ENABLE \
                       -D NETWORK_IP6_ENABLE \
                       -D TPM_ENABLE \
                       -D TPM_CONFIG_ENABLE \
                       -D HTTP_BOOT_ENABLE \
                       -D TLS_ENABLE \
                       -D FD_SIZE_2MB
      mv -v Build/Ovmf{Ia32,IA32}
    fi
    if [[ "${_arch}" == 'X64' ]]; then
      echo "Building ovmf (${_arch}) with secure boot support"
      OvmfPkg/build.sh -p "OvmfPkg/OvmfPkgIa32X64.dsc" \
                       -a IA32 -a "${_arch}" \
                       -b "${_build_type}" \
                       -n "$(nproc)" \
                       -t "${_build_plugin}" \
                       -D NETWORK_IP6_ENABLE \
                       -D TPM_ENABLE \
                       -D TPM_CONFIG_ENABLE \
                       -D FD_SIZE_2MB \
                       -D TLS_ENABLE \
                       -D HTTP_BOOT_ENABLE \
                       -D SECURE_BOOT_ENABLE \
                       -D SMM_REQUIRE \
                       -D EXCLUDE_SHELL_FROM_FD
      mv -v Build/Ovmf3264{,-secure}
      echo "Building ovmf (${_arch}) with CSM support"
      OvmfPkg/build.sh -p "OvmfPkg/OvmfPkg${_arch}.dsc" \
                       -a "${_arch}" \
                       -b "${_build_type}" \
                       -n "$(nproc)" \
                       -t "${_build_plugin}" \
                       -D NETWORK_IP6_ENABLE \
                       -D TPM_ENABLE \
                       -D TPM_CONFIG_ENABLE \
                       -D FD_SIZE_2MB \
                       -D TLS_ENABLE \
                       -D CSM_ENABLE \
                       -D HTTP_BOOT_ENABLE
      mv -v Build/OvmfX64{,-csm}
      echo "Building ovmf (${_arch}) without secure boot"
      OvmfPkg/build.sh -p "OvmfPkg/OvmfPkg${_arch}.dsc" \
                       -a "${_arch}" \
                       -b "${_build_type}" \
                       -n "$(nproc)" \
                       -t "${_build_plugin}" \
                       -D NETWORK_IP6_ENABLE \
                       -D TPM_ENABLE \
                       -D TPM_CONFIG_ENABLE \
                       -D FD_SIZE_2MB \
                       -D TLS_ENABLE \
                       -D HTTP_BOOT_ENABLE
    fi
    if [[ "${_arch}" == 'AARCH64' ]]; then
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

package_edk2-armvirt-git() {
  pkgdesc="Firmware for Virtual Machines (aarch64)"
  url="https://github.com/tianocore/tianocore.github.io/wiki/ArmVirtPkg"
  local _arch=AARCH64

  cd "${pkgbase%-git}"
  install -vDm 644 "Build/ArmVirtQemu-${_arch}/${_build_type}_${_build_plugin}/FV/"*.fd \
    -t "${pkgdir}/usr/share/${pkgname}/${_arch,,}/"
  # add libvirt compatibility (which hardcodes the following paths)
  install -vdm 755 "${pkgdir}/usr/share/AAVMF"
  ln -svf "/usr/share/${pkgname}/${_arch,,}/QEMU_CODE.fd" \
    "${pkgdir}/usr/share/AAVMF/AAVMF_CODE.fd"
  ln -svf "/usr/share/${pkgname}/${_arch,,}/QEMU_VARS.fd" \
    "${pkgdir}/usr/share/AAVMF/AAVMF_VARS.fd"
  # install qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  install -vDm 644 ../*"${pkgname}"*.json -t "${pkgdir}/usr/share/qemu/firmware"
  # license
  install -vDm 644 License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_edk2-shell-git() {
  pkgdesc="EDK2 UEFI Shell"
  provides=(uefi-shell)

  cd "${pkgbase%-git}"
  local _arch
  # minimal UEFI shell, as defined in ShellPkg/Application/Shell/ShellPkg.inf
  local _min='7C04A583-9E3E-4f1c-AD65-E05268D0B4D1'
  # full UEFI shell, as defined in ShellPkg/ShellPkg.dsc
  local _full='EA4BB293-2D7F-4456-A681-1F22F42CD0BC'
  for _arch in ${_arch_list[@]}; do
    if [[ "${_arch}" == 'AARCH64' ]]; then
      install -vDm 644 "Build/ArmVirtQemu-${_arch}/${_build_type}_${_build_plugin}/${_arch}/Shell.efi" \
        -t "${pkgdir}/usr/share/${pkgname}/${_arch,,}/"
    else
      install -vDm 644 "Build/Shell/${_build_type}_${_build_plugin}/${_arch}/Shell_${_min}.efi" \
        "${pkgdir}/usr/share/${pkgname}/${_arch,,}/Shell.efi"
      install -vDm 644 "Build/Shell/${_build_type}_${_build_plugin}/${_arch}/Shell_${_full}.efi" \
        "${pkgdir}/usr/share/${pkgname}/${_arch,,}/Shell_Full.efi"
    fi
  done
  # license
  install -vDm 644 License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # docs
  install -vDm 644 {ReadMe.rst,Maintainers.txt} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

package_edk2-ovmf-git() {
  pkgdesc="Firmware for Virtual Machines (x86_64, i686)"
  url="https://github.com/tianocore/tianocore.github.io/wiki/OVMF"
  license+=(MIT)
  provides=(ovmf)
  conflicts=(ovmf)
  replaces=(ovmf)
  install="${pkgname}.install"

  cd "${pkgbase%-git}"
  local _arch
  # installing the various firmwares
  for _arch in ${_arch_list[@]}; do
    if [[ "${_arch}" == 'AARCH64' ]]; then
      continue
    else
      # installing OVMF.fd for xen: https://bugs.archlinux.org/task/58635
      install -vDm 644 "Build/Ovmf${_arch}/${_build_type}_${_build_plugin}/FV/OVMF.fd" \
        -t "${pkgdir}/usr/share/${pkgname}/${_arch,,}"
      install -vDm 644 "Build/Ovmf${_arch}/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd" \
        -t "${pkgdir}/usr/share/${pkgname}/${_arch,,}"
      install -vDm 644 "Build/Ovmf${_arch}/${_build_type}_${_build_plugin}/FV/OVMF_VARS.fd" \
        -t "${pkgdir}/usr/share/${pkgname}/${_arch,,}"
      install -vDm 644 "Build/Ovmf${_arch}-csm/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd" \
        "${pkgdir}/usr/share/${pkgname}/${_arch,,}/OVMF_CODE.csm.fd"
      if [[ "${_arch}" == 'X64' ]]; then
        install -vDm 644 "Build/Ovmf3264-secure/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd" \
          "${pkgdir}/usr/share/${pkgname}/${_arch,,}/OVMF_CODE.secboot.fd"
      else
        install -vDm 644 "Build/Ovmf${_arch}-secure/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd" \
          "${pkgdir}/usr/share/${pkgname}/${_arch,,}/OVMF_CODE.secboot.fd"
        fi
    fi
  done
  # installing qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  # https://bugs.archlinux.org/task/64206
  install -vDm 644 ../*"${pkgname}"*.json -t "${pkgdir}/usr/share/qemu/firmware"
  # adding symlink for previous ovmf location
  # https://bugs.archlinux.org/task/66528
  ln -svf "/usr/share/${pkgname}" "${pkgdir}/usr/share/ovmf"
  # adding a symlink for applications with questionable heuristics (such as lxd)
  ln -svf "/usr/share/${pkgname}" "${pkgdir}/usr/share/OVMF"
  # licenses
  install -vDm 644 License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 OvmfPkg/License.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/OvmfPkg.License.txt"
  # docs
  install -vDm 644 {OvmfPkg/README,ReadMe.rst,Maintainers.txt} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
