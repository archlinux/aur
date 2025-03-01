# Maintainer: Tyler Cook <tcc@sandpolis.com>
arch=('x86_64')
depends=('fuse3' 'alsa-lib' 'wayland')
license=('GNU Affero General Public License v3.0')
makedepends=('cargo' 'pkg-config')
pkgdesc='Sandpolis all-in-one instance'
pkgname='sandpolis-git'
pkgrel='1'
pkgver='8.0.0'
sha512sums=('SKIP')
source=("git+https://github.com/fossable/sandpolis")
url='https://github.com/fossable/sandpolis'

pkgver() {
	cd "${srcdir}"
	git describe --tags | sed 's/^[^0-9]*//'
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --all-features
	local compgen="target/release/$pkgname --completion"
	$compgen bash >"completions/$pkgname"
	$compgen fish >"completions/$pkgname.fish"
	$compgen zsh >"completions/_$pkgname"
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --all-features
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

