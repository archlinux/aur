# Maintainer: Dylan <dylan@psilly.com>

pkg_base=dogecoin
pkgname=('dogecoin-daemon')
pkgver=1.10.0
pkgrel=5
arch=('i686' 'x86_64')
url='http://dogecoin.com/'
makedepends=('boost' 'automoc4' 'protobuf' 'libevent' 'openssl-1.0')
conflicts=('dogecoin-qt')
license=('MIT')
source=(
  https://github.com/$pkg_base/$pkg_base/archive/v$pkgver.tar.gz
)
sha256sums=(
  'e392f4142819fdab313ba921af53fdbd2cf6ee8965d237d0cb5cda8a52c97084'
)
install=$pkgname.install

build() {
  cd $srcdir/$pkg_base-$pkgver
  ./autogen.sh
  PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig \
  CFLAGS+=" -I/usr/include/openssl-1.0" \
  LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl" \
  ./configure --enable-cxx --prefix=/usr --with-gui=no --disable-tests --without-miniupnpc --with-incompatible-bdb --with-openssl \
  SSL_CFLAGS="$(pkg-config --cflags openssl)" SSL_LIBS="$(pkg-config --libs openssl)" CRYPTO_CFLAGS="$(pkg-config --cflags openssl)" CRYPTO_LIBS="$(pkg-config --libs openssl)"
  make
}

package_dogecoin-daemon() {
  pkgdesc='Dogecoin is a peer-to-peer network based digital currency - daemon'
  depends=('boost-libs' 'openssl-1.0')
  cd $srcdir/$pkg_base-$pkgver
  install -Dm755 src/$pkg_base'd' $pkgdir/usr/bin/$pkg_base'd'
  install -Dm755 src/$pkg_base'-cli' $pkgdir/usr/bin/$pkg_base'-cli'
  install -Dm644 contrib/debian/examples/$pkg_base.conf $pkgdir/usr/share/doc/$pkgname/examples/$pkg_base.conf
  install -Dm644 contrib/debian/manpages/$pkg_base'd.1' $pkgdir/usr/share/man/man1/$pkg_base'd.1'
  install -Dm644 contrib/debian/manpages/$pkg_base.conf.5 $pkgdir/usr/share/man/man5/$pkg_base.conf.5
  install -Dm644 COPYING '$pkgdir/usr/share/licenses/$pkgname/COPYING'
}

