# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kibouo <csonka.mihaly@hotmail.com>

pkgname=navi-git
pkgver=2.17.0.r10.g5860498
pkgrel=1
pkgdesc='An interactive cheatsheet tool for the command-line.'
arch=('x86_64')
url='https://github.com/denisidoro/navi'
license=('Apache')
depends=('fzf')
optdepends=(
	'bash-completion'
	'skim: drop-in replacement for fzf')
makedepends=('cargo' 'git')
provides=('navi')
conflicts=('navi')
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
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
	cargo build --release --frozen --all-features
	cd target/release
	./navi widget bash > "$srcdir/navi.bash"
	./navi widget zsh > "$srcdir/_navi"
	./navi widget fish > "$srcdir/navi.fish"
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname"
	cargo test --frozen --all-features
}

package() {
	install -Dm 644 navi.bash "$pkgdir/usr/share/bash-completion/completions/navi"
	install -Dm 644 _navi -t "$pkgdir/usr/share/zsh/site-functions/"
	install -Dm 644 navi.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	cd "$pkgname"
	install -Dm 755 target/release/navi -t "$pkgdir/usr/bin"
	find docs -type f -exec install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" '{}' \;
}
