# Maintainer: Mark Weiman <mark.weiman@markzz.com>
pkgname=ovmf-git
pkgver=r25361.514c55c185
epoch=1
pkgrel=1
arch=('any')
pkgdesc="Tianocore UEFI firmware for qemu."
url="http://sourceforge.net/apps/mediawiki/tianocore/index.php?title=EDK2"
license=('custom')
makedepends=('git' 'python2' 'iasl' 'nasm' 'subversion' 'perl-libwww')
provides=('ovmf')
conflicts=('ovmf')
source=('edk2::git+https://github.com/tianocore/edk2#branch=master')
sha256sums=('SKIP')
options=(!makeflags)
_toolchain_opt=GCC5

pkgver() {
  cd "${srcdir}"/edk2
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  # edk2 uses python everywhere, but expects python2
  mkdir bin
  ln -s /usr/bin/python2 bin/python
  cd edk2
  git submodule update --init --recursive
}

build() {
  if [ "$CARCH" != "x86_64" ]; then
    error "This package must be built under the x86_64 architecture."
    false
  fi
  export PATH="${srcdir}/bin:$PATH"
  cd "${srcdir}/"edk2
  make -C BaseTools
  export EDK_TOOLS_PATH="${srcdir}"/edk2/BaseTools
  . edksetup.sh BaseTools

  # Set RELEASE target, toolchain and number of build threads
  sed "s|^TARGET[ ]*=.*|TARGET = RELEASE|; \
       s|TOOL_CHAIN_TAG[ ]*=.*|TOOL_CHAIN_TAG = ${_toolchain_opt}|; \
       s|MAX_CONCURRENT_THREAD_NUMBER[ ]*=.*|MAX_CONCURRENT_THREAD_NUMBER = $(nproc)|;" -i Conf/target.txt
  # Build OVMF for ia32
  #sed "s|^TARGET_ARCH[ ]*=.*|TARGET_ARCH = IA32|; \
  #     s|^ACTIVE_PLATFORM[ ]*=.*|ACTIVE_PLATFORM = OvmfPkg/OvmfPkgIa32.dsc|;" -i Conf/target.txt
  #./BaseTools/BinWrappers/PosixLike/build
  # Build OVMF for x64
  sed "s|^TARGET_ARCH[ ]*=.*|TARGET_ARCH = X64|; \
       s|^ACTIVE_PLATFORM[ ]*=.*|ACTIVE_PLATFORM = OvmfPkg/OvmfPkgX64.dsc|;" -i Conf/target.txt
  ./BaseTools/BinWrappers/PosixLike/build
}

package() {
  #install -D -m644 "${srcdir}"/edk2/Build/OvmfIa32/RELEASE_${_toolchain_opt}/FV/OVMF_CODE.fd "${pkgdir}"/usr/share/ovmf/ovmf_code_ia32.bin
  #install -D -m644 "${srcdir}"/edk2/Build/OvmfIa32/RELEASE_${_toolchain_opt}/FV/OVMF_VARS.fd "${pkgdir}"/usr/share/ovmf/ovmf_vars_ia32.bin
  install -D -m644 "${srcdir}"/edk2/Build/OvmfX64/RELEASE_${_toolchain_opt}/FV/OVMF_CODE.fd "${pkgdir}"/usr/share/ovmf/ovmf_code_x64.bin
  install -D -m644 "${srcdir}"/edk2/Build/OvmfX64/RELEASE_${_toolchain_opt}/FV/OVMF_VARS.fd "${pkgdir}"/usr/share/ovmf/ovmf_vars_x64.bin
  install -D -m644 "${srcdir}"/edk2/OvmfPkg/License.txt "${pkgdir}"/usr/share/licenses/ovmf/License.txt
}
