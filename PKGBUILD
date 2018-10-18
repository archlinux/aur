# Maintainer: Mathieu Westphal <mathieu.westphal@kitware.com>

# Follow the paraview PKGBUILD in the official repositories as closely as possible.

_pkgname=paraview
pkgname=$_pkgname-git
pkgrel=1
pkgver=v5.6.0.RC2.r314.gfd39ef33ba
pkgdesc="Open-source, multi-platform data analysis and visualization application"
arch=('x86_64')
url="https://www.paraview.org/"
provides=(paraview)
conflicts=(paraview)
license=('custom')
depends=('qt5-tools' 'qt5-x11extras' 'ospray' 'ffmpeg' 'openmpi'
         'cgns' 'python-pygments' 'protobuf' 'pugixml'
         'python-matplotlib' 'python-numpy' 'python-mpi4py'
         'boost-libs' 'glew' 'expat' 'freetype2'
         'libjpeg' 'jsoncpp' 'libxml2' 'libpng'
         'libtiff' 'zlib' 'hdf5' 'lz4' 'netcdf' 'intel-tbb')
makedepends=('cmake' 'boost' 'mesa' 'gcc-fortran' 'ninja' 'qt5-tools' 'qt5-xmlpatterns' 'eigen' 'git')
source=("git+https://gitlab.kitware.com/paraview/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
  cd "$_pkgname"
  git submodule update --init --recursive
}

build() {
  cd build
  # Flags to enable system libs in VTK building, as in VTK package
  # NETCDFCPP status?
  # GL2PS fails.
  # libharu blocked by https://github.com/libharu/libharu/pull/157
  # LIBPROJ4 apparently not used in this VTK configuration
  local VTK_USE_SYSTEM_LIB=""
  for lib in EXPAT FREETYPE JPEG PNG TIFF ZLIB LIBXML2 MPI4PY JSONCPP GLEW HDF5 LZ4 NETCDF EIGEN
  do
      VTK_USE_SYSTEM_LIB+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done
  # Specific system libs for ParaView version
  for lib in CGNS PUGIXML PROTOBUF PYGMENTS
  do
      VTK_USE_SYSTEM_LIB+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOSPRAY_INSTALL_DIR=/usr \
    -DPARAVIEW_ENABLE_FFMPEG=ON \
    -DPARAVIEW_ENABLE_MATPLOTLIB=ON \
    -DPARAVIEW_ENABLE_PYTHON=ON \
    -DPARAVIEW_INSTALL_DEVELOPMENT_FILES=ON \
    -DPARAVIEW_USE_MPI=ON \
    -DPARAVIEW_USE_VISITBRIDGE=ON \
    -DPARAVIEW_USE_OSPRAY=ON \
    -DVISIT_BUILD_READER_CGNS=ON \
    -DVTK_PYTHON_FULL_THREADSAFE=ON \
    -DVTK_PYTHON_VERSION=3 \
    -DVTK_SMP_IMPLEMENTATION_TYPE=TBB \
    ${VTK_USE_SYSTEM_LIB} \
    -GNinja \
    "$srcdir/$_pkgname"

  ninja ${MAKEFLAGS}
}

package() {
  cd build

  DESTDIR="$pkgdir" ninja install

  install -Dm644 "$srcdir/$_pkgname/License_v1.2.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -- "$pkgdir"/usr/share/man/man3/icet*.3
  rmdir "$pkgdir"/usr/share/man/{man3/,}
}
