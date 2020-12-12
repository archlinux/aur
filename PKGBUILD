# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor:  saxonbeta <saxonbeta [[at]] gmail _dot com
# Contributor: Randy Heydon <randy dot heydon at clockworklab dot net>

pkgname=elmerfem
pkgver=8.4
pkgrel=4
pkgdesc="A finite element software for multiphysical problems"
arch=('x86_64')
url="http://www.elmerfem.org"
license=('GPL')
depends=('arpack' 'blas' 'qt5-script' 'netcdf-fortran' 'mmg' 'paraview')
makedepends=('gcc-fortran' 'cmake')
conflicts=('elmerfem-git')
options=(!emptydirs !makeflags)
source=("https://github.com/ElmerCSC/$pkgname/archive/release-$pkgver.tar.gz"
        "ElmerIce.patch"
        "$pkgname.desktop")
sha256sums=('cc3ce807d76798361592cc14952cdc3db1ad8f9bac038017514033ce9badc5b3'
            '90287c988ac4f5beedf5221e81f624799ec3253c63a30695e1873044ac5a6515'
            'f4b39389e5f258c7860b8d7a6b171fb54bf849dc772f640ac5e7a12c7a384aca')

prepare() {
  cd "$srcdir/$pkgname-release-$pkgver"
  mkdir ../build
  patch -p0 < "$srcdir/ElmerIce.patch"
  sed -i 's/1 depth/1 ${depth}/g' fem/tests/CMakeLists.txt
  sed -i '/#include <QPainter>/a #include <QPainterPath>' ElmerGUI/Application/twod/renderarea.cpp
}

build() {
  cd "$srcdir/build"
  cmake ../$pkgname-release-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_Fortran_FLAGS="$FCFLAGS -fallow-argument-mismatch -fallow-invalid-boz" \
    -DMPI_Fortran_COMPILE_FLAGS="$FCFLAGS -fallow-argument-mismatch -fallow-invalid-boz" \
    -DELMER_INSTALL_LIB_DIR=/usr/lib \
    -DWITH_CONTRIB=ON \
    -DWITH_ELMERGUI=ON \
    -DWITH_ElmerIce=ON \
    -DWITH_LUA=ON \
    -DWITH_MATC=ON \
    -DWITH_MPI=ON \
    -DWITH_OpenMP=ON \
    -DWITH_QT5=ON \
    -DWITH_ScatteredDataInterpolator=ON \
    -DWITH_PARAVIEW=ON
  make all
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  cd "$pkgdir/usr"
  
  # Remove unecessary libraries
  rm -rf -- lib/{*.a,*arpack.so,ElmerGUI}

  # Create directories
  install -dv share/{applications,pixmaps,licenses/$pkgname}

  # Icon and desktop files
  install -D -m644 "$srcdir/$pkgname-release-$pkgver/ElmerGUI/Application/images/logo.png" share/pixmaps/$pkgname.png
  install -D -m644 "$srcdir/$pkgname.desktop" share/applications

  # Clean up and move stuff in place
  cp share/ElmerGUI/edf-extra/* share/ElmerGUI/edf
  mv share/ElmerGUI/license_texts/GPL_EXCEPTION share/licenses/$pkgname
  rm share/ElmerGUI/license_texts/*
}
