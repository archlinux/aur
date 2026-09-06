# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=lunduke-paint-git
pkgver=r52.0644594
pkgrel=1
pkgdesc="Traditional Linux X11 paint program (GTK3/gtkmm), classic MS Paint + KolourPaint feel"
arch=('x86_64')
url="https://github.com/BryanLunduke/lunduke-paint"
license=('GPL-3.0-or-later')
depends=('gtkmm3' 'cairomm' 'gdk-pixbuf2' 'glib2' 'libarchive' 'pugixml' 'pango')
makedepends=('meson' 'ninja' 'git')
provides=('lunduke-paint')
conflicts=('lunduke-paint')
source=("$pkgname::git+https://github.com/BryanLunduke/lunduke-paint.git")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

check() {
	# test_widgets self-skips (exit 77) when there's no DISPLAY, per upstream README
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
