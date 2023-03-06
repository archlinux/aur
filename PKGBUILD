# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tomlq-git
_pkg="${pkgname%-git}"
pkgver=r5.66b1ee6
pkgrel=1
pkgdesc='Tool for getting data from TOML files'
arch=('x86_64')
url='https://github.com/jamesmunns/tomlq'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("$_pkg")
conflicts=("$_pkg")
options=('!lto')
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkg"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkg"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$_pkg"
	cargo build --frozen --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$_pkg"
	cargo test --frozen --all-features
}

package() {
	cd "$_pkg"
	install -Dv "target/release/$_pkg" -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
