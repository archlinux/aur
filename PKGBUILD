#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Randy Heydon <randy dot heydon at clockworklab dot net>
# Contributor: saxonbeta <saxonbeta at gmail __com

# Configuration.
_CMAKE_FLAGS+=(
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DELMER_INSTALL_LIB_DIR=/usr/lib \
        -DWITH_CONTRIB=ON \
        -DWITH_ELMERGUI=ON \
        -DWITH_ELMERGUILOGGER=OFF \
        -DWITH_ELMERGUITESTER=OFF \
        -DWITH_ElmerIce=ON \
        -DPHDF5HL_LIBRARY=/usr/lib/libhdf5_hl.so \
        -DWITH_LUA=ON \
        -DWITH_MATC=OFF \
        -DWITH_MPI=ON \
        -DWITH_OpenMP=ON \
        -DWITH_QT5=ON \
        -DWITH_Mumps=ON \
        -DWITH_Hypre=ON \
        -DWITH_OCC=ON \
        -DWITH_VTK=ON \
        -DNN_INCLUDE_DIR=/usr/include \
        -DHYPRE_INCLUDE_DIR=/usr/include/hypre \
        -DWITH_ScatteredDataInterpolator=ON \
        -DWITH_PARAVIEW=ON
)

pkgname=elmerfem-git
_pkgname=elmerfem
pkgver=9.0.r423.gb943299d
pkgrel=1
pkgdesc="A finite element software for multiphysical problems"
arch=('x86_64')
url="http://www.elmerfem.org"
license=('GPL')
depends=('arpack' 'blas' 'qt5-script' 'python-pyqt5' 'qwt' 'netcdf-fortran-openmpi' 'paraview-opt' 'mumps-par' 'oce' 'vtk' 'hypre' 'mmg3d' 'libnn-git' 'libcsa-git' 'scalapack')
makedepends=('git' 'gcc-fortran' 'cmake')
provides=('elmerfem')
conflicts=('elmerfem')
options=(!emptydirs !makeflags)

source=('git+https://github.com/ElmerCSC/elmerfem.git'
        "$_pkgname.desktop")

sha256sums=('SKIP'
            'f4b39389e5f258c7860b8d7a6b171fb54bf849dc772f640ac5e7a12c7a384aca')

pkgver() {
  git -C "${srcdir}/${_pkgname}" describe --long --tag| sed -r 's/^release-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's/1 depth/1 ${depth}/g' fem/tests/CMakeLists.txt
  sed -i 's/FALSE/false/g' ElmerGUI/Application/vtkpost/matc.cpp
}

build() {
  export FFLAGS+=" -fallow-argument-mismatch"
  cmake -S "${srcdir}"/$_pkgname -B build \
        "${_CMAKE_FLAGS[@]}"
  make -C build all
}

# check() {
#   cd "$srcdir/build"
#   export PATH=$PATH:$PWD/fem/src
#   ctest -j$( grep -c ^processor /proc/cpuinfo )
# }

package() {
  make -C build DESTDIR="$pkgdir" install
  cd "$pkgdir/usr"

  # Remove unecessary libraries
  rm -rf -- lib/{*.a,*arpack.so,ElmerGUI}

  #Create directories
  install -dv share/applications
  install -dv share/pixmaps
  install -dv share/licenses/$_pkgname

  #Icon and desktop files
  install -D -m644 "$srcdir/$_pkgname/ElmerGUI/Application/images/logo.png" share/pixmaps/$_pkgname.png
  install -D -m644 "$srcdir/$_pkgname.desktop" share/applications

  #Clean up and move stuff in place
  cp share/ElmerGUI/edf-extra/* share/ElmerGUI/edf
  mv share/ElmerGUI/license_texts/GPL_EXCEPTION share/licenses/$_pkgname
  rm share/ElmerGUI/license_texts/*
}
# vim:set sw=2 ts=2 et:
