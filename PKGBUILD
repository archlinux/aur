# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgdesc='a description language for modeling parameterizable geometric objects'
pkgname=microcad
pkgver=0.2.16
pkgrel=2
url="https://codeberg.org/$pkgname/$pkgname"
arch=(x86_64)
license=(AGPL-3.0-or-later)
depends=(gcc-libs
         glibc
         manifold)
makedepends=(cargo
             cmake
             git
             ninja)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e7379f21883c8c9fdefd1eb4b31a15570f1470de304b58b35a3010349ced5194')

prepare() {
	cd "$pkgname"
	cargo update
	cargo fetch --locked --target "$(rustc --print host-tuple)"
	sed -i -e '/tests/d' Cargo.toml
}

_srcenv() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# https://github.com/WilstonOreo/manifold-rs/issues/7
	export MANIFOLD_USE_BUILTIN_CLIPPER2=ON
	RUSTFLAGS+=' -L native=/usr/lib'
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	cargo test --frozen --release
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
