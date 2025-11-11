_lib32=lib32-
_pkgname=unixodbc
_pkgname32=$_lib32$_pkgname
pkgname=($_pkgname32-full $_pkgname32-sidebyside64)
pkgver=2.3.14
pkgrel=1
pkgdesc="ODBC is an open specification for providing application developers with a predictable API with which to access Data Sources"
arch=('x86_64')
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
url="http://www.unixodbc.org/"
depends=('lib32-readline' 'lib32-libltdl' 'lib32-glibc')
# Remove `provides`, not sure how it works for 32-bit libs
# provides=('libodbc.so' 'libodbccr.so' 'libodbcinst.so')
provides=($_pkgname32) #both metapackages provide the "base"
source=(#ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-$pkgver.tar.gz
        https://github.com/lurcher/unixODBC/releases/download/v${pkgver}/unixODBC-${pkgver}.tar.gz)
sha256sums=('4e2814de3e01fc30b0b9f75e83bb5aba91ab0384ee951286504bb70205524771')

prepare() {
    cd unixODBC-${pkgver}
    autoreconf -vfi
}

build() {
    cd unixODBC-${pkgver}

    export CFLAGS+=" -m32"
    export CXXFLAGS+=" -m32"

    ./configure \
      --prefix=/usr \
      --libdir=/usr/lib32 \
      --sysconfdir=/etc
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

check() {
    cd unixODBC-${pkgver}
    make -k check
}

package_base() {
    cd unixODBC-${pkgver}
    make DESTDIR="${pkgdir}" install
    touch "$pkgdir"/etc/{odbc,odbcinst}.ini
}

package_lib32-unixodbc-sidebyside64() {
  conflicts+=(lib32-unixodbc-full)

  package_base

  #generate a minimal install with no etc, docs or man, so that it can live alongside main `unixodbc` package
  rm -rf $pkgdir/etc/
  rm -rf $pkgdir/usr/share
  rm -rf $pkgdir/usr/include
  for f in $pkgdir/usr/bin/*; do
    mv -v $f ${f}32
  done
}

package_lib32-unixodbc-full() {
  conflicts+=(unixodbc
              lib32-unixodbc-sidebyside64)
  backup+=('etc/odbc.ini' 'etc/odbcinst.ini')

  package_base
}
