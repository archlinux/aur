# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Co-Maintainer: Sondre Nilsen <echo "bmlsc2VuLnNvbmRyZUBnbWFpbC5jb20K" | base64 -d>

pkgname=git-ignore
pkgver=1.3.1
pkgrel=1
pkgdesc="Quickly and easily list and fetch .gitignore templates from gitignore.io"
arch=('x86_64')
url="https://github.com/sondr3/git-ignore"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6a8813ddda4758e4cb8d8b0333e2c05e65d0205617811d8760f481a61366c2b0')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgver"
	cargo build --release --frozen --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 "target/assets/git-ignore.1" "$pkgdir/usr/share/man/man1/git-ignore.1"
	install -Dm644 "target/assets/git-ignore.bash" "$pkgdir/usr/share/bash-completion/completions/git-ignore"
	install -Dm644 "target/assets/git-ignore.fish" "$pkgdir/usr/share/fish/vendor_completions.d/git-ignore.fish"
	install -Dm644 "target/assets/_git-ignore" "$pkgdir/usr/share/zsh/site-functions/_git-ignore"
}
