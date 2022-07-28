# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=mazter-git
_pkgname="${pkgname%-git}"
pkgver=r9.b907627
pkgrel=2
pkgdesc='Mazes in your terminal'
arch=('x86_64')
url='https://github.com/canop/mazter'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('mazter')
conflicts=('mazter')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$_pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$_pkgname"
	cargo build --frozen --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$_pkgname"
	cargo test --frozen --all-features
}

package() {
	cd "$_pkgname"
	install -D "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
