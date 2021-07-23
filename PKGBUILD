# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Saeed Rasooli <saeed.gnu@gmail.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgbase=pygobject
pkgbase=$_pkgbase-git
pkgname=(python-gobject-git pygobject-devel-git)
pkgver=3.40.0+10+gb15e81fc
pkgrel=1
pkgdesc="Python Bindings for GLib/GObject/GIO/GTK+"
url="https://wiki.gnome.org/Projects/PyGObject"
arch=(aarch64 armv6h armv7h arm i386 i686 mips pentium4 powerpc powerpc64 riscv64 x86_64)
license=(LGPL)
depends=(gobject-introspection-runtime)
makedepends=(python-cairo python-setuptools gobject-introspection git gnome-common)
optdepends=('cairo: Cairo bindings')
source=("git+https://gitlab.gnome.org/GNOME/pygobject.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgbase
	git describe --tags | sed 's/-/+/g'
}

prepare() {
	mkdir -p devel
}

_build() (
	cd $_pkgbase
	python$1 setup.py build
)

build() {
	_build 3
}

package_python-gobject-git() {
	depends=("pygobject-devel=$pkgver" python)
	provides=("python-gobject=$pkgver")
	conflicts=("python-gobject")

	cd $_pkgbase
	python3 setup.py install --prefix="/usr/" --root="$pkgdir"
	mv "$pkgdir/usr/include/pygobject-3.0/pygobject.h" "$srcdir/devel"
	mv "$pkgdir/usr/lib/pkgconfig/pygobject-3.0.pc" "$srcdir/devel"
}

package_pygobject-devel-git() {
	pkgdesc="Common development files for pygobject"
	provides=("pygobject-devel=$pkgver")
	conflicts=("pygobject-devel")

	mkdir -p "$pkgdir/usr/include/pygobject-3.0/"
	cp "$srcdir/devel/pygobject.h" "$pkgdir/usr/include/pygobject-3.0/pygobject.h"

	mkdir -p "$pkgdir/usr/lib/pkgconfig/"
	cp "$srcdir/devel/pygobject-3.0.pc" "$pkgdir/usr/lib/pkgconfig/pygobject-3.0.pc"
}
