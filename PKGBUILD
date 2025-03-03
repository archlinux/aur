# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=elsi
_pkgname=elsi_interface
pkgver=2.11.0
pkgrel=1
pkgdesc="A software interface designed for electronic structure codes"
arch=("x86_64")
url="https://wordpress.elsi-interchange.org"
license=('BSD')
depends=('elpa')
makedepends=('cmake' 'gcc-fortran')
provides=('ntpoly' 'omm')
source=("https://gitlab.com/elsi_project/$_pkgname/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.bz2")
sha256sums=('50f740b19e413c0f81cd6310a269af3f00d8226d360b7944e4666904d54165dc')

prepare() {
  cd "$srcdir/$_pkgname-v$pkgver"
  mkdir ../build
  export _elpaver=$( ls /usr/include | grep elpa | sed 's/elpa_openmp-//g' )
  sed -i 's/get_git/#get_git/' src/CMakeLists.txt
}

build() {
  cd "$srcdir/build"
  cmake ../"$_pkgname-v$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_Fortran_COMPILER=mpifort \
    -DCMAKE_C_COMPILER=mpicc \
    -DCMAKE_CXX_COMPILER=mpicxx \
    -DCMAKE_C_FLAGS="$CFLAGS -Wno-error=implicit-function-declaration" \
    -DCMAKE_Fortran_FLAGS="-I/usr/include/elpa_openmp-$_elpaver/modules -O2 -march=native -fallow-argument-mismatch" \
    -DBUILD_SHARED_LIBS=ON \
    -DLIBS="-lelpa_openmp -lscalapack -llapack -lm" \
    -DUSE_EXTERNAL_ELPA=ON \
    -DENABLE_C_TESTS=ON \
    -DENABLE_TESTS=ON \
    -D__get_git_revision_description=ON
  make
}

check() {
  cd "$srcdir/build"
  ctest
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -Dm755 ../$_pkgname-v$pkgver/LICENSE -t \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
