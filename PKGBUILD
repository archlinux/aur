# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=sniprun
pkgname=('sniprun' 'neovim-sniprun')
pkgver=1.2.6
pkgrel=1
pkgdesc='Independently run snippets of code'
arch=('x86_64')
url="https://github.com/michaelb/sniprun"
license=('MIT')
makedepends=('cargo' 'gcc-libs')
changelog=CHANGELOG.md
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0269e4e467a070c918aca6b96dabd11886484078ece3c4a9ed9dd816d47963c8')

prepare() {
	cd "$pkgbase-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgbase-$pkgver"
	cargo build --release --frozen --all-features
}

# check() {
#		cd "$pkgname-$pkgver"
#		cargo test --release --locked --target-dir=target
# }

package_sniprun() {
	pkgdesc='Compiled binary core for neovim-sniprun'
	depends=('gcc-libs')
	replaces=('sniprun-legacy')

	cd "$pkgbase-$pkgver"
	install -D target/release/sniprun -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-sniprun() {
	arch=('any')
	depends=('neovim' "sniprun=$pkgver")
	replaces=('neovim-sniprun-legacy')
	optdepends=(
		'bash: Bash snippets support'
		'coffeescript: CoffeeScript snippets support'
		'gcc: C/C++ snippets support'
		'gcc-ada: Limited Ada snippets support'
		'go: Go snippets support'
		'ghc: Haskell snippets support'
		'python3: Python3 snippets support'
		'java-environment-openjdk: Java snippets support'
		'julia: Julia snippets support'
		'jupyter: Jupyter support'
		'lua: Lua snippets support'
		'r: R snippets support'
		'ruby: Ruby snippets support'
		'rust: Rust snippets support'
		'scala: Scala snippets support')
	install="$pkgname.install"

	cd "$pkgbase-$pkgver"
	find autoload doc plugin lua \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -d "$pkgdir/usr/share/nvim/runtime/target/release"
	ln -s "/usr/bin/sniprun" "$pkgdir/usr/share/nvim/runtime/target/release/sniprun"
	install -d "$pkgdir/usr/share/licenses/" "$pkgdir/usr/share/doc/"
	ln -s "/usr/share/licenses/sniprun/" "$pkgdir/usr/share/licenses/$pkgname"
	ln -s "/usr/share/doc/sniprun/" "$pkgdir/usr/share/doc/$pkgname"
}
