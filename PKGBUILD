# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Kabakov Grigoriy <g.kabakov@inbox.ru>

pkgname=graphite-editor-git
_pkgname=Graphite
pkgver=r2430.d6c06da
pkgrel=1
pkgdesc='raster & vector editor with a modern node-based, non-destructive, procedural workflow'
arch=(x86_64)
url="https://github.com/GraphiteEditor/$_pkgname"
license=(Apache-2.0)
depends=(alsa-lib
         at-spi2-core
         libcups
         libxcomposite
         libxdamage
         libxkbcommon
         libxrandr
         mesa
         nss
         pango)
makedepends=(cargo-about
             git
             npm
             rustup
             wasm-pack)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

_cef_path="/usr/lib/$pkgname"
# toolchain is hard coded in pinned Git dependency, a stable one can be used to
# build some parts of the system, but that just results in multiple toolchains
# being downloaded and mix-'n-matched in the build
_toolchain='nightly-2025-06-23'

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN="$_toolchain"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
	pushd frontend
	npm run setup
}

pkgver() {
	cd "$pkgname"
	printf 'r%s.%s' \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN="$_toolchain"
	unset CARGO_TARGET_DIR
	(
		pushd frontend
		RUSTFLAGS+=" -C target-feature=+bulk-memory"
		RUSTFLAGS+=" -C link-arg=--max-memory=4294967296"
		RUSTFLAGS+=" --cfg=web_sys_unstable_apis"
		npm run build-native
	)
	CFLAGS+=' -ffat-lto-objects'
	CXXFLAGS+=' -fno-lto'
	RUSTFLAGS+=" -C link-arg=-Wl,-rpath=$_cef_path"
	cargo build --release --frozen --package graphene-cli --package graphite-desktop
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/{graphene-cli,graphite}
	install -d "$pkgdir$_cef_path"
	cp -a target/release/build/cef-dll-sys-*/out/cef_linux_x86_64/. "$pkgdir$_cef_path"
	install -Dm644 -t "$pkgdir/usr/share/applications/" desktop/assets/art.graphite.Graphite.desktop
	install -Dm644 -t "$pkgdir/usr/share/pixmaps/" branding/app-icons/graphite.{png,svg}
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
