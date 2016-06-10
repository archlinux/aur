# Contrubutor: Ionut Biru <ibiru@archlinux.org>
# Maintainer: wangjiezhe <wangjiezhe AT yandex DOT com>

_pkgbase=pygobject
pkgbase=pygobject-patched
pkgname=(python-gobject-patched python2-gobject-patched)
pkgver=3.20.0
pkgrel=2
arch=(i686 x86_64)
url="https://live.gnome.org/PyGObject"
license=(LGPL)
makedepends=(python python2 python-cairo-git python2-cairo gobject-introspection)
source=("https://download.gnome.org/sources/${_pkgbase}/${pkgver:0:4}/${_pkgbase}-${pkgver}.tar.xz"
		"01_cairo_region.patch")
sha256sums=('31ab4701f40490082aa98af537ccddba889577abe66d242582f28577e8807f46'
            'f6f57ccf195c0c8c654edaab0bf09940a15d14ac72bca0b6c1272a0e22792e8e')

prepare() {
  mkdir -p build-py2 build-py3
  cd ${_pkgbase}-${pkgver}
  patch -Np1 -i "$srcdir/01_cairo_region.patch"
}

build() {
  cd build-py2
  ../${_pkgbase}-${pkgver}/configure --prefix=/usr --with-python=/usr/bin/python2
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make

  cd ../build-py3
  ../${_pkgbase}-${pkgver}/configure --prefix=/usr --with-python=/usr/bin/python
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
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
