_pkgname=resvg
pkgname=${_pkgname}-git
pkgver=0.9.0.r11.ge207cc3
pkgrel=1
pkgdesc='SVG rendering library and CLI'
arch=(i686 x86_64)
url="https://github.com/RazrFalcon/$_pkgname"
license=(MPL2)
depends=(gdk-pixbuf2)
optdepends=(
	'qt5-base: For the Qt backend'
	'cairo: For the cairo backend'
	'kio: For the dolphin thumbnailer'
)
makedepends=(cargo qt5-base qt5-tools kio cairo pango git cmake extra-cmake-modules)
conflicts=($_pkgname)
provides=($_pkgname)
source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "${srcdir}/${_pkgname}"
	for dir in capi tools/{render,u}svg; do
	(
		msg2 "Building $dir"
		cd "$dir"
		if grep -q cairo-backend Cargo.toml; then
			cargo build --release --features='qt-backend cairo-backend'
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
	(
		msg2 "Building tools/kde-dolphin-thumbnailer"
		cd tools/kde-dolphin-thumbnailer
		mkdir -p build
		cd build
		cmake .. \
			-DCMAKE_CXX_FLAGS="-L../../../target/release" \
			-DCMAKE_INSTALL_PREFIX="$pkgdir/$(qtpaths --install-prefix)" \
			-DQT_PLUGIN_INSTALL_DIR="$pkgdir/$(qtpaths --plugin-dir)" \
			-DCMAKE_BUILD_TYPE=Release
		make
	)
	
	msg2 'Building docs'
	cargo doc --release --no-deps -p resvg-capi
}

package() {
	cd "${srcdir}/${_pkgname}"
	
	for tool in {render,u}svg; do
		install -Dm755 target/release/$tool "$pkgdir/usr/bin/$tool"
	done
	install -Dm755 tools/viewsvg/viewsvg "$pkgdir/usr/bin/viewsvg"
	(
		cd tools/kde-dolphin-thumbnailer/build
		make install
	)
	install -Dm755 target/release/libresvg.so "$pkgdir/usr/lib/libresvg.so"
	install -Dm644 capi/include/resvg.h       "$pkgdir/usr/include/resvg.h"
	install -d "$pkgdir/usr/share/doc/resvg"
	cp -r target/doc/* "$pkgdir/usr/share/doc/resvg"
}
