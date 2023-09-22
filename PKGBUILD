# Maintainer: Florian Pritz <flo@xssn.at>

_pkgbasename=tdb
pkgname=lib32-$_pkgbasename
pkgver=1.4.9
pkgrel=1
pkgdesc="A Trivial Database similar to GDBM but allows simultaneous commits (32-bit)"
arch=(x86_64)
license=('GPL3')
url="https://tdb.samba.org/"
depends=(lib32-glibc $_pkgbasename)
makedepends=(libxslt python)
source=(https://www.samba.org/ftp/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.{gz,asc})
sha512sums=('6b0109075826b8630f6b5a7e7ade2fcff95c5d05338340af78219422610947c520707b3e484ff13fbd40bbfffe13977976e8ddcb1be7b13e13ac78b4e3ec06c2'
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
