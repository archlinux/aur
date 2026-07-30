# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=intel-sgx-sdk-bin
pkgdesc='Intel® Software Guard Extensions SDK for Linux* OS'
pkgver=2.29
_pkgver="${pkgver}.100.1"
pkgrel=2
url='https://github.com/intel/confidential-computing.sgx'
arch=(x86_64)
license=('BSD-3-Clause AND LicenseRef-Intel-SGX-Third-Party') # https://github.com/intel/confidential-computing.sgx/blob/main/License.txt
depends=('glibc' 'libstdc++' 'openssl' 'bash' 'python')
optdepends=(
  'intel-sgx-psw: for hardware support'
  'gdb: GDB plugin for SGX binaries'
)
provides=("intel-sgx-sdk=${pkgver}")
conflicts=('intel-sgx-sdk')
options=(!strip !debug) # debug symbols already included from upstream, better not to strip them
source=("https://download.01.org/intel-sgx/sgx-linux/${pkgver}/distro/ubuntu26.04-server/sgx_linux_x64_sdk_${_pkgver}.bin"
        'intel-sgx-sdk-skip-tmp.patch')
b2sums=('1e9f9c0c1127266483c2cc78df6dd5eabe4827ec464958476e481611e4705d187d86d915c19e19aa023e044f6ff4244971ab5ffc1bd635c4c9fb04b412820a37'
        '7da757aae6410d927b3697a66608b84d10a4902fc522ed4af4453cf8dcece1a2f46a762a55455710433dc516f9a68f662ab32cebe3c5fe28639c1d13f661606c')

## Here you can change the installation directory.
_installdir=/opt/intel

prepare() {
  cp "sgx_linux_x64_sdk_${_pkgver}.bin" sgx_linux_x64_sdk.bin
  patch --binary --force -t -Ni intel-sgx-sdk-skip-tmp.patch
  chmod +x sgx_linux_x64_sdk.bin
}

package() (
  local installdir
  installdir="$(realpath -m "${pkgdir}/${_installdir}")"

  # The installer runs a Makefile which fails when run in parallel.
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

  # The uninstall script shouldn't be used with this package.
  rm "${pkgdir}/opt/intel/sgxsdk/uninstall.sh"

  # composed license
  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
    -m644 "${pkgdir}/opt/intel/sgxsdk/licenses/License.txt"
)
