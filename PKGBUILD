# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=sniprun
pkgname=('sniprun' 'neovim-sniprun')
pkgver=1.3.22
pkgrel=1
pkgdesc='A neovim plugin to run lines/blocs of code (independently of the rest of the file), supporting multiples languages'
arch=('x86_64')
url="https://github.com/michaelb/sniprun"
license=('MIT')
makedepends=('cargo' 'libgcc')
options=(!lto)
changelog=CHANGELOG.md
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e35fc9ae482dc198b8bde084cd0beab7fd1a6838a8cdcb6d3533f43e4ab4a53')

prepare() {
	cd "$pkgbase-$pkgver"
	# cargo update
	cargo fetch --locked --target host-tuple
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgbase-$pkgver"
	cargo build --release --frozen --all-features
}

# check() {
# 	export RUSTUP_TOOLCHAIN=stable
# 	cd "$pkgname-$pkgver"
# 	cargo test --frozen --all-features
# }

package_sniprun() {
	pkgdesc='Compiled binary core for neovim-sniprun'
	depends=('libgcc')
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
		'gcc-ada: Limited Ada snippets support'
		'gcc: C/C++ snippets support'
		'ghc: Haskell snippets support'
		'go: Go snippets support'
		'java-environment-openjdk: Java snippets support'
		'julia: Julia snippets support'
		'jupyter: Jupyter support'
		'lua: Lua snippets support'
		'python3: Python3 snippets support'
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
