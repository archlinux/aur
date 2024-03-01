# Contributor: Matthias Blankertz <matthias at blankertz dot org>
# Contributor: Navkamal Rakra <navkamal90[at]gmail[dot]com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: RAMChYLD <ramchyld@gmail.com>

pkgname=('ogdf' 'ogdf-docs')
pkgtreename=elderberry
pkgver=202309
pkgrel=1
pkgdesc="OGDF is a self-contained C++ class library for the automatic layout of diagrams. OGDF offers sophisticated algorithms and data structures to use within your own applications or scientific projects."
arch=('i686' 'x86_64')
url="https://ogdf.uos.de/"
license=('GPL')
makedepends=('cmake' 'doxygen' 'graphviz' 'bash')
source=('https://github.com/ogdf/ogdf/archive/refs/tags/'${pkgtreename}-${pkgver}'.tar.gz')
sha256sums=('3438205d3a6ff69d24c3a6db748d2a5a78688605baf3092456073901a2b623f3')
options=('staticlibs')

build() {
	cd "$srcdir/ogdf-${pkgtreename}-${pkgver}"
	cmake -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} ${CPPFLAGS} -Wno-class-memaccess -Wno-error=restrict -Wno-deprecated-copy -Wno-pessimizing-move -Wno-error=shadow" \
		-DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
		-DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=true \
	        -DCMAKE_INSTALL_PREFIX="$pkgdir" .
	make OGDF
	cd doc && ./build-ogdf-docs.sh
}

package_ogdf() {
	cd "$srcdir/ogdf-${pkgtreename}-${pkgver}"
	conflicts=('ogdf' 'coin-or-clp' 'coin-or-osi' 'coin-or-coinutils')
	provides=('ogdf')
	install -Dm644 libOGDF.a "$pkgdir/usr/lib/libOGDF.a"
	install -Dm644 libCOIN.a "$pkgdir/usr/lib/libCOIN.a"

	mkdir -p "$pkgdir/usr"
	cp -r include "$pkgdir/usr"
}

package_ogdf-docs() {
	arch=('any')

	cd "$srcdir/ogdf-${pkgtreename}-${pkgver}"

	install -d "$pkgdir/usr/share/doc/$pkgbase"
	cp -r doc/* "$pkgdir/usr/share/doc/$pkgbase"
	rm "$pkgdir/usr/share/doc/$pkgbase/build-ogdf-docs.sh"
}

# check() {
# 	cd "$srcdir/ogdf-${pkgtreename}-${pkgver}"

# 	# Skip repeated failing GraphCopy test (randomness issues?)
# 	./tests --skip="works using source and target"
# }
