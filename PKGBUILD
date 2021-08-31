# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=rinstall-git
pkgver=r32.fb8348f
pkgrel=1
pkgdesc="Declarative install for programs"
arch=('x86_64')
url="https://git.sr.ht/~danyspin97/rinstall"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	sed -i '/LICENSE/d' install.yml
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	target/release/rinstall --prefix '/usr' --destdir "$pkgdir"
}
