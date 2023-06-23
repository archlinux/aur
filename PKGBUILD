# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=teracli-git
_pkgname=tera-cli # upstream repo a name conflict with a different project on crates.io
__pkgname=teracli
pkgver=0.2.4.r5.gdc9d4fd
pkgrel=1
pkgdesc='A utility on top of the tera templating engine, takes json|yaml|toml|ENV as input'
arch=(x86_64)
url="https://github.com/chevdor/$_pkgname"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo
             git)
provides=("$__pkgname=$pkgver")
conflicts=($_pkgname $__pkgname)
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$_pkgname"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tera"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
