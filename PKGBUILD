# Maintainer: Florian Pritz <flo@xssn.at>

_pkgbasename=tdb
pkgname=lib32-$_pkgbasename
pkgver=1.2.9
pkgrel=1
pkgdesc="A Trivia Database similar to GDBM but allows simultaneous commits (32-bit)"
arch=(x86_64)
license=('GPL3')
url="http://tdb.samba.org/"
depends=(lib32-glibc $_pkgbasename)
makedepends=(gcc-multilib libxslt python2)
source=(http://samba.org/ftp/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('4d97d18bbe9040038d4e003495bb8cd1')

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
