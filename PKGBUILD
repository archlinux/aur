# Maintainer: paranoica <mitjumper@gmail.com>
pkgname=rayshot
pkgver=0.2.0
pkgrel=1
pkgdesc="Fast screenshot and annotation tool for Linux (GNOME/Wayland)"
arch=('x86_64')
url="https://github.com/paranoica/rayshot"
license=('MIT')
depends=('wl-clipboard' 'xdg-desktop-portal' 'vulkan-icd-loader')
optdepends=('gnome-shell: instant capture and the Print hotkey through the bundled extension')
makedepends=('cargo' 'glib2')
provides=('rayshot')
conflicts=('rayshot-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2fbc5cc5846d54f4e41c5de19b7f361466d773de9a7e270e782724ddd1e0b400')
install=rayshot.install

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release --frozen
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/rayshot" "$pkgdir/usr/bin/rayshot"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	local ext="$pkgdir/usr/share/gnome-shell/extensions/rayshot@paranoica"
	install -d "$ext/schemas"
	install -m644 gnome-extension/rayshot@paranoica/*.js gnome-extension/rayshot@paranoica/metadata.json "$ext/"
	install -m644 gnome-extension/rayshot@paranoica/schemas/*.xml "$ext/schemas/"
	glib-compile-schemas "$ext/schemas"
}
