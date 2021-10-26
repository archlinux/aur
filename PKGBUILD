# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=(d-spy libdspy)
pkgbase=d-spy
_commit=85e405da58e39c67afe98785d4b16df26a1322dd
pkgver=1.0.0
pkgrel=2
pkgdesc='A D-Bus explorer for GNOME'
arch=(x86_64)
url=https://gitlab.gnome.org/GNOME/d-spy
license=(GPL3)
makedepends=(meson git)
checkdepends=(appstream-glib)
source=("git+$url.git#commit=$_commit")
md5sums=(SKIP)

build() {
	arch-meson "$pkgbase" build
  meson compile -C build
}

check() {
	:
	# TODO: Add once screenshot url is fixed
	# meson test -C build
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
	depends=(libadwaita libdspy)

	meson install -C build --destdir "$pkgdir"

	cd "$pkgdir"

	_pick library usr/include usr/lib
}

package_libdspy() {
	pkgdesc='D-Spy library for IDE integration'
	license=(LGPL3)
	depends=(glib2)

	mv library/* "$pkgdir"
}
