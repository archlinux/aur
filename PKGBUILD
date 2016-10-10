# Maintainer: Lukas Epple <post@lukasepple.de>
# Todo: replace valadoc-git with valadoc when it enters the usual repos

_pkgname=libhttpseverywhere
pkgname="$_pkgname-git"
pkgrel=3
pkgver=95+ga07a685
pkgdesc="library to use HTTPSEverywhere in desktop applications"
arch=('i686' 'x86_64')
url="https://github.com/grindhold/libhttpseverywhere/"
license=('LGPL3')
depends=('libgee' 'libxml2' 'libarchive' 'libsoup' 'glib2' 'json-glib')
makedepends=('git' 'meson' 'ninja' 'vala' 'valadoc-git' 'gobject-introspection')
conflicts=('libhttpseverywhere')
provides=('libhttpseverywhere')
source=(git+git://github.com/grindhold/libhttpseverywhere.git meson.patch)
md5sums=(SKIP '47618595ea520abb7a06816c0e65d037')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	patch -N -p1 -i "$srcdir/meson.patch"
	mkdir -p "$srcdir/$_pkgname/build"
	cd "$srcdir/$_pkgname/build"
	meson --prefix "/usr" --libdir "lib" ..
}
build() {
	cd "$srcdir/$_pkgname/build"
	ninja
}

package() {
	cd "$srcdir/$_pkgname/build"
	DESTDIR="$pkgdir/" ninja install
}
