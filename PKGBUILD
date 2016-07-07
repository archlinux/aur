# $Id$
# Maintainer: Maxime Vincent <maxime.vince@gmail.com>

_pkgbase=libmicrohttpd
pkgname=lib32-${_pkgbase}
pkgver=0.9.49
pkgrel=2
pkgdesc="a small C library that is supposed to make it easy to run an HTTP server as part of another application."
arch=('x86_64')
url="http://www.gnu.org/software/libmicrohttpd/"
license=('LGPL')
depends=('lib32-gnutls' 'lib32-libgcrypt')
optdepends=('lib32-curl')
options=('!libtool')
source=(ftp://ftp.gnu.org/gnu/libmicrohttpd/$_pkgbase-$pkgver.tar.gz)
md5sums=('3209aa2ac6199b874a6325342b86edbc')

build() {
  cd ${_pkgbase}-${pkgver}
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --disable-dependency-tracking --enable-largefile \
	--enable-curl --enable-messages --with-pic \
    --build=i686-pc-linux-gnu \
    --host=i686-pc-linux-gnu \
    --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf "${pkgdir}"/usr/{include,share}
  sed -i 's#Cflags: -I${includedir}#Cflags: -I${includedir} -I${includedir}/libmicrohttpd#' \
	$pkgdir/usr/lib32/pkgconfig/libmicrohttpd.pc
}
