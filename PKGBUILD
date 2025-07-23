# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=intel-sgx-sdk-bin
pkgdesc='Intel® Software Guard Extensions SDK for Linux* OS'
pkgver=2.26
_pkgver="${pkgver}.100.0"
pkgrel=2
url='https://github.com/intel/linux-sgx'
arch=('x86_64')
license=('BSD-3-Clause AND LicenseRef-IntelSgx-ThirdParty') # https://github.com/intel/linux-sgx?tab=License-1-ov-file
makedepends=(bubblewrap)
depends=(gcc-libs python glibc bash openssl)
optdepends=(
  'intel-sgx-psw: for hardware support'
  'gdb: GDB plugin for SGX binaries'
)
provides=('intel-sgx-sdk')
conflicts=('intel-sgx-sdk')
source=("https://download.01.org/intel-sgx/sgx-linux/${pkgver}/distro/ubuntu24.04-server/sgx_linux_x64_sdk_${_pkgver}.bin")
b2sums=('cf8f255d82c0a2de1b34de5cee28597a5a3bb21011861d9572f178de1cb3ff91f2e6733c8826927555a9b78e46220ab32063178da1659dd6f4d07713c0c188fa')

prepare() {
  chmod +x "${srcdir}/sgx_linux_x64_sdk_${_pkgver}.bin"
}

package() {
  # The installer uses a temporary makefile which fails if run in parallel.
  export MAKEFLAGS='-j1'

  install -d "${pkgdir}"/opt

  # The installer builds a folder in /tmp, then install the package from there, which is
  # not allowed by makepkg. So bubblewrap is used here for a mini container with a
  # separate /tmp for the installer. LD_PRELOAD causes some issues with bwrap, though.
  env -u LD_PRELOAD \
  bwrap --unshare-all --die-with-parent \
    --bind "${pkgdir}"/opt /opt \
    --bind "${srcdir}/sgx_linux_x64_sdk_${_pkgver}.bin" /sgx_linux_x64_sdk.bin \
    --dev /dev \
    --tmpfs /tmp \
    --ro-bind /usr /usr \
    --ro-bind /lib /lib \
    --ro-bind /bin /bin \
    --ro-bind /lib64 /lib64 \
    /sgx_linux_x64_sdk.bin --prefix /opt/intel

  # composed license
  install -Dm644 "${pkgdir}"/opt/intel/sgxsdk/licenses/License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
