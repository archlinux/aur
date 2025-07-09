# Maintainer: Caleb Maclennan <caleb@alerque.com>

# The GUI app runs but is not connected to the web backend. The web backend is
# built here and can be accessed, but is meant to be linked into the desktotp
# app not used in a browser. That is apparently blocked on a Tauri bug, so this
# whole thing is known-broken upstream.
# https://github.com/GraphiteEditor/Graphite/issues/584#issuecomment-2027796397

pkgname=graphite-editor-git
_pkgname=Graphite
pkgver=r2086.e025103
pkgrel=1
pkgdesc='2D raster & vector editor that melds traditional layers & tools with a modern node-based, non-destructive, procedural workflow'
arch=(x86_64)
url="https://github.com/GraphiteEditor/$_pkgname"
license=(Apache-2.0)
depends=(gcc-libs
         glibc
         gtk3
         openssl)
makedepends=(binaryen
             cargo
             cargo-about
             cargo-tauri
             git
             libappimage
             libsoup
             nodejs
             npm
             rust-wasm
             wasm-bindgen
             wasm-pack
             webkit2gtk-4.1)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	pushd frontend
	npm install
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short=7 HEAD)"
}

_srcenv() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	unset CARGO_TARGET_DIR
	CFLAGS+=' -ffat-lto-objects'
	RUSTFLAGS+=' --cfg=web_sys_unstable_apis'
}

build() {
	_srcenv
	pushd frontend
	npm run tauri:build
	popd
	cargo build --release --frozen
	# cargo tauri build -b appimage ||:
}

check() {
	_srcenv
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/graphene-cli
	install -Dm0755 -t "$pkgdir/usr/lib/" target/release/libgraphite_wasm.so
	# install -Dm0755 -t "$pkgdir/usr/bin/" target/release/graphite-{cli,desktop}
}
