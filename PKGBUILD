# Maintainer: SelfRef <arch@selfref.dev>
_basename=showtime
pkgname=${_basename}-git
pkgver=r156.799caef
pkgrel=2
pkgdesc="Video Player - Watch without distraction (git version)"
arch=('x86_64')
url="https://apps.gnome.org/Showtime/"
license=('GPL')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'gst-plugin-gtk4')
makedepends=('git' 'meson' 'blueprint-compiler')
provides=("$_basename")
conflicts=("$_basename")
source=("$_basename::git+https://gitlab.gnome.org/GNOME/Incubator/showtime.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_basename"
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	meson subprojects download --sourcedir=$_basename
}

build() {
	arch-meson $_basename build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
