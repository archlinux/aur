# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# co-Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=('d-spy' 'libdspy')
pkgbase='d-spy'
pkgver=1.2.1
pkgrel=1
pkgdesc='A D-Bus explorer for GNOME'
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/d-spy"
license=('GPL3')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('aa68134712feb9e6855aa84b60e8d2eecdb826f73969ddae68e350f121c6d3637d39beaee84b1c300ac9c603669b723935c2ae75b518cdc999ba422ce39ad556')

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
