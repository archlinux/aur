# Contributor: Matthias Blankertz <matthias at blankertz dot org>
# Contributor: Navkamal Rakra <navkamal90[at]gmail[dot]com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=('ogdf' 'ogdf-docs')
pkgver=2022_02
pkgrel=1
pkgdesc="OGDF is a self-contained C++ class library for the automatic layout of diagrams. OGDF offers sophisticated algorithms and data structures to use within your own applications or scientific projects."
arch=('i686' 'x86_64')
url="https://ogdf.uos.de/"
license=('GPL')
makedepends=('cmake' 'doxygen' 'graphviz' 'bash')
source=("$pkgname-${pkgver//_/-}.zip::https://ogdf.uos.de/wp-content/uploads/${pkgver//_/\/}/$pkgname.v${pkgver//_/.}.zip")
sha256sums=('5234b41dd8f52f5dda537794ecb26ccfeb928d8520e0c48e0f84bbc75f4b6c1e')
options=('staticlibs')

build() {
	cd "$srcdir/OGDF"
	cmake -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} ${CPPFLAGS} -Wno-class-memaccess -Wno-error=restrict -Wno-deprecated-copy -Wno-pessimizing-move -Wno-error=shadow" \
		-DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
		-DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=true \
	        -DCMAKE_INSTALL_PREFIX="$pkgdir" .
	make OGDF
	cd doc && ./build-ogdf-docs.sh
}

package_ogdf() {
	cd "$srcdir/OGDF"
	conflicts=('ogdf' 'coin-or-clp' 'coin-or-osi' 'coin-or-coinutils')
	provides=('ogdf')
	install -Dm644 libOGDF.a "$pkgdir/usr/lib/libOGDF.a"
	install -Dm644 libCOIN.a "$pkgdir/usr/lib/libCOIN.a"

	mkdir -p "$pkgdir/usr"
	cp -r include "$pkgdir/usr"
}

package_ogdf-docs() {
	arch=('any')

	cd "$srcdir/OGDF"

	install -d "$pkgdir/usr/share/doc/$pkgbase"
	cp -r doc/* "$pkgdir/usr/share/doc/$pkgbase"
	rm "$pkgdir/usr/share/doc/$pkgbase/build-ogdf-docs.sh"
}

# check() {
# 	cd "$srcdir/OGDF"

# 	# Skip repeated failing GraphCopy test (randomness issues?)
# 	./tests --skip="works using source and target"
# }
