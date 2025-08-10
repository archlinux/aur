# Contributor: Matthias Blankertz <matthias at blankertz dot org>
# Contributor: Navkamal Rakra <navkamal90[at]gmail[dot]com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: yochananmarqos <mark.wagie@proton.me>
# Maintainer: RAMChYLD <ramchyld@gmail.com>

pkgname=('ogdf' 'ogdf-docs')
pkgtreename=elderberry
pkgver=202309
pkgrel=2
pkgdesc="The Open Graph Drawing Framework/Open Graph algorithms and Data structure Framework."
arch=('i686' 'x86_64')
url="https://ogdf.uos.de/"
license=('LicenseRef-custom AND GPL-2.0-or-later AND GPL-3.0-or-later')
makedepends=('cmake' 'doxygen' 'graphviz' 'bash')
source=('https://github.com/ogdf/ogdf/archive/refs/tags/'${pkgtreename}-${pkgver}'.tar.gz')
sha256sums=('3438205d3a6ff69d24c3a6db748d2a5a78688605baf3092456073901a2b623f3')
options=('staticlibs')

# Updated build and package methods contributed by yochananmarqos

build() {
	CFLAGS+=" -ffat-lto-objects"
	CXXFLAGS+=" -ffat-lto-objects"
	cd "$srcdir"
	cmake -B build -S "$pkgbase-${pkgtreename}-$pkgver" \
	  -DCMAKE_BUILD_TYPE='None' \
	  -DCMAKE_INSTALL_PREFIX='/usr' \
	  -Wno-dev
	cmake --build build
	
	#docs 
	cd "$pkgbase-${pkgtreename}-$pkgver"
	sh "doc/build-$pkgbase-docs.sh"
}

_pick() {
	local p="$1" f d; shift
	for f; do
		d="$srcdir/$p/${f#$pkgdir/}"
		mkdir -p "$(dirname "$d")"
		mv "$f" "$d"
		rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
	done
}

package_ogdf() {
	conflicts=('coin-or-clp' 'coin-or-osi' 'coin-or-coinutils')

	DESTDIR="$pkgdir" cmake --install build

	_pick docs "$pkgdir/usr/share/doc/lib${pkgbase}"

	cd "$pkgbase-${pkgtreename}-$pkgver"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgbase/"
}

package_ogdf-docs() {
	pkgdesc+=" (documentation)"
	depends=()

	mv docs/* "$pkgdir"
}

# check() {
# 	cd "$srcdir/ogdf-${pkgtreename}-${pkgver}"

# 	# Skip repeated failing GraphCopy test (randomness issues?)
# 	./tests --skip="works using source and target"
# }
