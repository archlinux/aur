# Maintainer: David J. Allen <davidallendj@gmail.com>
pkgname=gdpm-git
pkgver=r99.13487a1
pkgrel=1
pkgdesc="CLI tool to automate managing Godot game engine assets from the command-line. This includes a pre-built, static binary."
arch=('x86_64')
url="https://github.com/davidallendj/gdpm"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'ninja' 'clang' 'gcc')
optdepends=('meson' 'make')
source=("$pkgname-$pkgver::git+https://github.com/davidallendj/gdpm")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# remove all links to modules
	rm -f include/argparse
	rm -f include/tabulate
	rm -f include/indicators
	rm -f include/csv2

	# update and initialize submodules
	git submodule update --init modules/argparse
	git submodule update --init modules/tabulate
	git submodule update --init modules/indicators
	git submodule update --init modules/csv2

	# link module headers to include/*
	ln -s ../modules/argparse/include/argparse include/argparse
	ln -s ../modules/tabulate/include/tabulate include/tabulate
	ln -s ../modules/indicators/include/indicators include/indicators
	ln -s ../modules/csv2/include/csv2 include/csv2
}

build () {
	cd "$srcdir/$pkgname-$pkgver"
	bin/compile.sh --all
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	# install the binary to /usr/bin
	mkdir -p "${pkgdir}/usr/bin"
	install -m755 build/gdpm.static "${pkgdir}/usr/bin/gdpm"
}

clean() {
	rm -rf "$srcdir/$pkgname-$pkgver"
}
