# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=cranko-git
_pkg="${pkgname%-git}"
pkgver=r374.1bf27e5
pkgrel=1
pkgdesc='Cross-platform, cross-language release automation tool'
arch=('x86_64' 'aarch64')
url='https://github.com/pkgw/cranko'
license=('MIT')
depends=('libgit2.so' 'openssl')
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
	cargo build --frozen --release
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$_pkg"
	cargo test --frozen
}

package() {
	cd "$_pkg"
	install -D "target/release/$_pkg" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
