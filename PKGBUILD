# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Carl Rogers <carl.rogers@gmail.com>
# Contributor: Jed Brown <jed@59A2.org>
# Contributor: Brenden Mervin <bmervin@utk.edu>
_base=Silo
pkgname=${_base,,}
pkgver=4.12.0
pkgrel=1
pkgdesc="A Mesh and Field I/O Library and Scientific Database"
url="http://software.llnl.gov/Silo"
arch=(x86_64)
depends=(qt5-base hdf5-openmpi)
makedepends=(gcc-fortran)
license=(BSD)
source=(${_base}-${pkgver}.tar.gz::https://github.com/LLNL/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('66b5c5935794ac557f6feb7d060af1c269d3267780da8cb54c4e2c9829182fae289f8aa9a5596e18d41ce43611e66a79ec466de3b2c8a5269021270fb4452d87')

build() {
  cd "$srcdir/$_base-$pkgver"
  ./configure \
    --prefix=/usr \
    --enable-shared \
    --enable-optimization \
    --enable-silex \
    --enable-install-lite-headers \
    --with-x \
    --with-hdf5=/usr/include,/usr/lib \
    --with-Qt-include-dir=/usr/include/qt \
    --with-szlib=/usr/lib \
    --with-zlib=/usr/include,/usr/lib \
    CFLAGS="$CFLAGS -Wno-error=format-security" \
    CXXFLAGS="-I/usr/include/qt/QtWidgets $CXXFLAGS -fPIC" \
    FFLAGS="$FFLAGS -fallow-argument-mismatch" \
    LIBS='-L/usr/lib/openmpi -lmpi -lQt5Core -lQt5Gui -lQt5Widgets'
  make
}

package(){
  cd "$srcdir/$_base-$pkgver"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-html
  install -Dm644 "$srcdir/$_base-$pkgver/docs/oldfm/Silo.book.pdf" \
    "$pkgdir/usr/share/doc/$pkgname/Silo.book.pdf"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
