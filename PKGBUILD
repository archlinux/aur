# Contributor: Ionut Biru <ibiru@archlinux.org>
# Maintainer: wangjiezhe <wangjiezhe AT yandex DOT com>

_pkgbase=pygobject
pkgbase=pygobject-git
pkgname=(python-gobject-git python2-gobject-git pygobject-devel-git)
pkgver=3.24.0+22+g30228a98
pkgrel=1
pkgdesc="Python Bindings for GLib/GObject/GIO/GTK+"
url="https://wiki.gnome.org/Projects/PyGObject"
arch=(x86_64)
license=(LGPL)
depends=(gobject-introspection-runtime)
makedepends=(python-cairo-git python2-cairo gobject-introspection git gnome-common)
optdepends=('cairo: Cairo bindings')
source=("git://git.gnome.org/pygobject")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  mkdir -p build-py{2,3} devel
  cd $_pkgbase
  NOCONFIGURE=1 ./autogen.sh
}

_build() (
  cd build-py$1
  ../$_pkgbase/configure --prefix=/usr --with-python=/usr/bin/python$1
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
)

build() {
  _build 2
  _build 3
}

package_python-gobject-git() {
  depends=("pygobject-devel=$pkgver" python)
  provides=("python-gobject=$pkgver")
  conflicts=("python-gobject")

  cd build-py3
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/{include,lib/pkgconfig} "$srcdir/devel"
}

package_python2-gobject-git() {
  pkgdesc="${pkgdesc/Python/Python2}"
  depends=("pygobject-devel=$pkgver" python2)
  provides=("python2-gobject=$pkgver")
  conflicts=("python2-gobject")

  cd build-py2
  make DESTDIR="$pkgdir" install
  python2 -m compileall "$pkgdir"/usr/lib/python2.7/site-packages/gi
  rm -r "$pkgdir"/usr/{include,lib/pkgconfig}
}

package_pygobject-devel-git() {
  pkgdesc="Common development files for pygobject"
  provides=("pygobject-devel=$pkgver")
  conflicts=("pygobject-devel")

  cd devel
  mkdir -p "$pkgdir/usr/lib"
  mv include "$pkgdir/usr/"
  mv pkgconfig "$pkgdir/usr/lib/"
}
