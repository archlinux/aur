# Maintainer: Florian Pritz <flo@xssn.at>

_pkgbasename=tdb
pkgname=lib32-$_pkgbasename
pkgver=1.2.1
pkgrel=2
pkgdesc="A Trivia Database similar to GDBM but allows simultaneous commits (32-bit)"
arch=(x86_64)
license=('GPL3')
url="http://tdb.samba.org/"
source=(http://samba.org/ftp/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz)
depends=(lib32-glibc $_pkgbasename)
makedepends=(gcc-multilib)
options=(force)

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

   cd "${srcdir}/${_pkgbasename}-${pkgver}"
   ./configure --prefix=/usr \
               --localstatedir=/var \
               --sysconfdir=/etc/samba --libdir=/usr/lib32
   make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  install -D libtdb.so.$pkgver "$pkgdir/usr/lib32/libtdb.so.$pkgver"
  ln -s "libtdb.so.$pkgver" "$pkgdir/usr/lib32/libtdb.so.1"
  ln -s "libtdb.so.$pkgver" "$pkgdir/usr/lib32/libtdb.so"
  install -D tdb.pc /build/pkg/usr/lib32/pkgconfig/tdb.pc
# broken
# make -j1  DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
md5sums=('73ea81282a82e5c959d9c082af2d0215')
