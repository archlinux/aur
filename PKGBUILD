# Maintainer: Hans-Nikolai Viessmann <hv15@hw.ac.uk>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: György Balló <ballogy@freestart.hu>
pkgname=gypsy
pkgver=0.9
pkgrel=7
pkgdesc="GPS multiplexing daemon"
arch=('i686' 'x86_64')
url="http://gypsy.freedesktop.org/"
license=('GPL')
depends=('dbus-glib' 'bluez' 'bluez-libs')
makedepends=('libxslt')
options=('!libtool')
source=("http://gypsy.freedesktop.org/releases/$pkgname-$pkgver.tar.gz"
        "g_type_init_deprecation.patch")
md5sums=('e2d186df9c2cc3b70a027043e22acf1a'
         'f42f0bb01f8a278fce81d6f05305b9fb')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i "$srcdir/g_type_init_deprecation.patch"
}

build() {
  if [[ $CC =~ "clang" ]] ; then
    export CFLAGS+=" -Qunused-arguments"
  else
    export CFLAGS+=" -Wno-unused-local-typedefs"
  fi
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
