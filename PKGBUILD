# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Anton Kudelin <kudelin at proton dot me>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Carl Rogers <carl.rogers@gmail.com>
# Contributor: Jed Brown <jed@59A2.org>
# Contributor: Brenden Mervin <bmervin@utk.edu>
# Contributor: David Wells <drwells.aur at fastmail dot com>
_base=Silo
pkgname=${_base,,}
pkgver=4.12.2
pkgrel=1
pkgdesc="File-based, scientific data exchange and software interoperability"
url="https://software.llnl.gov/${_base}"
arch=(x86_64)
depends=(qt5-base hdf5-openmpi)
makedepends=(gcc-fortran)
license=(BSD)
source=(${_base}-${pkgver}.tar.gz::https://github.com/LLNL/${_base}/archive/${pkgver}.tar.gz
  local://hdf5-2.patch)
sha512sums=('ee81a40bf76509569b2729cde7305f5f303c1b9d5d67d60efcc873f5309a2763a75df20a7f22698d0e73f1c2daff2c71f6c6d0d4eb41fcf6d0dd69da8555201f'
            '5b8d3cb1cdbfa1095c8d558f919e1dee0d91edbf4a626077e2d0cc789d120b6e119ac0d9af52241aa65c7b1e35a65e6ec0e4bdf0fa40fd7222c52338683adeb8')

prepare() {
  cd "$srcdir/$_base-$pkgver"
  patch -p1 -i ../hdf5-2.patch
}

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

package() {
  cd "$srcdir/$_base-$pkgver"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-html
  install -Dm644 "$srcdir/$_base-$pkgver/docs/oldfm/Silo.book.pdf" \
    "$pkgdir/usr/share/doc/$pkgname/Silo.book.pdf"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
