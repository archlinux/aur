# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Radu Andries <admiral0@tuxfamily.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Mantainer: Lorenzo Ferrillo <lorenzofer at live dot it>
_pkgname=zbar
pkgname=lib32-zbar
pkgver=0.22
pkgrel=1
pkgdesc="Application and library for reading bar codes from various sources. 32bit libraries only version"
arch=('x86_64')
url="https://github.com/procxx/zbar"
license=('LGPL')
depends=('zbar')
makedepends=('lib32-imagemagick' 'lib32-libxv' 'lib32-python2' 'lib32-gtk2' 'pygtk' 'lib32-v4l-utils' 'xmlto')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mchehab/zbar/archive/$pkgver.tar.gz"
        imagemagick7.patch)
sha512sums=('bef1078f7fe0c943e2ca7348f45e3bb5744e807c5135051fccf2c4499d52515558e98f61620e2ef2c993f35b8104d886d0639b7f0e6f8979caa5dcc49df7c931'
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

  #PKG_CONFIG_PATH="/usr/lib32/imagemagick6/pkgconfig"  
  
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
	"$pkgdir"/usr/share \
	"$pkgdir"/etc
	
}
