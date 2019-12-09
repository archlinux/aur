# Maintainer: Philipp A. <flying-sheep@web.de>
_name=resvg
pkgname=$_name-qt
pkgver=0.8.0
pkgrel=1
pkgdesc='SVG rendering library and CLI (Linked against Qt)'
arch=(i686 x86_64)
url="https://github.com/RazrFalcon/$_name"
license=(MPL2)
provides=(resvg)
conflicts=(resvg)
depends=(gdk-pixbuf2 qt5-base)
makedepends=(cargo qt5-tools cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f204d4c49622d5bf5467e04ec16cd9e67cab957ea3d44a499915675cc1196bc3')

build() {
	cd "$_name-$pkgver"
	for dir in capi tools/{render,u}svg; do
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
	
	for tool in {render,u}svg; do
		install -Dm755 target/release/$tool "$pkgdir/usr/bin/$tool"
	done
	install -Dm755 tools/viewsvg/viewsvg      "$pkgdir/usr/bin/viewsvg"
	install -Dm755 target/release/libresvg.so "$pkgdir/usr/lib/libresvg.so"
	install -Dm644 capi/include/resvg.h       "$pkgdir/usr/include/resvg.h"
	install -d "$pkgdir/usr/share/doc/resvg"
	cp -r target/doc/* "$pkgdir/usr/share/doc/resvg"
}
