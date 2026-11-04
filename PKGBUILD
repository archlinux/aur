# Maintainer: paranoica <mitjumper@gmail.com>
pkgname=rayshot-git
_srcname=rayshot
pkgver=0.2.0.r0.ga2fd7db
pkgrel=1
pkgdesc="Fast screenshot and annotation tool for Linux (GNOME/Wayland)"
arch=('x86_64')
url="https://github.com/paranoica/rayshot"
license=('MIT')
depends=('wl-clipboard' 'xdg-desktop-portal' 'vulkan-icd-loader')
optdepends=('gnome-shell: instant capture and the Print hotkey through the bundled extension')
makedepends=('cargo' 'glib2' 'git')
provides=('rayshot')
conflicts=('rayshot')
source=("$_srcname::git+https://github.com/paranoica/rayshot.git")
sha256sums=('SKIP')
install=rayshot.install

pkgver() {
	cd "$srcdir/$_srcname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_srcname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_srcname"
	cargo build --release --frozen
}

package() {
	cd "$srcdir/$_srcname"
	install -Dm755 "target/release/rayshot" "$pkgdir/usr/bin/rayshot"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	local ext="$pkgdir/usr/share/gnome-shell/extensions/rayshot@paranoica"
	install -d "$ext/schemas"
	install -m644 gnome-extension/rayshot@paranoica/*.js gnome-extension/rayshot@paranoica/metadata.json "$ext/"
	install -m644 gnome-extension/rayshot@paranoica/schemas/*.xml "$ext/schemas/"
	glib-compile-schemas "$ext/schemas"
}
