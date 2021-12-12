#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Randy Heydon <randy dot heydon at clockworklab dot net>
# Contributor: saxonbeta <saxonbeta at gmail __com

# matc is currently bugged: https://github.com/ElmerCSC/elmerfem/issues/306
DISABLE_MATC=1
# allow build with `intel-mkl`

# Configuration:
# Use: makepkg VAR1=0 VAR2=1 to enable(1) disable(0) a feature
# Use: {yay,paru} --mflags=VAR1=0,VAR2=1
# Use: aurutils --margs=VAR1=0,VAR2=1
# Use: VAR1=0 VAR2=1 pamac

# Use FRAGMENT=#{commit,tag,brach}=xxx for bisect build
_fragment=${FRAGMENT:-#branch=devel}
# Use CMAKE_FLAGS=xxx:yyy:zzz to define extra CMake flags
((CMAKE_FLAGS))      && mapfile -t -d: _CMAKE_FLAGS < <(echo -n "$CMAKE_FLAGS")

((DISABLE_ALL)) && eval DISABLE_{TRILINOS,MMG,ELMERICE,CONTRIB,LUA,GUI,MPI}=1
((DISABLE_TRILINOS)) && _use_trilinos=OFF || _use_trilinos=ON  # Disable Trilinos - linear system solver (Experimental)
((DISABLE_MMG))      && _use_mmg=OFF      || _use_mmg=ON       # Disable MMG - dynamic remeshing
((DISABLE_ELMERICE)) && _use_elmerice=OFF || _use_elmerice=ON  # Disable ElmerICE - glacier melting solver
((DISABLE_CONTRIB))  && _use_contrib=OFF  || _use_contrib=ON   # Disable multishell solver for composite lamitanes
((DISABLE_LUA))      && _use_lua=OFF      || _use_lua=ON       # Disable LUA scripting in solver definitions
((DISABLE_MP))       && _use_openmp=OFF   || _use_openmp=ON    # Disable OpenMP threading

((DISABLE_GUI))      && _use_elmergui=OFF || _use_elmergui=ON  # Disable ElmerGUI - QT GUI
# Requires GUI
((DISABLE_GUI))      && eval DISABLE_{GUILOG,GUITEST,MATC,OCC,PARAVIEW,QWT,VTK}=1
((DISABLE_GUILOG))   && _use_guilog=OFF   || _use_guilog=ON    # Disable ElmerGUI Logger
((DISABLE_GUITEST))  && _use_guitest=OFF  || _use_guitest=ON   # Disable ElmerGUI Tests
((DISABLE_OCC))      && _use_occ=OFF      || _use_occ=ON       # Disable OCC - OpenCOLADA cad model import
((DISABLE_MATC))     && _use_matc=OFF     || _use_matc=ON      # Disable MatC scripting in QT GUI
((DISABLE_PARAVIEW)) && _use_paraview=OFF || _use_paraview=ON  # Disable ParaView - GUI post-process exporter
((DISABLE_QWT))      && _use_qwt=OFF      || _use_qwt=ON       # Disable QWT - GUI convergence monitoring
((DISABLE_VTK))      && _use_vtk=OFF      || _use_vtk=ON       # Disable VTK - GUI post-process Widget and exporter

((DISABLE_MPI))      && _use_mpi=OFF      || _use_mpi=ON       # Disable OpenMPI parallelization
# Require OpenMPI
((DISABLE_MPI))      && eval DISABLE_{MUMPS,HYPRE}=1
((DISABLE_MUMPS))    && _use_mumps=OFF    || _use_mumps=ON     # Disable Mumps - gausian elimination LAS solver
((DISABLE_HYPRE))    && _use_hypre=OFF    || _use_hypre=ON     # Disable Hypre - multigrid LAS solver

_CMAKE_FLAGS+=(
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=/usr
        -DELMER_INSTALL_LIB_DIR=/usr/lib

        -DWITH_MPI=${_use_mpi}
        -DWITH_Mumps=${_use_mumps}
        -DWITH_Hypre=${_use_hypre}

        -DWITH_OpenMP=${_use_openmp}

        -DNN_INCLUDE_DIR=/usr/include
        -DHYPRE_INCLUDE_DIR=/usr/include/hypre
        -DPHDF5HL_LIBRARY=/usr/lib/libhdf5_hl.so
        -DWITH_ScatteredDataInterpolator=ON

        -DWITH_ELMERGUI=${_use_elmergui}
        -DWITH_QT5=${_use_elmergui}
        -DWITH_ELMERGUILOGGER=${_use_guilog}
        -DWITH_ELMERGUITESTER=${_use_guitest}

        -DWITH_MATC=${_use_matc}
        -DWITH_LUA=${_use_lua}
        -DWITH_OCC=${_use_occ}
        -DWITH_QWT=${_use_qwt}
        -DWITH_CONTRIB=${_use_contrib}
        -DWITH_ElmerIce=${_use_elmerice}
        -DWITH_VTK=${_use_vtk}
        -DWITH_PARAVIEW=${_use_paraview}
        -DWITH_Trilinos=${_use_trilinos}
)

pkgname=elmerfem-git
_pkgname=elmerfem
pkgver=9.0.r741.g7665920e
pkgrel=1
pkgdesc="A finite element software for multiphysical problems"
arch=('x86_64')
url="http://www.elmerfem.org"
license=('GPL')

# Core deps
depends+=('arpack' 'blas' 'libnn-git' 'libcsa-git' 'scalapack')
#depends+=('python-pyqt5')
((!DISABLE_MPI))      && depends+=('netcdf-fortran-openmpi') || depends+=('netcdf-fortran')
# Main repos
((!DISABLE_GUI))      && depends+=('qt5-base' 'qt5-script' 'qt5-svg' 'glew')
((!DISABLE_QWT))      && depends+=('qwt')
((!DISABLE_VTK))      && depends+=('vtk' 'tbb' 'openmpi' 'freetype2' 'qt5-base' 'fmt' 'glew' 'pugixml' 'libxcursor')
# AUR
((!DISABLE_MMG))      && depends+=('mmg')
((!DISABLE_TRILINOS)) && depends+=('trilinos')
((!DISABLE_PARAVIEW)) && depends+=('paraview-opt') # paraview<>vtk conflict
((!DISABLE_MUMPS))    && depends+=('mumps-par')    # mumps
((!DISABLE_OCC))      && depends+=('opencascade')  # opencascade
((!DISABLE_HYPRE))    && depends+=('hypre')
((!DISABLE_MPI))      && depends+=('openmpi')
((!DISABLE_MP))       && depends+=('openmp')

makedepends=('git' 'gcc-fortran' 'cmake')
provides=('elmerfem')
conflicts=('elmerfem')
options=(!emptydirs !staticlibs)

source=("git+https://github.com/ElmerCSC/elmerfem.git${_fragment}"
        "$_pkgname.desktop"
        "arpack.patch"
        "print_target_properties.patch"
        "vtk9.cmake.patch"
        "vtk9.1.patch::https://github.com/ElmerCSC/elmerfem/pull/308.patch"
        "cmake-fix.patch::https://github.com/ElmerCSC/elmerfem/pull/309.patch"
        "FindMMG.patch")

sha256sums=('SKIP'
            'f4b39389e5f258c7860b8d7a6b171fb54bf849dc772f640ac5e7a12c7a384aca'
            '04e73a99d7e8d501a2c7c5211a83257137a30a8b1b5c2f7c7ff6304e0e0a6da9'
            'da0245b22e305591913e1f78c5808a2aa33b9380a6052e5596fc16280234aac0'
            '535b030ce72952ae6c0d0e5574d343b2236be0451d3ce287d9b956ca61d072ff'
            '5b72df017d8a5c1d482798d9fcd72e92c319844123f4a2dab57db56d340f998e'
            '1e2c5b810dc9388f837d79c25a419d3ab250fa084b7b8f1d5b6cbe9b8dd537bf'
            '89b0e79ca1ad8952839d0578cdbce86ea4dad46e3c68aa1ce5b8b83bcff94e57')

pkgver() {
  git -C "${srcdir}/${_pkgname}" describe --long --tag| sed -r 's/^release-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's/1 depth/1 ${depth}/g' fem/tests/CMakeLists.txt
  sed -i 's/FALSE/false/g' ElmerGUI/Application/vtkpost/matc.cpp
  sed -i '/OCE/s/DIRS/DIR/g;s/OCE/OpenCASCADE/g' ElmerGUI{/,/Application}/CMakeLists.txt
  sed -i '/BRepMesh.hxx/d' ElmerGUI/Application/cad/cadview.cpp
  ((!DISABLE_VTK)) && patch+=(vtk9{.1,.cmake}.patch)
  ((!DISABLE_MMG)) && patch+=({FindMMG,print_target_properties}.patch)
  for patch in "${srcdir}"/{arpack,cmake-fix}.patch "${patch[@]/#/${srcdir}/}"
  do msg2 "Apply: ${patch##*/}"; git apply -v "$patch"
  done
}

build() {
  export FFLAGS+=" -fallow-argument-mismatch"
  cmake -S "${srcdir}"/$_pkgname -B build \
        "${_CMAKE_FLAGS[@]}"
  cmake --build build -- all
}

check() {
  cd "$srcdir/build"
  export PATH=$PATH:$PWD/fem/src
  jobs=$(grep -oP -- "-j\s*\K[0-9]+" <<< "${MAKEFLAGS}")
  ((!DISABLE_MP)) && export OMP_NUM_THREADS=$jobs
  ctest -j "$((DISABLE_MPI?jobs:jobs/2))" -LE slow || ((DISABLE_CHECK)) && true # -LE slow: exclude test with label 'slow'
}

package() {
  make -C build DESTDIR="$pkgdir" install
  cd "$pkgdir/usr"

if ((!DISABLE_GUI)); then
  # Remove unecessary libraries
  rm -rf -- lib/{*.a,ElmerGUI}

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
fi
}
# vim:set sw=2 ts=2 et:
