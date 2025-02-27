# Maintainer: Tyler Cook <tcc@sandpolis.com>
pkgdesc='Ultimate remote management utility'
pkgname='sandpolis'
pkgver='8.0.0'
pkgrel='1'
arch=('x86_64')
url='https://github.com/fossable/sandpolis'
license=('GNU Affero General Public License v3.0')
makedepends=('cargo' 'pkg-config')
source=("sandpolis-$pkgver.tar.gz::https://static.crates.io/crates/sandpolis/sandpolis-$pkgver.crate")
sha512sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	cargo build --frozen --release --all-features
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
    install -Dm 644 "$startdir/sandpolis-server.service" "$pkgdir/usr/lib/systemd/system/sandpolis.service"
}

