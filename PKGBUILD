# Maintainer: Philipp A. <flying-sheep@web.de>
_name=resvg
pkgname=$_name-qt
pkgver=0.13.0
pkgrel=1
pkgdesc='SVG rendering library and CLI (Linked against Qt)'
arch=(i686 x86_64)
url="https://github.com/RazrFalcon/$_name"
license=(MPL2)
provides=(resvg)
conflicts=(resvg)
depends=(qt5-base)
makedepends=(cargo clang qt5-tools cmake extra-cmake-modules)
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f5d4f146909634d664ba3fbbae7ba20d6f2db5c56d1e63056653d6245331d907')

build() {
	cd "$_name-$pkgver"
	for dir in usvg c-api .; do
	(
		msg2 "Building $dir"
		cd "$dir"
		if grep -q cairo-backend Cargo.toml; then
			cargo build --release --features=qt-backend
		else
			cargo build --release
		fi
	)
	done
	(
		msg2 "Building tools/viewsvg"
		cd tools/viewsvg
		qmake PREFIX="$pkgdir/usr"
		make
	)
	
	msg2 'Building docs'
	cargo doc --release --no-deps -p resvg-capi
}

package() {
	cd "$_name-$pkgver"
	
	for tool in resvg usvg; do
		install -Dm755 target/release/$tool "$pkgdir/usr/bin/$tool"
	done
	install -Dm755 tools/viewsvg/viewsvg      "$pkgdir/usr/bin/viewsvg"
	install -Dm755 target/release/libresvg.so "$pkgdir/usr/lib/libresvg.so"
	install -d "$pkgdir/usr/share/doc/resvg"  "$pkgdir/usr/include"
	install -Dm644 c-api/*.h "$pkgdir/usr/include/"
	cp -r target/doc/* "$pkgdir/usr/share/doc/resvg"
}
