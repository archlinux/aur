# Maintainer: John Troxler <firstname dot lastname at gmail dot com>

pkgname=loot
pkgver=0.14.6
_pkglibver=0.14.10
pkgrel=1
pkgdesc="A load order optimisation tool for the Elder Scrolls (Morrowind and later) and Fallout (3 and later) games."
arch=('x86_64')
url="https://loot.github.io"
license=('GPL3')
depends=('boost-libs' 'http-parser' 'libssh2' 'alsa-lib' 'nss' 'pango' 'atk' 'libxdamage' 'libxcomposite' 'libxcursor' 'libxrandr' 'libxss' 'libxtst')
makedepends=('git' 'cmake' 'rust' 'cbindgen' 'yarn' 'boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
        "lib$pkgname-$_pkglibver.tar.gz::https://github.com/$pkgname/lib$pkgname/archive/$_pkglibver.tar.gz"
        "local://lib$pkgname-$_pkglibver.patch"
        "local://$pkgname-$pkgver.patch")
sha256sums=('04eeedfd99282bcedd23f571f1174aaeac457504c5811e49f7e00c8c9db51908'
            'be8ed5e7555bd3187aeb7f32c2eefdf7e327f070d986842224e03a9447feda22'
            '398a12144bec5405824b870e65b75077fd140ae7a95afd7ca21589e08af82146'
            '41e0ec231caf417f79bd895677b71d27d56af33bced919a34e93474bbde357f8')

prepare() {
	# libloot
	cd "$srcdir/lib$pkgname-$_pkglibver"
	patch -p1 <"$srcdir/lib$pkgname-$_pkglibver.patch"

	# loot
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 <"$srcdir/$pkgname-$pkgver.patch"

	yarn install
}

build() {
	# libloot
	cd "$srcdir/lib$pkgname-$_pkglibver"
	mkdir build
	cd build
	cmake .. -DCMAKE_SKIP_RPATH=TRUE
	make loot

	mkdir pkg
	cp lib$pkgname.so ./pkg/
	cp -r ../include/ ./pkg/
	tar -zcf lib$pkgname-$_pkglibver.tar.gz ./pkg/

	# loot
	cd "$srcdir/$pkgname-$pkgver"
	mkdir build
	cd build
	cmake .. -DLIBLOOT_URL="$srcdir/lib$pkgname-$_pkglibver/build/lib$pkgname-$_pkglibver.tar.gz" -DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE -DCMAKE_INSTALL_RPATH="/opt/$pkgname"
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
		"$_builddir/natives_blob.bin" \
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
