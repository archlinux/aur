# Maintainer: paranoica <mitjumper@gmail.com>
pkgname=rayshot
pkgver=0.1.10
pkgrel=1
pkgdesc="Fast screenshot and annotation tool for Linux (GNOME/Wayland)"
arch=('x86_64')
url="https://github.com/paranoica/rayshot"
license=('MIT')
depends=('pipewire' 'wl-clipboard' 'xdg-desktop-portal' 'vulkan-icd-loader')
optdepends=('xdg-desktop-portal-gnome: GNOME portal backend, daemon and hotkey support'
            'glib2: gsettings, required for automatic GNOME hotkey setup')
makedepends=('cargo' 'clang')
provides=('rayshot')
conflicts=('rayshot-git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f382782963df959d073c2d898b0375dfbd29701bfab7bcdd0b1106d834331743')
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
}
