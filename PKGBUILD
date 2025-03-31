# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>
_pkgname=blisp
pkgname=blisp-git
pkgver=v0.0.4.r30.ge45941c
pkgrel=1
pkgdesc="ISP tool & library for Bouffalo Labs RISC-V Microcontrollers and SoCs"
url="https://github.com/pine64/blisp"
makedepends=('git' 'cmake')
license=("MIT")
arch=('x86_64' 'armv7h' 'aarch64' 'powerpc' 'powerpc64' 'powerpc64le' 'riscv64')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/pine64/blisp/"
	    "termios.patch")
sha256sums=('SKIP'
            '373366d48729a2ccc678fcb6ec5d5bdd15d663c77b27552e744908a72a9e5916')

prepare(){
	cd "${_pkgname}"
	git submodule update --init --recursive

	case "$CARCH" in
		"powerpc"*)
			echo "Patching: ppc, ppc64, and ppc64le use termios, not termios2"
			patch < ../termios.patch
			;;
		*)
			;;
	esac
	mkdir -p build
	cd build

	cmake -DBLISP_BUILD_CLI=ON ..
}


pkgver(){
	cd "${_pkgname}"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"/build
	cmake --build .
}

package() {
  install -Dm755 "${srcdir}"/"${_pkgname}"/build/tools/blisp/blisp "${pkgdir}/"usr/bin/blisp
}
