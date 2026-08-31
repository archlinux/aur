# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=intel-sgx-sdk-bin
pkgdesc='Intel® Software Guard Extensions SDK for Linux* OS'
pkgver=2.30.1
_pkgver="${pkgver%.1}.101.1"
pkgrel=1
url='https://github.com/intel/confidential-computing.sgx.sdk'
arch=(x86_64)
license=('BSD-3-Clause AND LicenseRef-Intel-SGX-Third-Party') # https://github.com/intel/confidential-computing.sgx.sdk/blob/main/License.txt
provides=("intel-sgx-sdk=${pkgver}")
conflicts=('intel-sgx-sdk')
options=(!strip !debug)
source=("https://download.01.org/intel-sgx/sgx-linux/${pkgver}/distro/Debian13/sgx_linux_x64_sdk_${_pkgver}.bin"
        'intel-sgx-sdk-skip-tmp.patch')
b2sums=('40b0571fcf9dc4b689b673400aea0f680b4cbcb7b1fdae0aacd59ab7795d1c42319bc50f812713bf20ad604fecb8c090f629f3313c1aedbc89823313bc981ca1'
        '35971e6ee160143327a939c964a785349b07f3386a1cc15e42be573d9cc64808f1d199e1257a00212544e492b4aa8d1b961cd70d916230e9fd90c55873f2554e')

## Here you can change the installation directory.
_installdir=/opt/intel

prepare() {
  cp "sgx_linux_x64_sdk_${_pkgver}.bin" sgx_linux_x64_sdk.bin
  patch --binary --force -t -Ni intel-sgx-sdk-skip-tmp.patch
  chmod -c +x sgx_linux_x64_sdk.bin
}

package() {
  depends=('glibc' 'libstdc++' 'openssl' 'bash' 'python')
  optdepends=(
    'intel-sgx-psw: for hardware support'
    'gdb: GDB plugin for SGX binaries'
  )

  local installdir
  installdir=$(realpath -m "${pkgdir}/${_installdir}")

  # The installer runs a Makefile which fails when run in parallel
  export MAKEFLAGS='-j1'
  ./sgx_linux_x64_sdk.bin --prefix "${installdir}"
  cd "${installdir}"

  # fix ${srcdir} references
  sed -i -E "s|\b(SGX_SDK=).*|\1${_installdir}/sgxsdk|g" sgxsdk/environment
  sed -i -E "s|\b(SGX_LIBRARY_PATH=).*|\1${_installdir}/sgxsdk/lib64|g" sgxsdk/bin/sgx-gdb
  sed -i -E "s|^(prefix=).*|\1${_installdir}/sgxsdk|g" sgxsdk/pkgconfig/*.pc

  # fix generated symlinks
  ln -v -s libsgx_urts.so -fT sgxsdk/lib64/libsgx_urts.so.2
  find sgxsdk/sdk_libs/ -name '*.so' -print -exec \
    sh -euc 'ln -sr "sgxsdk/lib64/$(basename "$1")" -fT "$1"' -- '{}' \;

  # The uninstall script shouldn't be used with this package
  rm -v "${pkgdir}/opt/intel/sgxsdk/uninstall.sh"

  # composed license
  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
    -m644 "${pkgdir}/opt/intel/sgxsdk/licenses/License.txt"
}
