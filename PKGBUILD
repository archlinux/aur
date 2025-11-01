# Contributor: Matthias Blankertz <matthias at blankertz dot org>
# Contributor: Navkamal Rakra <navkamal90[at]gmail[dot]com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: yochananmarqos <mark.wagie@proton.me>
# Maintainer: RAMChYLD <ramchyld@gmail.com>

pkgname=('ogdf' 'ogdf-docs')
pkgtreename=foxglove
pkgver=202510
pkgrel=3
pkgdesc="The Open Graph Drawing Framework/Open Graph algorithms and Data structure Framework."
arch=('i686' 'x86_64')
url="https://ogdf.uos.de/"
license=('LicenseRef-custom AND GPL-2.0-or-later AND GPL-3.0-or-later')
makedepends=('cmake' 'doxygen' 'graphviz' 'bash')
source=('https://github.com/ogdf/ogdf/archive/refs/tags/'${pkgtreename}-${pkgver}'.tar.gz')
sha256sums=('e0496c2ac53f5bef3639ebac0f6110323bdd938b7d29ea5da79aced4a28f99b5')
# options=('staticlibs')

# Updated build and package methods contributed by yochananmarqos

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgbase-${pkgtreename}-$pkgver" \
	  -DCMAKE_BUILD_TYPE='None' \
	  -DCMAKE_INSTALL_PREFIX='/usr' \
          -DBUILD_SHARED_LIBS='ON' \
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
