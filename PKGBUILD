# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Carl Rogers <carl.rogers@gmail.com>
# Contributor: Jed Brown <jed@59A2.org>
# Contributor: Brenden Mervin <bmervin@utk.edu>

pkgname=silo
pkgver=4.10.2
pkgrel=10
pkgdesc="A Mesh and Field I/O Library and Scientific Database"
url="https://wci.llnl.gov/simulation/computer-codes/silo"
arch=('x86_64')
depends=('qt5-base' 'hdf5-openmpi')
makedepends=('gcc-fortran')
license=('BSD')
source=("https://wci.llnl.gov/content/assets/docs/simulation/computer-codes/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver-bsd.tar.gz"
        "remove-mpiposix.patch"
        "skip-test.patch"
        "qt5.patch")
sha256sums=('4b901dfc1eb4656e83419a6fde15a2f6c6a31df84edfad7f1dc296e01b20140e'
            '824be92ba71e8d797c5836545c58c2c67de0f296b69e8efd9cb9e8ae206837b8'
            '83e50ccad8477ae7549ae68ab12b180e268e1f28b589b699090dbefb59f57e8b'
            '7928c311e238f4d53176f69b75d8099d786b4526fa81fc6c6f565b04c80d5915')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-bsd"
  patch -p0 < "$srcdir/remove-mpiposix.patch"
  patch -p0 < "$srcdir/skip-test.patch"
  patch -p0 < "$srcdir/qt5.patch"
  sed -i 's@rocket_silo.lo@rocket_silo.lo ../src/libsiloh5.la@' tests/Makefile.in
}

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
            CXXFLAGS="-I/usr/include/qt/QtWidgets $CXXFLAGS -fPIC" \
            FFLAGS="$FFLAGS -fallow-argument-mismatch" \
            LIBS='-L/usr/lib/openmpi -lmpi -lQt5Core -lQt5Gui -lQt5Widgets'
  make
}

check(){
  cd "$srcdir/$pkgname-$pkgver-bsd"
  make check CXXFLAGS="$CXXFLAGS -std=c++98"
}

package(){
  cd "$srcdir/$pkgname-$pkgver-bsd"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-html
  install -Dm644 "$srcdir/$pkgname-$pkgver-bsd/docs/Silo.book.pdf" \
    "$pkgdir/usr/share/doc/$pkgname/Silo.book.pdf"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
