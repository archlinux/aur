# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=merlin-linkage
pkgver=1.1.2
pkgrel=1
pkgdesc="Bioinformatics linkage analysis tool"
arch=('i686' 'x86_64')
url="https://csg.sph.umich.edu/abecasis/Merlin"
license=('custom:merlin')
depends=('zlib')
source=("$url/download/merlin-$pkgver.tar.gz")
sha256sums=('aa3c087b1c717209389705bf2ace4c24884575014a561dff250c0be93fe1e411')

prepare() {
	cd "merlin-$pkgver"
	#the pedstats component is not C++14 compliant
	tar -C "$srcdir" -xf "pedstats-0.6.10.tar.gz"
	sed -i 's/CFLAGS=/CFLAGS=-std=gnu++98 /' "$srcdir/pedstats-0.6.10/Makefile"
	tar -C "$srcdir" -zcf "pedstats-0.6.10.tar.gz" "pedstats-0.6.10"
}

build() {
	cd "merlin-$pkgver"
	make all
	sed -n '/If you use MERLIN/,/information./p' README > LICENSE
}

package() {
	cd "merlin-$pkgver"
	make INSTALLDIR="$pkgdir/usr/bin/" install
	mkdir -p "$pkgdir/usr/share/licenses/merlin-linkage"
	cp LICENSE LICENSE.twister "$pkgdir/usr/share/licenses/merlin-linkage"
}
