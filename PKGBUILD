# Maintainer: Florian Pritz <flo@xssn.at>

_pkgbasename=tdb
pkgname=lib32-$_pkgbasename
pkgver=1.4.7
pkgrel=1
pkgdesc="A Trivial Database similar to GDBM but allows simultaneous commits (32-bit)"
arch=(x86_64)
license=('GPL3')
url="https://tdb.samba.org/"
depends=(lib32-glibc $_pkgbasename)
makedepends=(libxslt python)
source=(https://www.samba.org/ftp/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.{gz,asc})
sha512sums=('2b5b20c299b60545943f106d854b6e0d4a559e16f08a7ed62fe57ee962bebc888c2e663bd5fef907aace05b316826fe8fbbf3f323b6d3427531e59ffe47d48e4'
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
