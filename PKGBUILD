# Contrubutor: Ionut Biru <ibiru@archlinux.org>
# Maintainer: wangjiezhe <wangjiezhe AT yandex DOT com>

_pkgbase=pygobject
pkgbase=pygobject-patched
pkgname=(python-gobject-patched python2-gobject-patched pygobject-devel-patched)
pkgver=3.24.0
pkgrel=1
pkgdesc="Python Bindings for GLib/GObject/GIO/GTK+"
url="https://wiki.gnome.org/Projects/PyGObject"
arch=(i686 x86_64)
license=(LGPL)
depends=(gobject-introspection-runtime)
makedepends=(python-cairo-git python2-cairo gobject-introspection)
optdepends=('cairo: Cairo bindings')
source=("https://download.gnome.org/sources/${_pkgbase}/${pkgver:0:4}/${_pkgbase}-${pkgver}.tar.xz"
		"01_cairo_region.patch")
sha256sums=('4e228b1c0f36e810acd971fad1c7030014900d8427c308d63a560f3f1037fa3c'
            '70d890c4f56cb677a386dcd5cfe554957c200802b788e582b22b09ba49a423a2')

prepare() {
  mkdir -p build-py{2,3} devel
  cd ${_pkgbase}-${pkgver}
  patch -Np1 -i "$srcdir/01_cairo_region.patch"
}

_build() (
  cd build-py$1
  ../${_pkgbase}-${pkgver}/configure --prefix=/usr --with-python=/usr/bin/python$1
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
)

build() {
  _build 2
  _build 3
}

package_python-gobject-patched() {
  depends=("pygobject-devel=$pkgver" python)
  provides=("python-gobject=$pkgver")
  conflicts=('python-gobject')

  cd build-py3
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/{include,lib/pkgconfig} "$srcdir/devel"
}

package_python2-gobject-patched() {
  pkgdesc="${pkgdesc/Python/Python2}"
  depends=("pygobject-devel=$pkgver" python2)
  provides=("python2-gobject=$pkgver")
  conflicts=('python2-gobject')

  cd build-py2
  make DESTDIR="$pkgdir" install
  python2 -m compileall "$pkgdir"/usr/lib/python2.7/site-packages/gi
  rm -r "$pkgdir"/usr/{include,lib/pkgconfig}
}

package_pygobject-devel-patched() {
  pkgdesc="Common development files for pygobject"
  provides=("pygobject-devel=$pkgver")
  conflicts=("pygobject-devel")

  cd devel
  mkdir -p "$pkgdir/usr/lib"
  mv include "$pkgdir/usr/"
  mv pkgconfig "$pkgdir/usr/lib/"
}
