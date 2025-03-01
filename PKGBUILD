# Maintainer: Tyler Cook <aur@fossable.org>
pkgdesc='Immutable infrastructure for the desktop!'
pkgname='goldboot'
pkgver='0.0.2'
pkgrel='1'
url='https://github.com/fossable/goldboot'
arch=('x86_64')
license=('GNU Affero General Public License v3.0')
depends=('edk2-ovmf' 'qemu-base' 'qemu-ui-gtk' 'zstd' 'gtk4')
makedepends=('cargo' 'pkg-config')
source=("goldboot-$pkgver.tar.gz::https://static.crates.io/crates/goldboot/goldboot-$pkgver.crate")
sha512sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
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
