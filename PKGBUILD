# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=teracli-git
_pkgname=tera-cli
__pkgname=teracli
pkgver=0.2.4.r8.gdf68f74
pkgrel=1
pkgdesc='A utility on top of the tera templating engine, takes json|yaml|toml|ENV as input'
arch=(x86_64)
url="https://github.com/chevdor/$_pkgname"
_url="https://github.com/alerque/$__pkgname"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo
             git)
provides=("$__pkgname=$pkgver")
conflicts=($_pkgname $__pkgname) # different project
source=("git+$_url.git#branch=fluent")
sha256sums=('SKIP')

prepare() {
	cd "$__pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$__pkgname"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$__pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$__pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$__pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tera"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
