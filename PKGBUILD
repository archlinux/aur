# Maintainer: yuioto <yuiotochan@outlook.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Shunsuke Shibayama <sbym1346@gmail.com>

pkgname=erg-git
_pkg="${pkgname%-git}"
pkgver=0.6.5.r34.g448fe4e6
pkgrel=1
pkgdesc='Statically typed language that builds upon the Python ecosystem'
url="https://github.com/erg-lang/erg"
license=('MIT' 'Apache')
arch=('x86_64')
provides=("$_pkg")
conflicts=("$_pkg" "$_pkg-bin")
depends=('python')
makedepends=('cargo' 'git')

source=("$_pkg::git+$url.git")
sha256sums=("SKIP")

# By enabling the --features flag, you can change the language in which error messages are displayed.
#
# Japanese
# cargo install erg --features japanese
#
# Chinese (Simplified)
# cargo install erg --features simplified_chinese
#
# Chinese (Traditional)
# cargo install erg --features traditional_chinese
#
# Debugging mode (for contributors)
# cargo install erg --features debug

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$_pkg"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$_pkg"
	cargo build --release --frozen
}

# check() {
	# Unable to compile in the case of check.
# 	export RUSTUP_TOOLCHAIN=stable
# 	cd "$_pkg"
# 	cargo test --frozen
# }

package() {
	cd "$_pkg"
	install -Dm755 "target/release/$_pkg" -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README{,_zh-CN,_zh-TW,_JA}.md -t "$pkgdir/usr/share/doc/$pkgname"
}
