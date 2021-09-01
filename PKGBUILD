# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Credit: desbma

pkgname=zoxide-git
pkgver=0.7.4.r9.g9ff8993
pkgrel=1
pkgdesc='A fast cd command that learns your habits'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/ajeetdsouza/zoxide"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver()  {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
}

package() {
	cd "$pkgname"
	install -Dm 755 -t "$pkgdir/usr/bin" target/release/zoxide
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 man/*.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm 644 contrib/completions/zoxide.bash "$pkgdir/usr/share/bash-completion/completions/zoxide"
	install -Dm 644 contrib/completions/_zoxide -t "$pkgdir/usr/share/zsh/site-completions/"
	install -Dm 644 contrib/completions/zoxide.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}
