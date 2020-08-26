# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=dftbplus
pkgver=20.1
pkgrel=2
pkgdesc='A quantum mechanical simulation software package based on the DFTB method'
arch=('x86_64')
url='https://www.dftbplus.org'
license=('LGPL3' 'GPL3')
depends=('scalapack' 'python-numpy')
makedepends=('gcc-fortran' 'cmake')
source=("https://github.com/dftbplus/dftbplus/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
        "https://www.dftb.org/fileadmin/DFTB/public/slako-unpacked.tar.xz")
sha256sums=('04c2b906b8670937c8ddd9c5fb68e7e9921b464840cf54aa3d698db98167d0b7'
            '026d58b96027f4cbcc9eb5fef462ec43e2cfffdc8fe385362b3726c07f1e2797')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/utils"
  mkdir -p ../build
  yes | python get_opt_externals ALL
}

build() {
  cd "$srcdir/$pkgname-$pkgver/build"
  cmake .. \
        -DINSTALL_BIN_DIR=/usr/bin \
        -DINSTALL_CMAKE_DIR=/usr/lib/cmake \
        -DINSTALL_INCLUDE_FILES=OFF \
        -DINSTALL_INC_DIR=/usr/include \
        -DINSTALL_LIB_DIR=/usr/lib \
        -DINSTALL_MOD_DIR=/usr/lib \
        -DBUILD_SHARED_LIBS=ON \
        -DWITH_MPI=ON \
        -DWITH_OMP=ON \
        -DWITH_DFTD3=ON \
        -DSCALAPACK_LIBRARIES='-lscalapack'
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
  
  sed -i "s#$srcdir##g" "$pkgdir/usr/lib/cmake/DftbPlus/DftbPlusTargets.cmake"
  install -dm755 "$pkgdir/usr/share/dftbplus"
  cp -r "$srcdir/slako" "$pkgdir/usr/share/dftbplus"
  chmod -R 755 "$pkgdir/usr/share/dftbplus"
}
