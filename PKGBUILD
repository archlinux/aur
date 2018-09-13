# Maintainer: Florian Pritz <flo@xssn.at>

_pkgbasename=tdb
pkgname=lib32-$_pkgbasename
pkgver=1.3.16
pkgrel=1
pkgdesc="A Trivial Database similar to GDBM but allows simultaneous commits (32-bit)"
arch=(x86_64)
license=('GPL3')
url="https://tdb.samba.org/"
depends=(lib32-glibc $_pkgbasename)
makedepends=(libxslt python2)
source=(https://www.samba.org/ftp/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.{gz,asc})
sha512sums=('7b17852986e48a32f3f8f303dd2a26503a69fcf7849f22f51483334c9abda9f189b521679e51b4ee5a80197a8f304a084dde0f56d92cfe953d3a4ede557526d2'
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
