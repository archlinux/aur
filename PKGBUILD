# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=nauz-file-detector-git
pkgver=0.01.r1.g1412dcb
pkgrel=1
pkgdesc="Nauz File Detector is a portable linker/compiler/packer identifier utility."
arch=(x86_64)
url="http://n10info.blogspot.com/2018/12/nauz-file-detector.html"
license=('MIT')
makedepends=('git' 'make' 'qt5-base')
source=("${pkgname}::git+https://github.com/horsicq/Nauz-File-Detector")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	git reset HEAD --hard
	git submodule update --init --recursive
}

build() {
	cd "${srcdir}/${pkgname}"

	function makeproject() {
		pushd $1

		qmake $1.pro -spec linux-g++
		make -j $(nproc) -f Makefile clean
		make -j $(nproc) -f Makefile

		rm -rf Makefile
		rm -rf Makefile.Release
		rm -rf Makefile.Debug
		rm -rf object_script.*

		popd
	}

	makeproject gui_source
	makeproject console_source
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 build/release/nfd "${pkgdir}"/usr/bin/nfd
	install -Dm755 build/release/nfdc "${pkgdir}"/usr/bin/nfdc
}
