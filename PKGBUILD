# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

_pkgbase=pygobject
pkgbase=pygobject-patched
pkgname=(python-gobject-patched python2-gobject-patched)
pkgver=3.18.0
pkgrel=1
arch=(i686 x86_64)
url="https://live.gnome.org/PyGObject"
license=(LGPL)
makedepends=(python python2 python-cairo python2-cairo gobject-introspection gnome-common)
source=("http://ftp.gnome.org/pub/gnome/sources/${_pkgbase}/${pkgver:0:4}/${_pkgbase}-$pkgver.tar.xz"
		"01_cairo_region.patch")
sha256sums=('1c3ba1112d3713cd5c86260312bfeb0de1f84f18808e51072c50b29d46156dc9'
            '194fc7946beb01d02a3fba587a214f2f38da56e3b63ecc9b7de37da210488919')

prepare() {
  mkdir -p build-py2 build-py3
  cd ${_pkgbase}-${pkgver}
  sed -i '/Werror=format/d' configure # gcc 4.8
  patch -Np1 -i "$srcdir/01_cairo_region.patch"
}

build() {
  cd build-py2
  ../${_pkgbase}-${pkgver}/configure --prefix=/usr --with-python=/usr/bin/python2
  make

  cd ../build-py3
  ../${_pkgbase}-${pkgver}/configure --prefix=/usr
  make
}

package_python-gobject-patched() {
  pkgdesc="Python 3 bindings for GObject, with a patch for cairo"
  depends=('gobject-introspection-runtime' "pygobject-devel=$pkgver" 'python' 'cairo')
  provides=("python-gobject=$pkgver")
  conflicts=('python-gobject')

  cd build-py3
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,lib/pkgconfig}
}

package_python2-gobject-patched() {
  pkgdesc="Python 2 bindings for GObject, with a patch for cairo"
  depends=('gobject-introspection-runtime' "pygobject-devel=$pkgver" 'python2' 'cairo')
  provides=("python2-gobject=$pkgver")
  conflicts=('python2-gobject')

  cd build-py2
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,lib/pkgconfig}
  python2 -m compileall "$pkgdir"//usr/lib/python2.7/site-packages/gi
}

# vim:set ts=2 sw=2 et:
