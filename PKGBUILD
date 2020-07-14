# Maintainer: spider-mario <spidermario@free.fr>
pkgname=mtfmapper
pkgver=0.7.29
pkgrel=1
pkgdesc="A utility to produce MTF (modulation transfer function, a measure of edge acuity) maps  of images"
arch=('x86_64')
url="https://sourceforge.net/projects/$pkgname/"
license=('BSD')
depends=('dcraw' 'exiv2' 'gnuplot' 'opencv' 'qt5-charts')
makedepends=('asciidoc' 'eigen' 'tclap' 'subversion')
options=('!makeflags')  # The build process for the documentation is not parallel-safe.
source=("$pkgname::svn+https://svn.code.sf.net/p/$pkgname/code/trunk#revision=632"
        'opencv4.patch')
b2sums=('SKIP'
        '05846e04735f019f12913517181537fd76f1e1144202fd1632844cb7a6324032f141bb980fd2262756933c1e8a4668c4df78183f24bbb069a75a71696e94ff44')

prepare() {
	cd "$pkgname"

	patch -Np1 < "$srcdir"/opencv4.patch

	# Interferes with the system-wide scripts in /usr/lib/cmake/opencv4.
	rm -f cmake_helpers/FindOpenCV.cmake
}

build() {
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$pkgname"
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install

	install -Dm644 "$srcdir/$pkgname"/license.txt "$pkgdir"/usr/share/licenses/"$pkgname"/license.txt
}
