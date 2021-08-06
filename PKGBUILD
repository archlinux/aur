# Maintainer: Caleb Maclennan <caleb@aleque.com>
# Contributor: Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>

pkgname=xi-term-git
pkgver=0.0.0.r232.gd264767
pkgrel=2
pkgdesc='A terminal frontend for the Xi editor'
arch=(x86_64)
url="https://github.com/xi-frontend/${pkgname%-git}"
license=(MIT)
depends=(xi-core)
makedepends=(cargo
             git)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$pkgname"
	git tag | grep -Fq 'v0.0.0' || git tag 'v0.0.0' a14eb46
	git describe --long --tags --abbrev=7 --match='v[0-9]*' |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
}
