# Maintainer: vimacs <https://vimacs.lcpu.club>

pkgname=mrustc-git
pkgver=v0.9.15
pkgrel=1
pkgdesc='Alternative rust compiler written in C++'
arch=('x86_64')
url='https://github.com/thepowersgang/mrustc'
license=('MIT')
depends=('clang') # mrustc will crash if built with GCC 9
makedepends=()
provides=()
conflicts=()
source=('git+https://github.com/thepowersgang/mrustc.git'
	'minicargo-use-system-mrustc.patch')
sha256sums=('SKIP'
	'b2d0ed78257ff18aebdb556532140f43d041468f7da479bac153a9bb88870d5b')

pkgver() {
	cd "$srcdir/mrustc"
	git describe --tags | sed -e 's/-g.*//g' -e 's/-/./g'
}

build() {
	cd "$srcdir/mrustc"
	patch -p1 -i "$srcdir/minicargo-use-system-mrustc.patch"
	sed -i 's/x86_64-linux-gnu/x86_64-pc-linux-gnu/g' tools/common/target_detect.h src/trans/target.cpp
	make CXX=clang++
	make CXX=clang++ -C tools/minicargo
}

package() {
	cd "$srcdir/mrustc"
	install -D bin/mrustc "$pkgdir/usr/bin/mrustc"
	install -D tools/bin/minicargo "$pkgdir/usr/bin/minicargo"
	install -d "$pkgdir/usr/share/mrustc"
	cp -r script-overrides lib run_rustc "$pkgdir/usr/share/mrustc/"

	sed -e 's/bin\/mrustc/\/usr\/bin\/mrustc/g' \
		-e 's/tools\/bin/\/usr\/bin/g' \
		-e 's/\(script-overrides\|lib\)\//\/usr\/share\/mrustc\/\1\//g' \
		-e '/Makefile all/d' -e '/tools\/minicargo/d' \
		-e 's/$(RUSTCSRC)build\/bin\/llvm-config/\/usr\/bin\/llvm-config/g' \
		minicargo.mk > "$pkgdir/usr/share/mrustc/minicargo.mk"
}
