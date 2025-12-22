# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=intel-sgx-sdk-bin
pkgdesc='Intel® Software Guard Extensions SDK for Linux* OS'
pkgver=2.27
_pkgver="${pkgver}.100.1"
pkgrel=1
url='https://github.com/intel/linux-sgx'
arch=('x86_64')
license=('BSD-3-Clause AND LicenseRef-IntelSgx-ThirdParty') # https://github.com/intel/linux-sgx?tab=License-1-ov-file
makedepends=('bubblewrap')
depends=('gcc-libs' 'python' 'glibc' 'bash' 'openssl')
optdepends=(
  'intel-sgx-psw: for hardware support'
  'gdb: GDB plugin for SGX binaries'
)
provides=("intel-sgx-sdk=${pkgver}")
conflicts=('intel-sgx-sdk')
source=("https://download.01.org/intel-sgx/sgx-linux/${pkgver}/distro/ubuntu24.04-server/sgx_linux_x64_sdk_${_pkgver}.bin")
b2sums=('e4bd1e79e142cf9a136dcdf7f6b0efff879d28094e3afc93e24ab9ebb2546d74378d6d0ccf0562eec495ae0b40f7bdb63a51e1945e5ca98b148411fff37cd402')

prepare() {
  chmod +x "${srcdir}/sgx_linux_x64_sdk_${_pkgver}.bin"
}

package() {
  # The installer uses a temporary makefile which fails when run in parallel.
  export MAKEFLAGS='-j1'

  install -d "${pkgdir}"/opt

  # The installer builds a folder in /tmp, then install the package from there, but
  # makepkg does not allow access to /tmp. So bubblewrap is used here instead as a
  # mini container with a separate /tmp for the installer. LD_PRELOAD causes some
  # issues with bwrap, though.
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

  # The uninstall script shouldn't be used with this package.
  rm "${pkgdir}/opt/intel/sgxsdk/uninstall.sh"

  # composed license
  install -Dm644 "${pkgdir}"/opt/intel/sgxsdk/licenses/License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
