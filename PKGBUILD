

_pkgname=resvg
pkgname=${_pkgname}-git
pkgver=0.40.0.r3.g25fd2503
pkgrel=1
pkgdesc='SVG rendering library and CLI'
arch=(i686 x86_64)
url="https://github.com/RazrFalcon/$_pkgname"
license=(MPL2)
depends=(gdk-pixbuf2)
optdepends=(
	'qt5-base: For the Qt backend'
	'cairo: For the cairo backend'
	'kio5: For the dolphin thumbnailer'
)
makedepends=(cargo qt5-base qt5-tools kio5 cairo pango git cmake extra-cmake-modules)
conflicts=($_pkgname)
provides=($_pkgname)
source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "resvg"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "resvg"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
	mkdir -p tools/kde-dolphin-thumbnailer/build
}

build() {
	cd "resvg"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --workspace --frozen --release --all-features

	(
		cd tools/viewsvg
		qmake PREFIX="$pkgdir/usr"
		make
	)

	(
		cd tools/kde-dolphin-thumbnailer/build
		cmake .. \
			-Wno-dev \
			-DCMAKE_CXX_FLAGS="-L../../../target/release" \
			-DCMAKE_INSTALL_PREFIX="$pkgdir/$(qtpaths --install-prefix)" \
			-DQT_PLUGIN_INSTALL_DIR="$pkgdir/$(qtpaths --plugin-dir)" \
			-DCMAKE_BUILD_TYPE=Release
		make
	)

	cargo doc --release --no-deps -p resvg-capi
}

check() {
	cd "resvg"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "resvg"
	install -Dm755 -t "$pkgdir/usr/bin/" target/release/{resvg,usvg} tools/viewsvg/viewsvg
	make -C tools/kde-dolphin-thumbnailer/build install
	install -Dm755 -t "$pkgdir/usr/lib/" target/release/libresvg.so
	install -Dm644 -t "$pkgdir/usr/include/" crates/c-api/*.h
	install -d "$pkgdir/usr/share/doc/resvg"
	cp -r target/doc/* "$pkgdir/usr/share/doc/resvg"
}
