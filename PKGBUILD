# $Id: PKGBUILD 241024 2015-06-18 22:16:52Z heftig $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgbase=pygobject-patched
pkgname=(python-gobject-patched python2-gobject-patched)
pkgver=3.16.2
pkgrel=1
arch=(i686 x86_64)
url="https://live.gnome.org/PyGObject"
license=(LGPL)
makedepends=(python python2 python-cairo python2-cairo gobject-introspection gnome-common)
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgbase%-patched}/${pkgver:0:4}/${pkgbase%-patched}-$pkgver.tar.xz"
		"01_cairo_region.patch")
sha256sums=('de620e00fe7ecb788aa2dc0d664e41f71b8e718e728168e8d982cf193a9e7e64'
            '194fc7946beb01d02a3fba587a214f2f38da56e3b63ecc9b7de37da210488919')

prepare() {
  mkdir -p build-py2 build-py3
  cd ${pkgbase%-patched}-${pkgver}
  sed -i '/Werror=format/d' configure # gcc 4.8
  patch -Np1 -i ../01_cairo_region.patch
}

build() {
  cd build-py2
  ../${pkgbase%-patched}-${pkgver}/configure --prefix=/usr --with-python=/usr/bin/python2
  make

  cd ../build-py3
  ../${pkgbase%-patched}-${pkgver}/configure --prefix=/usr
  make
}

package_python-gobject-patched() {
  pkgdesc="Python 3 bindings for GObject, with a patch for cairo"
  depends=('gobject-introspection-runtime' "pygobject-devel=$pkgver" 'python' 'cairo')
  conflicts=('python-gobject')

  cd build-py3
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,lib/pkgconfig}
}

package_python2-gobject-patched() {
  pkgdesc="Python 2 bindings for GObject, with a patch for cairo"
  depends=('gobject-introspection-runtime' "pygobject-devel=$pkgver" 'python2' 'cairo')
  conflicts=('python2-gobject')

  cd build-py2
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,lib/pkgconfig}
  python2 -m compileall "$pkgdir"//usr/lib/python2.7/site-packages/gi
}
