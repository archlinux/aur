# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Co-Maintainer: Sondre Nilsen <echo "bmlsc2VuLnNvbmRyZUBnbWFpbC5jb20K" | base64 -d>

pkgname=git-ignore
pkgver=1.2.0
pkgrel=0
pkgdesc="Quickly and easily list and fetch .gitignore templates from gitignore.io"
arch=('x86_64')
url="https://github.com/sondr3/git-ignore"
license=('GPL3')
conflics=('git-ignore-bin')
depends=('gcc-libs')
makedepends=('cargo' 'git')
changelog=CHANGELOG.md
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('SKIP')

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

	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm 644 "assets/git-ignore.1" "$pkgdir/usr/share/man/man1/git-ignore.1"
  install -Dm 644 "assets/git-ignore.bash" "$pkgdir/usr/share/bash-completion/completions/git-ignore"
  install -Dm 644 "assets/git-ignore.fish" "$pkgdir/usr/share/fish/vendor_completions.d/git-ignore.fish"
  install -Dm 644 "assets/_git-ignore" "$pkgdir/usr/share/zsh/site-functions/_git-ignore"
}
