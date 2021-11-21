# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=git-ignore
pkgver=1.1.2
pkgrel=3
pkgdesc="Quickly and easily list and fetch .gitignore templates from gitignore.io"
arch=('x86_64')
url="https://github.com/sondr3/git-ignore"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo' 'git')
changelog=CHANGELOG.md
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('7BCDD2AFEDB1B62C2B6E999EAC00E2AC485EF38D')

prepare() {
	cd "$pkgname"
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
	cargo test --release --frozen --all-features
}

package() {
	cd "$pkgname"
	install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm 644 "target/assets/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
