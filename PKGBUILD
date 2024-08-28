#!/bin/hint/bash
# Maintainer : saxonbeta <saxonbeta at gmail __com
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Randy Heydon <randy dot heydon at clockworklab dot net>

# Configuration:
# Use: makepkg DISABLE_AUTOCONFIG=1 VAR1=0 VAR2=1 to enable(1) disable(0) a feature
# Use: {yay,paru} --mflags=DISABLE_AUTOCONFIG=1,VAR1=0,VAR2=1
# Use: aurutils --margs=DISABLE_AUTOCONFIG=1,VAR1=0,VAR2=1
# Use: DISABLE_AUTOCONFIG=1 VAR1=0 VAR2=1 pamac
# If parallel compilation fails due to race conditions, define NJOBS from 1 to ~24 jobs (try and error).

# Build using a working configuration that not depens on other AUR packages
# Use DISABLE_AUTOCONFIG=1 to build using all the available options (This can cause compilation problems)
#  or use the syntax mentioned earlier to enable the desired options
if((!DISABLE_AUTOCONFIG)); then
  DISABLE_CHECK=1
  DISABLE_TRILINOS=1
  DISABLE_MMG=1
  DISABLE_ELMERICE=1
  DISABLE_CONTRIB=1
  DISABLE_LUA=1
  DISABLE_MP=0
  DISABLE_GUI=0
  DISABLE_GUILOG=0
  DISABLE_GUITEST=0
  DISABLE_MATC=0
  DISABLE_PARAVIEW=0
  DISABLE_QWT=0
  #DISABLE_ZOLTAN
  #Open cascade needs VTK
  DISABLE_OCC=1
  DISABLE_VTK=0
  # VTK also needs MPI.
  DISABLE_MPI=0
  DISABLE_MUMPS=1
  DISABLE_HYPRE=1
  DISABLE_INTERNAL_UMFPACK=1
fi

# Use FRAGMENT=#{commit,tag,brach}=xxx for bisect build
_fragment=${FRAGMENT:-#branch=devel}

# Use CMAKE_FLAGS=xxx:yyy:zzz to define extra CMake flags
((CMAKE_FLAGS))      && mapfile -t -d: _CMAKE_FLAGS < <(echo -n "$CMAKE_FLAGS")

((DISABLE_ALL)) && eval DISABLE_{TRILINOS,MMG,ELMERICE,CONTRIB,LUA,GUI,MPI}=1
((DISABLE_TRILINOS)) && _use_trilinos=OFF || _use_trilinos=ON  # Disable Trilinos - linear system solver (Experimental)
((DISABLE_MMG))      && _use_mmg=OFF      || _use_mmg=ON       # Disable MMG - dynamic remeshing
((DISABLE_CONTRIB))  && _use_contrib=OFF  || _use_contrib=ON   # Disable multishell solver for composite lamitanes
((DISABLE_LUA))      && _use_lua=OFF      || _use_lua=ON       # Disable LUA scripting in solver definitions
((DISABLE_MP))       && _use_openmp=OFF   || _use_openmp=ON    # Disable OpenMP threading

((DISABLE_ELMERICE)) && _use_elmerice=OFF || _use_elmerice=ON  # Disable ElmerICE - glacier melting solver
((!DISABLE_ELMERICE)) && eval DISABLE_{INTERNAL_UMFPACK,MPI}=0 #Elmer Ice requires MPI and uses the internal UMFPack

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

((DISABLE_INTERNAL_UMFPACK)) && _use_external_umfpack=ON || _use_external_umfpack=OFF

# Disable check
((DISABLE_CHECK))    && _disable_check=OFF || _disable_check=ON # Disable CTEST Routines

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

        -DEXTERNAL_UMFPACK=${_use_external_umfpack}

        -GNinja
        -Wno-dev
)

pkgname=elmerfem-git
_pkgname=elmerfem
pkgver=9.0.r3061.gfe5423b11
pkgrel=1
pkgdesc="A finite element software for multiphysical problems"
arch=('x86_64')
url="http://www.elmerfem.org"
license=('GPL-2.0-or-later')
provides=('elmerfem')

#make deps
makedepends=('git' 'gcc-fortran' 'cmake' 'ninja')

# Core deps
depends+=('blas-openblas')

#conflicted deps
conflicts=('elmerfem' 'arpack')

# Main repos
((ENABLE_EXTERNAL_UMFPACK)) && depends+=('suitesparse')
((!DISABLE_GUI))      && depends+=('qt5-base' 'qt5-script' 'qt5-svg' 'glew')
((!DISABLE_QWT))      && depends+=('qwt')
# If VTK is enabled this line is redundant
((!DISABLE_MPI))      && depends+=('openmpi')
((!DISABLE_MPI))      && depends+=('netcdf-fortran-openmpi') || depends+=('netcdf-fortran')
((!DISABLE_MP))       && depends+=('openmp')
((!DISABLE_PARAVIEW)) && depends+=('paraview')
((!DISABLE_OCC))      && depends+=('opencascade')  # opencascade

#VTK deps
((!DISABLE_VTK))      && depends+=('vtk' 'tbb' 'openmpi' 'freetype2' 'qt5-base' 'fmt' 'glew' 'pugixml' 'libxcursor' 'mariadb-libs' 'jdk11-openjdk')
((!DISABLE_VTK))      && makedepends+=('cli11' 'ospray' 'openxr' 'openvr' 'python-mpi4py' 'boost' 'pdal' 'opencascade' \
                                        'liblas' 'adios2' 'libharu' 'cgns' 'eigen' 'utf8cpp' 'fast_float')

# AUR
((!DISABLE_MMG))      && depends+=('mmg')
((!DISABLE_TRILINOS)) && depends+=('trilinos')
((!DISABLE_MUMPS))    && depends+=('mumps')    # mumps
((!DISABLE_HYPRE))    && depends+=('hypre')

options=(!emptydirs !staticlibs)

source=("git+https://github.com/ElmerCSC/elmerfem.git${_fragment}"
        "$_pkgname.desktop")

sha256sums=('SKIP'
            'f4b39389e5f258c7860b8d7a6b171fb54bf849dc772f640ac5e7a12c7a384aca')

pkgver() {
  git -C "${srcdir}/${_pkgname}" describe --long --tag| sed -r 's/^release-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"
  if((!DISABLE_VTK)); then
     sed -i \
      's\Exec=ElmerGUI\Exec=LD_LIBRARY_PATH="/usr/lib/jvm/java-11-openjdk/lib;/usr/lib/jvm/java-11-openjdk/lib/server" ElmerGUI\g' \
      elmerfem.desktop
  fi
}

build() {
  export FFLAGS+=" -fallow-argument-mismatch"
  cmake -S "${srcdir}"/$_pkgname -B build \
        "${_CMAKE_FLAGS[@]}"
  # If not defined, ninja will use all the available CPUs
  if ((NJOBS)); then
    echo "$NJOBS CPUs used for compilation"
    ninja -j$NJOBS -C build all
  else
    echo "All CPUs used for compilation"
    ninja -C build all
  fi
}

check() {
if ((!DISABLE_CHECK)); then
  cd "$srcdir/build"
  export PATH=$PATH:$PWD/fem/src
  jobs=$(nproc)
  ((!DISABLE_MP)) && export OMP_NUM_THREADS=$jobs
  ctest -j "$((DISABLE_MPI?jobs:jobs/2))" -LE slow || ((DISABLE_CHECK)) && true # -LE slow: exclude test with label 'slow'
fi
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
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
