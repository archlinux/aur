# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=dftbplus
pkgver=19.1
pkgrel=1
pkgdesc='A quantum mechanical simulation software package based on the DFTB method'
arch=('x86_64')
url='https://www.dftbplus.org'
license=('LGPL3' 'GPL3')
depends=('scalapack' 'python' 'python-numpy' 'arpack')
makedepends=('gcc-fortran' 'wget' 'sed')
source=("$url/fileadmin/DFTBPLUS/public/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz"
        "https://www.dftb.org/fileadmin/DFTB/public/slako-unpacked.tar.xz")
sha256sums=('78f45ef0571c78cf732a5493d32830455a832fa05ebcad43098895e46ad8d220'
            '026d58b96027f4cbcc9eb5fef462ec43e2cfffdc8fe385362b3726c07f1e2797')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  cp sys/make.x86_64-linux-gnu make.arch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  yes | ./utils/get_opt_externals ALL
  make \
        FXXOPT="$FCFLAGS -fopenmp" \
        CCOPT="$CFLAGS" \
        WITH_MPI=1 \
        WITH_SOCKETS=0 \
        WITH_DFTD3=1 \
        WITH_ARPACK=1 \
        ARPACK_NEEDS_LAPACK=1 \
        LIB_SCALAPACK='-lscalapack' \
        LIB_LAPACK='-lblas -llapack'
}

check() {
  cd $srcdir/$pkgname-$pkgver
  
  # Avoiding check failure due to incomplete implementation of MPI
  cp test/prog/dftb+/tests test/prog/dftb+/tests.backup
  sed -i "/not WITH_MPI/d" test/prog/dftb+/tests
  
  make -j1 test
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make INSTALLDIR=$pkgdir/usr install
  
  #Remove references to $pkgdir
  find $pkgdir -name *.pyc -exec sed -i "s#$pkgdir##g" {} +
  install -dm755 $pkgdir/usr/share/dftbplus
  cp -r $srcdir/slako $pkgdir/usr/share/dftbplus
  chmod -R 755 $pkgdir/usr/share/dftbplus
}
