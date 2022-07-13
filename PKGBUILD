# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=('d-spy-git' 'libdspy-git')
pkgbase='d-spy-git'
pkgver=1.2.1.r0.g4daf6fb
pkgrel=1
pkgdesc='A D-Bus explorer for GNOME'
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/d-spy"
license=('GPL3')
makedepends=('meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${pkgname%-git}" build
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

package_d-spy-git() {
	depends=('libadwaita' 'libdspy')

	meson install -C build --destdir "$pkgdir"
	cd "$pkgdir"
	_pick library usr/include usr/lib
}

package_libdspy-git() {
	pkgdesc='D-Spy library for IDE integration'
	license=('LGPL3')
	depends=('glib2')

	mv library/* "$pkgdir"
}
