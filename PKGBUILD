# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=dftbplus
pkgver=21.2
pkgrel=1
pkgdesc='A quantum mechanical simulation software package based on the DFTB method'
arch=('x86_64')
url='https://www.dftbplus.org'
license=('LGPL3' 'GPL3')
depends=('scalapack' 'python-numpy')
makedepends=('gcc-fortran' 'cmake' 'wget' 'git')
source=("https://github.com/dftbplus/dftbplus/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
        "https://www.dftb.org/fileadmin/DFTB/public/slako-unpacked.tar.xz")
sha256sums=('fbeb0e0ea93ab4dc4450f298ec712d2cf991f19f621badf57dae05f0e43b5906'
            '026d58b96027f4cbcc9eb5fef462ec43e2cfffdc8fe385362b3726c07f1e2797')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/utils"
  yes | python get_opt_externals ALL
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_INCLUDE_FILES=ON \
        -DINSTALL_INCLUDEDIR=/usr/include \
        -DINSTALL_MODULEDIR=/usr/lib \
        -DBUILD_SHARED_LIBS=ON \
        -DSCALAPACK_LIBRARY='-lscalapack' \
        -DWITH_MPI=ON \
        -DWITH_OMP=ON \
        -DWITH_POISSON=ON \
        -DWITH_MBD=ON
  make
}

check() {
  cd "$srcdir/build"
  make test
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/dftbplus/slako"
  cp -r "$srcdir/slako" "$pkgdir/usr/share/dftbplus/slako"
  chmod -R 755 "$pkgdir/usr/share/dftbplus/slako"
}
