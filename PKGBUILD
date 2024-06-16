# Maintainer: Popolon <popolon at popolon dot org>

pkgname=libriscv
pkgver=1.4
pkgrel=1
pkgdesc='RISC-V userspace emulator library'
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
url='https://github.com/fwsGonzo/libriscv'
license=('BSD-3-Clause')
depends=(
  'tcc'
)
makedepends=(
  'cmake'
)
optdepends=(
  'riscv64-linux-gnu-gcc: compiling softwares for risc-v architecture'
  'clang: compiling softwares for various architectures including risc-v'
  'riscv64-linux-gnu-gdb: gnu debugger risc-v version'
)

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/fwsGonzo/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('030547eaa25eeea2fee1e0dc15e4ec34d4489d6abe7399c0269cd10a68386444')

# Workaround for linking against the installed library
CXXFLAGS+=" -ffat-lto-objects "

build(){
 # lib
  cmake -B build -S ${pkgname}-${pkgver} \
     -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
 # cli
  cmake -B build-cli -S ${pkgname}-${pkgver}/emulator \
     -DCMAKE_INSTALL_PREFIX=/usr \
	 -DRISCV_BINARY_TRANSLATION=ON -DRISCV_LIBTCC=ON -DRISCV_LIBTCC_DISTRO_PACKAGE=ON
  make -C build-cli


}
package(){
  make -C build DESTDIR="${pkgdir}/" install
  install -Dm755 build-cli/rvlinux ${pkgdir}/usr/bin/rvlinux
}
