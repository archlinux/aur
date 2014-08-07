# Maintainer: Florian Pritz <flo@xssn.at>

_pkgbasename=tdb
pkgname=lib32-$_pkgbasename
pkgver=1.3.0
pkgrel=1
pkgdesc="A Trivial Database similar to GDBM but allows simultaneous commits (32-bit)"
arch=(x86_64)
license=('GPL3')
url="http://tdb.samba.org/"
depends=(lib32-glibc $_pkgbasename)
makedepends=(gcc-multilib libxslt python2)
source=(http://samba.org/ftp/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz
        0001-tdb-include-include-stdbool.h-in-tdb.h.patch)
md5sums=('f18cd6afc4f5670edfe58f72d2665f94'
         '2b0b6003b3d8ca03adccd4aa1a3b8313')

prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  patch -Np1 -i ../0001-tdb-include-include-stdbool.h-in-tdb.h.patch
}


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
