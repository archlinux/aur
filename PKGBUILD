# Maintainer: Popolon <popolon at popolon dot org>
# Maintainer: Fwsgonzo 
pkgname=libriscv
pkgver=1.19
pkgrel=1
pkgdesc='RISC-V userspace emulator library'
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
url='https://libriscv.no/'
license=('BSD-3-Clause')
makedepends=(
  'cmake'
)
optdepends=(
  'riscv64-linux-gnu-gcc: compiling softwares for risc-v architecture'
  'clang: compiling softwares for various architectures including risc-v'
  'riscv64-linux-gnu-gdb: gnu debugger risc-v version'
)

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/libriscv/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('eba6da220493d430dc8a7cf69b973682bb3112195552378e897f96e5ae42f15d')

# Workaround for linking against the installed library
CXXFLAGS+=" -ffat-lto-objects "

build(){
 # lib
  cmake -B build -S ${pkgname}-${pkgver} \
     -DCMAKE_INSTALL_PREFIX=/usr \
	 -DRISCV_BINARY_TRANSLATION=ON
  make -C build
 # cli
  cmake -B build-cli -S ${pkgname}-${pkgver}/emulator \
     -DCMAKE_INSTALL_PREFIX=/usr \
	 -DRISCV_BINARY_TRANSLATION=ON
  make -C build-cli
}

package(){
  make -C build DESTDIR="${pkgdir}/" install
  install -Dm755 build-cli/rvlinux ${pkgdir}/usr/bin/rvlinux
}
