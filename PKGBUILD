# Maintainer: maxischmaxi <max@jeschek.dev>
#
# Stable, versioned package built from a GitHub release tag. pkgver and
# sha256sums are set automatically by the release CI (.github/workflows/
# release.yml) from the pushed tag — the committed placeholders below are only
# for local/manual builds.

pkgname=vibepaper
pkgver=0.2.0
pkgrel=1
pkgdesc="Wayland wallpaper daemon that generates and refines wallpapers via OpenAI, Gemini, Stability and other image APIs"
arch=('x86_64')
url="https://github.com/maxischmaxi/vibepaper"
license=('MIT')
# wayland+wayland-protocols → wlr backend; libxcb → x11 backend;
# glib2 → gnome backend (GSettings); dbus → kde backend. Build all four by
# default (Makefile BACKENDS); the daemon picks one at runtime.
depends=('wayland' 'curl' 'cjson' 'libxcb' 'glib2' 'dbus')
makedepends=('wayland-protocols' 'pkgconf')
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/maxischmaxi/vibepaper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a343ec1b0e1093bc12ddc8747135b6248472a912e78d75387006f33e6f9f4e5')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 packaging/vibepaper.service "$pkgdir/usr/lib/systemd/user/vibepaper.service"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
