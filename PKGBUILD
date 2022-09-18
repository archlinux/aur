# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# co-Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=('d-spy' 'libdspy')
pkgbase='d-spy'
pkgver=1.4.0
pkgrel=1
pkgdesc='A D-Bus explorer for GNOME'
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/d-spy"
license=('GPL3')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('ddcc97fe39311ae5271ac434d6a871ca3be68e9e843f2685f8dbeac5e01b93c70029a0ef47130319a0441d4fb3782af8f73433b6817398157da3830e267c7761')

build() {
  arch-meson "${pkgname%-git}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

_pick() {
	local p="$1" f d; shift
	for f; do
		d="$srcdir/$p/${f#$pkgdir/}"
		mkdir -p "$(dirname "$d")"
		mv "$f" "$d"
		rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
	done
}

package_d-spy() {
	depends=('libadwaita' 'libdspy')

	meson install -C build --destdir "$pkgdir"
	cd "$pkgdir"
	_pick library usr/include usr/lib
}

package_libdspy() {
	pkgdesc='D-Spy library for IDE integration'
	license=('LGPL3')
	depends=('glib2')

	mv library/* "$pkgdir"
}
