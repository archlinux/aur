# Maintainer: Sean Anderson <seanga2@gmail.com>
_pkgname=ktool
pkgname=python-${_pkgname}-git
pkgver=r9.0345aa9
pkgrel=2
pkgdesc="A Python-based Kendryte K210 UART ISP Utility"
arch=('any')
url="https://github.com/loboris/ktool"
license=('Apache')
groups=()
depends=('python' 'python-pyserial')
makedepends=('git' 'cmake' 'riscv64-elf-gcc' 'riscv64-elf-newlib' 'perl')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/loboris/ktool.git'
	'toolchain-riscv64-elf.cmake')
noextract=()
md5sums=('SKIP'
         '63dcbebb0a1e540387ca930d5264ff95')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_pkgname}"
	# We need some fixups to build with Arch's toolchain
	sed -i 's/mabi=lp64f/mabi=lp64d/g' cmake/compile-flags.cmake
	sed -i 's/march=rv64imafc/march=rv64gc/g' cmake/compile-flags.cmake
	sed -i '/toolchain.cmake/d' cmake/common.cmake
	sed -i '/machine\/syscall.h/d' lib/bsp/include/syscalls.h
	perl -0777 -pi -e 's/ISP_PROG = \([^)]*\)/###ISP_PROG###/g' ktool.py
}

build() {
	cd "$srcdir/${_pkgname}/build"
	cmake .. -DPROJ=isp -DCMAKE_TOOLCHAIN_FILE="$srcdir/toolchain-riscv64-elf.cmake"
	make
	./isp_bintovar.py
	sed -i '/###ISP_PROG###/r ISP_PROG.py' ../ktool.py
}

package() {
	cd "$srcdir/${_pkgname}"
	mkdir -p "$pkgdir/usr/bin"
	cp -a ktool.py "$pkgdir/usr/bin/ktool"
}
