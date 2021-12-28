# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=sirius
_PkgName=SIRIUS
pkgver=7.3.0
pkgrel=1
pkgdesc="Domain specific library for electronic structure calculations"
arch=('x86_64')
license=('BSD')
url="https://github.com/electronic-structure/SIRIUS"
depends=('libvdwxc' 'libxc' 'spglib' 'elpa' 'spfft' 'spla' 'gsl' 'hdf5')
makedepends=('cmake')
optdepends=('magma: Linear algebra on GPU')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('69b5cf356adbe181be6c919032859c4e0160901ff42a885d7e7ea0f38cc772e2')
options=(!emptydirs)

prepare() {
  mkdir "$srcdir/build"
  
  # Checking if nvcc is in PATH
  if command -v nvcc &> /dev/null
  then
      export _ACC=ON
      export LDFLAGS="$LDFLAGS -L/opt/cuda/lib64"
      echo "GPU is enabled"
  else
      export _ACC=OFF
      echo "GPU is disabled"
  fi
  
  # Finding ELPA version
  _ELPAVER=$( ls /usr/include | grep elpa | sed 's/elpa_openmp-//g' )
}

build() {
  cd "$srcdir/build"
  cmake ../$_PkgName-$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCREATE_FORTRAN_BINDINGS=ON \
      -DUSE_OPENMP=ON \
      -DUSE_SCALAPACK=ON \
      -DUSE_CUDA=$_ACC \
      -DUSE_MAGMA=$_ACC \
      -DUSE_VDWXC=ON \
      -DUSE_ELPA=ON \
      -DELPA_INCLUDE_DIR=/usr/include/elpa_openmp-$_ELPAVER
  make
}

package() {
  cd "$srcdir/build"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install ../$_PkgName-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname"
  make DESTDIR="$pkgdir" install
  install -m755 src/mod_files/*.mod "$pkgdir/usr/include/sirius"
  mv "$pkgdir/usr/bin/atom" "$pkgdir/usr/bin/sirius_atom"
}
