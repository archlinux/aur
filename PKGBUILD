# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Carl Rogers <carl.rogers@gmail.com>
# Contributor: Jed Brown <jed@59A2.org>
# Contributor: Brenden Mervin <bmervin@utk.edu>

pkgname=silo
pkgver=4.11
pkgrel=1
pkgdesc="A Mesh and Field I/O Library and Scientific Database"
url="https://wci.llnl.gov/simulation/computer-codes/silo"
arch=('x86_64')
depends=('qt5-base' 'hdf5-openmpi')
makedepends=('gcc-fortran')
license=('BSD')
source=("https://wci.llnl.gov/sites/wci/files/2021-09/$pkgname-$pkgver-bsd.tgz"
        "skip-test.patch"
        "hdf5.patch")
sha256sums=('6d0a85a079d48fcdcc0084ecb5fc4cfdcc64852edee780c60cb244d16f4bc4ec'
            '83e50ccad8477ae7549ae68ab12b180e268e1f28b589b699090dbefb59f57e8b'
            '8acf1a54c3ba21699a9f1cd67aabc806643630e80795bcf9524f7eb874116bb5')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-bsd"
  patch -p0 < ../hdf5.patch
  patch -p0 < "$srcdir/skip-test.patch"
  sed -i 's@rocket_silo.lo@rocket_silo.lo ../src/libsiloh5.la@' \
    tests/Makefile.in
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
            CFLAGS="$CFLAGS -Wno-error=format-security" \
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
