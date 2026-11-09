# Maintainer: paranoica <mitjumper@gmail.com>
pkgname=rayshot
pkgver=0.4.3
pkgrel=1
pkgdesc="Fast screenshot and annotation tool for Linux (GNOME/Wayland)"
arch=('x86_64')
url="https://github.com/paranoica/rayshot"
license=('MIT')
depends=('wl-clipboard' 'xdg-desktop-portal' 'vulkan-icd-loader')
optdepends=('gnome-shell: instant capture and the Print hotkey through the bundled extension'
            'tesseract: copy the text in a selection (Ctrl+Shift+C)'
            'tesseract-data-eng: English text recognition'
            'tesseract-data-rus: Russian text recognition')
makedepends=('cargo' 'glib2')
provides=('rayshot')
conflicts=('rayshot-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6a35e450e43b2160ef0234da24be5b2715534207343328cb410485d8b1d47e5c')
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
