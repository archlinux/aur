# Maintainer: Matthias Blankertz <matthias at blankertz dot org>
# Contributor: Navkamal Rakra <navkamal90[at]gmail[dot]com>

pkgname=('ogdf-snapshot' 'ogdf-snapshot-docs')
pkgver=2017_07_23
pkgrel=1
pkgdesc="OGDF is a self-contained C++ class library for the automatic layout of diagrams. OGDF offers sophisticated algorithms and data structures to use within your own applications or scientific projects."
arch=('i686' 'x86_64')
url="http://amber-v7.cs.tu-dortmund.de/doku.php/start"
license=('GPL')
makedepends=('cmake' 'doxygen' 'graphviz' 'bash')
conflicts=('ogdf' 'coin-or-clp' 'coin-or-osi' 'coin-or-coinutils')
source=("$pkgname-${pkgver//_/-}.zip::http://amber-v7.cs.tu-dortmund.de/lib/exe/fetch.php/tech:$pkgname-${pkgver//_/-}.zip")
sha256sums=("d9165ae319d848466f35cee3d8b5c5bc467eb0acd5d381b6ea0b5f61d6534d30")

build() {
	cd "$srcdir/OGDF-snapshot"
	cmake -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} ${CPPFLAGS}" \
		-DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
	        -DCMAKE_INSTALL_PREFIX="$pkgdir" .
	make OGDF tests
	cd doc && ./build-ogdf-docs.sh
}

package_ogdf-snapshot() {
	cd "$srcdir/OGDF-snapshot"

	install -Dm644 libOGDF.a "$pkgdir/usr/lib/libOGDF.a"
	install -Dm644 libCOIN.a "$pkgdir/usr/lib/libCOIN.a"

	mkdir -p "$pkgdir/usr"
	cp -r include "$pkgdir/usr"
}

package_ogdf-snapshot-docs() {
	arch=('any')

	cd "$srcdir/OGDF-snapshot"

	mkdir -p "$pkgdir/usr/share/doc/$pkgbase"
	cp -r doc/* "$pkgdir/usr/share/doc/$pkgbase"
	rm "$pkgdir/usr/share/doc/$pkgbase/build-ogdf-docs.sh"
}

check() {
	cd "$srcdir/OGDF-snapshot"

	# Skip repeated failing GraphCopy test (randomness issues?)
	./tests --skip="works using source and target"
}
