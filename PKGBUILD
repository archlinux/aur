# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Carl Rogers <carl.rogers@gmail.com>
# Contributor: Jed Brown <jed@59A2.org>
# Contributor: Brenden Mervin <bmervin@utk.edu>

pkgname=silo
_PkgName=Silo
pkgver=4.11.1
pkgrel=1
pkgdesc="A Mesh and Field I/O Library and Scientific Database"
url="http://software.llnl.gov/Silo"
arch=(x86_64)
depends=(qt5-base hdf5-openmpi)
makedepends=(gcc-fortran)
license=(BSD)
source=(https://github.com/LLNL/$_PkgName/releases/download/$pkgver/$pkgname-$pkgver-bsd.tar.xz)
sha256sums=('51ccfdf3c09dfc98c7858a0a6f08cc3b2a07ee3c4142ee6482ba7b24e314c2aa')

build() {
  cd "$srcdir/$pkgname-$pkgver-bsd"
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
  cd "$srcdir/$pkgname-$pkgver-bsd"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-html
  install -Dm644 "$srcdir/$pkgname-$pkgver-bsd/docs/Silo.book.pdf" \
    "$pkgdir/usr/share/doc/$pkgname/Silo.book.pdf"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
