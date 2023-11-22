# Maintainer:  Renato Caldas <renato at calgera dot com>
# Contributor:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: saxonbeta <saxonbeta [[at]] gmail _dot com
# Contributor: Randy Heydon <randy dot heydon at clockworklab dot net>

pkgname=elmerfem
pkgver=9.0
pkgrel=4
pkgdesc="A finite element software for multiphysical problems"
arch=('x86_64')
url="http://www.elmerfem.org"
license=('GPL')
depends=('arpack' 'blas' 'qt5-script' 'netcdf-fortran' 'mmg' 'glu' 'qwt')
makedepends=('gcc-fortran' 'cmake' 'cli11')
conflicts=('elmerfem-git')
source=("https://github.com/ElmerCSC/$pkgname/archive/release-$pkgver.tar.gz"
        "$pkgname.desktop"
        "ElmerIce.patch"
        "DCRComplexSolve.patch"
        "qwt_6.2.patch")
sha256sums=('08c5bf261e87ff37456c1aa0372db3c83efabe4473ea3ea0b8ec66f5944d1aa0'
            'f4b39389e5f258c7860b8d7a6b171fb54bf849dc772f640ac5e7a12c7a384aca'
            '90287c988ac4f5beedf5221e81f624799ec3253c63a30695e1873044ac5a6515'
            'fe117a9d803b7a12525d144fae936e1d3d7a3444c5b5a5697f95f772486a2db0'
            'b6ed988029169a5af745187d6ffb3e73cb81f5287944aab273e4a1fdf50af91f')
options=(!emptydirs !makeflags)

prepare() {
  cd "$srcdir/$pkgname-release-$pkgver"
  mkdir ../build
  patch -p0 < "$srcdir/ElmerIce.patch"
  patch -p0 < "$srcdir/DCRComplexSolve.patch"
  patch -p1 < "$srcdir/qwt_6.2.patch"
  sed -i '/#include <QPainter>/a #include <QPainterPath>' ElmerGUI/Application/twod/renderarea.cpp
  sed -i 's#mmg/mmg3d/libmmgtypesf.h#mmg/common/libmmgtypesf.h#g' elmerice/Solvers/CalvingRemeshMMG.F90
}

build() {
  cd "$srcdir/build"
  cmake ../$pkgname-release-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="$CFLAGS -Wno-error=format-security" \
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
    -DWITH_VTK=OFF \
    -DWITH_MKL=OFF \
    -DWITH_PYTHONQT=OFF \
    -DWITH_QWT=ON \
    -DOpenGL_GL_PREFERENCE=GLVND
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
  install -D -m644 "$srcdir/$pkgname-release-$pkgver/ElmerGUI/Application/images/logo.png" \
    share/pixmaps/$pkgname.png
  install -D -m644 "$srcdir/$pkgname.desktop" share/applications

  # Clean up and move stuff in place
  cp share/ElmerGUI/edf-extra/* share/ElmerGUI/edf
  mv share/ElmerGUI/license_texts/GPL_EXCEPTION share/licenses/$pkgname
  rm share/ElmerGUI/license_texts/*
}
