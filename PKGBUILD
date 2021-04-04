# Maintainer: John Troxler <firstname dot lastname at gmail dot com>

pkgname=loot
# Remove spotify hax on next version bump!
pkgver=0.16.0
_pkglibver=0.16.2
pkgrel=1
pkgdesc="A load order optimisation tool for the Elder Scrolls (Morrowind and later) and Fallout (3 and later) games."
arch=('x86_64')
url="https://loot.github.io"
license=('GPL3')
depends=('boost-libs' 'http-parser' 'libssh2' 'alsa-lib' 'nss' 'pango' 'atk' 'libxdamage' 'libxcomposite' 'libxcursor' 'libxrandr' 'libxss' 'libxtst')
makedepends=('git' 'cmake' 'rust' 'cbindgen' 'yarn' 'boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
        "lib$pkgname-$_pkglibver.tar.gz::https://github.com/$pkgname/lib$pkgname/archive/$_pkglibver.tar.gz"
)
sha256sums=('b501d73e9bc00e86dc6d14b8c5f5b96effaa7c7dca654e1768c6eabdd36b887d'
            '13d815ab3aaf90c58135932d7fa5f40e44c190ab63e756f0a953ee44800ed197'
)

#prepare() {
#	yarn install
#}

build() {
	# libloot
	cd "$srcdir/lib$pkgname-$_pkglibver"
	yarn install
	mkdir -p build
	cd build
	cmake .. -DCMAKE_SKIP_RPATH=TRUE
	make loot

	mkdir -p pkg
	cp lib$pkgname.so ./pkg/
	cp -r ../include/ ./pkg/
	tar -zcf lib$pkgname-$_pkglibver.tar.gz ./pkg/

	# loot
	cd "$srcdir/$pkgname-$pkgver"
	yarn install
	# Spotify Hax because of domain change
	sed -i s,opensource.spotify.com/cefbuilds,cef-builds.spotifycdn.com,g CMakeLists.txt
	mkdir -p build
	cd build
	cmake .. -DLIBLOOT_URL="$srcdir/lib$pkgname-$_pkglibver/build/lib$pkgname-$_pkglibver.tar.gz" \
		-DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE -DCMAKE_INSTALL_RPATH="/opt/$pkgname"
	make LOOT
}

package() {
	_builddir="$srcdir/$pkgname-$pkgver/build"

	install -Dm755 -t "$pkgdir/opt/$pkgname" \
		"$_builddir/LOOT" \
		"$_builddir/lib$pkgname.so" \
		"$_builddir/libcef.so"

	install -Dm644 -t "$pkgdir/opt/$pkgname" \
		"$_builddir/icudtl.dat" \
		"$_builddir/external/src/cef/Resources/cef_extensions.pak" \
		"$_builddir/snapshot_blob.bin" \
		"$_builddir/v8_context_snapshot.bin" \
		"$_builddir/cef.pak" \
		"$_builddir/cef_100_percent.pak" \
		"$_builddir/cef_200_percent.pak"

	install -Dm644 -t "$pkgdir/opt/$pkgname/resources/l10n" \
		"$_builddir/external/src/cef/Resources/locales"/*.pak

	cp -r "$_builddir/resources/ui" "$pkgdir/opt/$pkgname/resources/"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/LOOT" "$pkgdir/usr/bin"
}
