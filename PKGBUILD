# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Kabakov Grigoriy <g.kabakov@inbox.ru>

pkgname=graphite-editor-git
_pkgname=Graphite
pkgver=r2429.532dc30
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
_cef_path="/usr/lib/$pkgname"

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
	pushd frontend
	npm run setup
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
	CXXFLAGS+=" -fno-lto"
	RUSTFLAGS+=' --cfg=web_sys_unstable_apis'
	RUSTFLAGS+=" -C link-arg=-Wl,-rpath=$_cef_path"
}

build() {
	_srcenv
	pushd frontend
	npm run build-native
	popd
	cargo build --release --frozen --package graphene-cli --package graphite-desktop
}

check() {
	_srcenv
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/{graphene-cli,graphite}
	install -d "$pkgdir$_cef_path"
	cp -a target/release/build/cef-dll-sys-*/out/cef_linux_x86_64/. "$pkgdir$_cef_path"
}
