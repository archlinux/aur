# Maintainer: Lucia Selvlysende <luciaselvlysende at inventati dot org>

pkgname="larch-greet-git"
pkgver=r12.24499e0
pkgrel=1
pkgdesc='A tiny session manager written in Rust'
url='https://codeberg.org/lucia-selvlysende/larch-greet'
license=('GPL-3.0-or-later')
source=("$pkgname::git+$url")
sha512sums=('SKIP')
arch=('aarch64' 'i686' 'x86_64')
makedepends=('cargo' 'git')
options=('!debug')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$pkgname"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen
}

package() {
	install -Dm755 "$pkgname/target/release/larch-greet" -t "$pkgdir/usr/bin"
}

