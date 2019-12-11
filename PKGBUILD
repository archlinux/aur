# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=libxc
pkgver=4.3.4
pkgrel=4
pkgdesc="A library of exchange-correlation functionals for density-functional theory"
arch=('i686' 'x86_64')
url="https://www.tddft.org/programs/libxc"
license=('MPL2')
makedepends=('gcc' 'gcc-fortran')
source=(http://www.tddft.org/programs/$pkgname/down.php?file=$pkgver/$pkgname-$pkgver.tar.gz)
sha1sums=('8c8a8fe01ee1d2ff9868657a17f751c80534829d')
options=(staticlibs)

prepare() {
  # Add missing file. Fixed upstream (see https://gitlab.com/libxc/libxc/commit/3f4bad352779a803020de89e271a175a72b03f85).
  sed -i "/func_info.c/ a func_reference.c" $srcdir/$pkgname-$pkgver/CMakeLists.txt
}

build() {
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake $srcdir/$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DENABLE_FORTRAN=ON \
        -DENABLE_FORTRAN03=ON
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}
