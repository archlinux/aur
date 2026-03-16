# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint
pkgver=0.53.0
pkgrel=1
pkgdesc='Pluggable and configurable code formatting platform'
arch=('x86_64')
url='https://github.com/dprint/dprint'
license=('MIT')
depends=('bzip2')
provides=('dprint')
conflicts=('dprint-bin')
makedepends=('cargo')
options=('!lto') ## interferes with compiling
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('612f987dcada5caea4335a03f986de245093622ce5c1e19b490b0e5fd13fb908')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUST_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgver"
	cargo build --release --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"

    # generate shell completions
    install -d "$pkgdir/usr/share/bash-completion/completions/" \
               "$pkgdir/usr/share/elvish/lib/" \
               "$pkgdir/usr/share/fish/vendor_completions.d/" \
               "$pkgdir/usr/share/zsh/site-functions/"
    ./target/release/dprint completions bash > "$pkgdir/usr/share/bash-completion/completions/dprint"
    ./target/release/dprint completions elvish > "$pkgdir/usr/share/elvish/lib/dprint.elv"
    ./target/release/dprint completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/dprint.fish"
    ./target/release/dprint completions zsh > "$pkgdir/usr/share/zsh/site-functions/_dprint"

	install -Dv target/release/dprint -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md docs/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
