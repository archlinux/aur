# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=intel-sgx-sdk-bin
pkgdesc='Intel® Software Guard Extensions SDK for Linux* OS'
pkgver=2.29
_pkgver="${pkgver}.100.1"
pkgrel=1
url='https://github.com/intel/linux-sgx'
arch=('x86_64')
license=('BSD-3-Clause AND LicenseRef-IntelSgx-ThirdParty') # https://github.com/intel/linux-sgx?tab=License-1-ov-file
depends=('gcc-libs' 'python' 'glibc' 'bash' 'openssl')
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
        '172c8158deae15e54b6a5de6c891b287403def61841a9b877105ddf04c3358ac187b98d4e89f9eea06fc36c8b9afa2ea12b41c17c86754559f23dd1e403924dd')

## Here you can change the installation directory.
_installdir=/opt/intel

prepare() {
  cp "${srcdir}/sgx_linux_x64_sdk_${_pkgver}.bin" "${srcdir}"/sgx_linux_x64_sdk.bin
  patch --binary --force -p1 -i "${srcdir}/intel-sgx-sdk-skip-tmp.patch" -d "${srcdir}"
  chmod +x "${srcdir}"/sgx_linux_x64_sdk.bin
}

package() (
  local installdir
  # shellcheck disable=SC2030
  installdir="$(realpath -m "${pkgdir}/${_installdir}")"

  # The installer runs a Makefile which fails when run in parallel.
  export MAKEFLAGS='-j1'
  "${srcdir}"/sgx_linux_x64_sdk.bin --prefix "${installdir}"

  # fix broken ${srcdir} references
  sed -E -i "s|\b(SGX_SDK=).*|\1${_installdir}/sgxsdk|g" "${installdir}"/sgxsdk/environment
  sed -E -i "s|\b(SGX_LIBRARY_PATH=).*|\1${_installdir}/sgxsdk/lib64|g" "${installdir}"/sgxsdk/bin/sgx-gdb
  sed -E -i "s|^(prefix=).*|\1${_installdir}/sgxsdk|g" "${installdir}"/sgxsdk/pkgconfig/*.pc

  ln -sf libsgx_urts.so "${installdir}"/sgxsdk/lib64/libsgx_urts.so.2
  find "${installdir}"/sgxsdk/sdk_libs/ -name '*.so' \
    -exec bash -ec 'ln -sf "../lib64/$(basename "$0")" "$0"' '{}' \;

  # The uninstall script shouldn't be used with this package.
  rm "${pkgdir}/opt/intel/sgxsdk/uninstall.sh"

  # composed license
  install -Dm644 "${pkgdir}"/opt/intel/sgxsdk/licenses/License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
)
