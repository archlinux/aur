# Maintainer: Tyler Cook <tcc@sandpolis.com>
arch=('x86_64')
conflicts=('sandpolis-agent')
install=sandpolis-agent.install
license=('GNU Affero General Public License v3.0')
makedepends=('cargo' 'pkg-config')
pkgdesc='Sandpolis agent instance'
pkgname='sandpolis-agent'
pkgrel='1'
pkgver='8.0.0'
provides=('sandpolis-agent')
sha512sums=('SKIP')
source=("sandpolis-$pkgver.tar.gz::https://static.crates.io/crates/sandpolis/sandpolis-$pkgver.crate")
url='https://github.com/fossable/sandpolis'

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --features agent
	local compgen="target/release/$pkgname --completion"
	$compgen bash >"completions/$pkgname"
	$compgen fish >"completions/$pkgname.fish"
	$compgen zsh >"completions/_$pkgname"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 644 "completions/$pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
	install -Dm 644 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	install -Dm 644 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
