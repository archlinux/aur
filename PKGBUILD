# Maintainer: Florian Pritz <flo@xssn.at>

_pkgbasename=tdb
pkgname=lib32-$_pkgbasename
pkgver=1.3.15
pkgrel=2
pkgdesc="A Trivial Database similar to GDBM but allows simultaneous commits (32-bit)"
arch=(x86_64)
license=('GPL3')
url="https://tdb.samba.org/"
depends=(lib32-glibc $_pkgbasename)
makedepends=(libxslt python2)
source=(https://www.samba.org/ftp/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.{gz,asc})
md5sums=('60ece3996acc8d85b6f713199da971a6'
         'SKIP')
validpgpkeys=('9147A339719518EE9011BCB54793916113084025') #Samba Library Distribution Key <samba-bugs@samba.org>

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

   cd "${srcdir}/${_pkgbasename}-${pkgver}"

   sed -i -e 's#python#python2#g' buildtools/bin/waf

   ./configure --prefix=/usr \
               --localstatedir=/var \
               --sysconfdir=/etc/samba \
               --libdir=/usr/lib32 \
               --disable-python
   make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make -j1  DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
