# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor:  Oliver Goethel <deezy>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Mathias Anselmann <mathias.anselmann@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Michele Mocciola <mickele>
# Contributor: Simon Zilliken <simon____AT____zilliken____DOT____name>

pkgname=paraview-superbuild
pkgver=5.4.1
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (built using superbuild system)'
arch=('i686' 'x86_64')
url='http://www.paraview.org'
license=('custom')
depends=('bzip2' 'freetype2' 'glu' 'python2-matplotlib' 'mesa'
         'openmpi' 'python2-numpy' 'libpng' 'zlib' 'gperf'
         'libxt' 'qt5-x11extras' 'qt5-tools' 'qt5-xmlpatterns' 'boost')
makedepends=('cmake' 'gcc-fortran' 'git' 'llvm')
source=("git+https://gitlab.kitware.com/paraview/paraview-superbuild.git#tag=v${pkgver}"
        "paraview-superbuild.sh"
        "fontconfig_2.12.6.patch")
sha1sums=('SKIP'
          'bb389666a765ff558233fced708e3a9c991b0650'
          '2cbe4244eb4e752dad0ee991254d717313592647'
          '78bce3d15e1577602a69468dd5360d0ef66a13d4')
provides=('paraview')

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule init
  git submodule update

  #rm -rf "${srcdir}/build"
  mkdir -p "${srcdir}/build"

  cd "${srcdir}/${pkgname}/superbuild"
  patch -p1 < "${srcdir}"/fontconfig_2.12.6.patch
}

build() {
  cd "${srcdir}/build"

  cmake \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_TESTING:BOOL=OFF \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_BUILD_TYPE_paraview:STRING=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/opt/${pkgname} \
    -DENABLE_adios:BOOL=OFF \
    -DENABLE_boost:BOOL=ON \
    -DENABLE_bzip2:BOOL=ON \
    -DENABLE_catalyst:BOOL=OFF \
    -DENABLE_cgns:BOOL=ON \
    -DENABLE_cosmotools:BOOL=ON \
    -DENABLE_egl:BOOL=OFF \
    -DENABLE_ffmpeg:BOOL=ON \
    -DENABLE_fontconfig:BOOL=ON \
    -DENABLE_freetype:BOOL=ON \
    -DENABLE_genericio:BOOL=ON \
    -DENABLE_hdf5:BOOL=ON \
    -DENABLE_libxml2:BOOL=ON \
    -DENABLE_llvm:BOOL=ON \
    -DENABLE_matplotlib:BOOL=ON \
    -DENABLE_mesa:BOOL=OFF \
    -DENABLE_mpi:BOOL=ON \
    -DENABLE_netcdf:BOOL=ON \
    -DENABLE_numpy:BOOL=ON \
    -DENABLE_osmesa:BOOL=OFF \
    -DENABLE_ospray:BOOL=ON \
    -DENABLE_paraview:BOOL=ON \
    -DENABLE_paraviewgettingstartedguide:BOOL=OFF \
    -DENABLE_paraviewsdk:BOOL=OFF \
    -DENABLE_paraviewtutorial:BOOL=OFF \
    -DENABLE_paraviewtutorialdata:BOOL=OFF \
    -DENABLE_paraviewusersguide:BOOL=OFF \
    -DENABLE_paraviewweb:BOOL=ON \
    -DENABLE_paraviewweblightviz:BOOL=ON \
    -DENABLE_paraviewwebvisualizer:BOOL=ON \
    -DENABLE_png:BOOL=ON \
    -DENABLE_python:BOOL=ON \
    -DENABLE_pythonsetuptools:BOOL=ON \
    -DENABLE_qt4:BOOL=OFF \
    -DENABLE_qt5:BOOL=ON \
    -DENABLE_silo:BOOL=ON \
    -DENABLE_socat:BOOL=ON \
    -DENABLE_szip:BOOL=ON \
    -DENABLE_visitbridge:BOOL=OFF \
    -DENABLE_vortexfinder2:BOOL=OFF \
    -DENABLE_vrpn:BOOL=OFF \
    -DENABLE_xdmf3:BOOL=ON \
    -DENABLE_zlib:BOOL=ON \
    -DSUPERBUILD_PROJECT_PARALLELISM=2 \
    -DUSE_SYSTEM_adios:BOOL=OFF \
    -DUSE_SYSTEM_boost:BOOL=ON \
    -DUSE_SYSTEM_bzip2:BOOL=ON \
    -DUSE_SYSTEM_freetype:BOOL=ON \
    -DUSE_SYSTEM_glu:BOOL=ON \
    -DUSE_SYSTEM_hdf5:BOOL=OFF \
    -DUSE_SYSTEM_libxml2:BOOL=OFF \
    -DUSE_SYSTEM_llvm:BOOL=ON \
    -DUSE_SYSTEM_matplotlib:BOOL=ON \
    -DUSE_SYSTEM_mesa:BOOL=ON \
    -DUSE_SYSTEM_mpi:BOOL=ON \
    -DUSE_SYSTEM_mxml:BOOL=OFF \
    -DUSE_SYSTEM_numpy:BOOL=ON \
    -DUSE_SYSTEM_osmesa:BOOL=OFF \
    -DUSE_SYSTEM_png:BOOL=ON \
    -DUSE_SYSTEM_python:BOOL=ON \
    -DUSE_SYSTEM_qt4:BOOL=OFF \
    -DUSE_SYSTEM_qt5:BOOL=ON \
    -DUSE_SYSTEM_tbb:BOOL=OFF \
    -DUSE_SYSTEM_zlib:BOOL=ON \
    -Dparaview_SOURCE_SELECTION=${pkgver} \
    "${srcdir}/${pkgname}"

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  rm -rf -- ${pkgdir}/home

  # Install script to set path
  install -Dm755 "${srcdir}/paraview-superbuild.sh" \
    "${pkgdir}/etc/profile.d/paraview-superbuild.sh"
}
