# Maintainer: robertfoster

pkgname=gnome-books
pkgver=3.30.1
pkgrel=1
pkgdesc="Simple GNOME application to access and organize your e-books"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Books"
license=('LGPL')
groups=('gnome')
depends=('gtk3' 'libgepub')
makedepends=('git' 'gobject-introspection' 'itstool' 'meson')
_commit=cef7848fba4aeebbc25f231b62fa6e1ed2bb12ff  # tags/v3.30.1^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-books.git#commit=$_commit"
	"git+https://gitlab.gnome.org/GNOME/libgd.git"
)

pkgver() {
	cd $pkgname
	git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
	cd $pkgname
	git submodule init
	git config --local submodule.subprojects/libgd.url "$srcdir/libgd"
	git submodule update
}

build() {
	arch-meson $pkgname build
	ninja -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

md5sums=('SKIP'
'SKIP')
