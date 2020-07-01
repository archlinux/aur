# Maintainer: Florian Pritz <flo@xssn.at>

_pkgbasename=tdb
pkgname=lib32-$_pkgbasename
pkgver=1.4.3
pkgrel=1
pkgdesc="A Trivial Database similar to GDBM but allows simultaneous commits (32-bit)"
arch=(x86_64)
license=('GPL3')
url="https://tdb.samba.org/"
depends=(lib32-glibc $_pkgbasename)
makedepends=(libxslt python)
source=(https://www.samba.org/ftp/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.{gz,asc})
sha512sums=('99488839e7da396f04df60412d21a7d3e09efeab52772d6cb5e9470a3dfd585d73ef2422c51cd0d8ccc123a65d455de400d5d6b24a21a2a50d3da60d9a70e67a'
            'SKIP')
validpgpkeys=('9147A339719518EE9011BCB54793916113084025') #Samba Library Distribution Key <samba-bugs@samba.org>

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

   cd ${_pkgbasename}-${pkgver}

   ./configure --prefix=/usr \
               --localstatedir=/var \
               --sysconfdir=/etc/samba \
               --libdir=/usr/lib32 \
               --disable-python
   make
}

package() {
  cd ${_pkgbasename}-${pkgver}
  make -j1  DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
