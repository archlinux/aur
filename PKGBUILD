# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Radu Andries <admiral0@tuxfamily.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Mantainer: Lorenzo Ferrillo <lorenzofer at live dot it>
_pkgname=zbar
pkgname=lib32-zbar
pkgver=0.20
pkgrel=2
pkgdesc="Application and library for reading bar codes from various sources. 32bit libraries only version"
arch=('x86_64')
url="https://github.com/procxx/zbar"
license=('LGPL')
depends=('zbar')
makedepends=('lib32-imagemagick' 'lib32-libxv' 'lib32-python2' 'lib32-gtk2' 'pygtk' 'lib32-v4l-utils' 'xmlto')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/procxx/zbar/archive/$pkgver.tar.gz"
        imagemagick7.patch)
sha512sums=('b013dc5f72f910e8e0dc73de1705684f76e5cb5b2026d48d3e149d3e8b46afdf273d06f32738c588c272218e95b5cd39d3c0b8be4eb9be17553504a13b11c144'
            '43987414a6432b9e7da329f5a416f389d29bfc3417a6edc65a46b2677ade7dbb8c150df90c8b42464a6cb17c4732509fb8d3672387dafe9fd17a5def78a5ef63')

prepare() {
  cd zbar-$pkgver
  patch -p1 -i ../imagemagick7.patch
  autoreconf -vfi
}

build() {
  cd zbar-$pkgver
   export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export PYTHON='/usr/bin/python2-32'
  export PYTHON_CONFIG='/usr/bin/python2-32-config'

  #PKG_CONFIG_PATH="/usr/lib32/imagemagick6/pkgconfig" \
  
  PYTHON="/usr/bin/python2" \
  ./configure --prefix=/usr --libdir=/usr/lib32 --without-qt --without-gtk CFLAGS="$CFLAGS -DNDEBUG"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -j1

}

package() {

  cd zbar-$pkgver
  make DESTDIR="$pkgdir" install -j1

  rm -Rf "$pkgdir"/usr/lib32/*.a \
	"$pkgdir"/usr/include/ \
        "$pkgdir"/usr/bin \
	"$pkgdir"/usr/share
	
}
