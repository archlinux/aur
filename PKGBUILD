# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=percolator-git
pkgver=2.10.r1.gd92d600
pkgrel=1
pkgdesc="Software for postprocessing of shotgun proteomics data + format converters + Elude tool"
url="http://per-colator.com/"
license=('Apache')
depends=('tokyocabinet' 'xerces-c' 'sqlite')
arch=('x86_64' 'i686')
makedepends=('git' 'xsd' 'cmake' 'boost' 'zlib' )
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('source::git+https://github.com/percolator/percolator'
		'percolator.patch')
md5sums=('SKIP'
		 '4e1432640f09fa3dc2f3d9894ec380f4')

pkgver() {
	cd "${srcdir}/source"
    git describe --match='rel*' --tags | sed 's/\([^-]*-g\)/r\1/;s/rel-//;s/-/./g'
}

prepare() {
	cd "${srcdir}/source"
	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$BUILDDIR"
	mkdir percolator converters elude
	cd percolator
	echo "------------------------"
	echo "Building percolator ..."
	echo "------------------------"
	cmake "${srcdir}/source"
	make
	echo "------------------------"
	echo "Building converters ..."
	echo "------------------------"
	cd ../converters
	cmake -DSERIALIZE="TokyoCabinet" "${srcdir}/source/src/converters"
	make
	echo "------------------------"
	echo "Building Elude ..."
	echo "------------------------"
	cd ../elude
	cmake "${srcdir}/source/src/elude_tool"
	make
}

package() {
	cd "$BUILDDIR/percolator"
	make DESTDIR="$pkgdir/" install
	cd "$BUILDDIR/converters"
	make DESTDIR="$pkgdir/" install
	cd "$BUILDDIR/elude"
	make DESTDIR="$pkgdir/" install
	install -D "${srcdir}/source/license.txt" "${pkgdir}/usr/share/licenses/percolator/license.txt"
	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/share/${pkgname%-git}"
	mv "$pkgdir"/usr/local/share/* "$pkgdir/usr/share/${pkgname%-git}"
	mv "$pkgdir"/usr/local/bin/* "$pkgdir/usr/bin"
	rm -r "$pkgdir/usr/local"
}
