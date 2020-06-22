# Maintainer: Mathieu Westphal <mathieu.westphal@kitware.com>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Stéane Gaudreault <stephane@archlinux.org>
# Contributor: <xantares09@hotmail.com>

# Follow the paraview PKGBUILD in the official repositories as closely as possible.

_pkgname=paraview
pkgname=$_pkgname-git
pkgrel=1
pkgver=v5.8.1.RC1.r819.g08210ebaca
pkgdesc="Open-source, multi-platform data analysis and visualization application"
arch=(x86_64)
url="https://www.paraview.org"
provides=(paraview)
conflicts=(paraview vtk)
license=(BSD custom)
depends=(boost-libs qt5-tools qt5-x11extras qt5-svg intel-tbb openmpi ffmpeg
         ospray python-numpy cgns protobuf
         double-conversion expat freetype2 gdal glew hdf5 libjpeg jsoncpp
         libjsoncpp.so libxml2 lz4 xz python-mpi4py netcdf libpng pdal
         libtiff zlib pegtl)
#        gl2ps
#        libharu
optdepends=(python-matplotlib)
makedepends=(cmake boost mesa gcc-fortran ninja qt5-tools qt5-xmlpatterns eigen utf8cpp)
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

    # Note regarding use of system dependencies:
    # GL2PS has non-upstreamed patches
    # LIBHARU blocked by https://github.com/libharu/libharu/pull/157
    cmake ../$_pkgname \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPARAVIEW_ENABLE_FFMPEG=ON \
        -DPARAVIEW_ENABLE_GDAL=ON \
        -DPARAVIEW_ENABLE_MOTIONFX=ON \
        -DPARAVIEW_ENABLE_PDAL=ON \
        -DPARAVIEW_ENABLE_VISITBRIDGE=ON \
        -DPARAVIEW_ENABLE_XDMF3=ON \
        -DPARAVIEW_INSTALL_DEVELOPMENT_FILES=ON \
        -DPARAVIEW_USE_MPI=ON \
        -DPARAVIEW_USE_PYTHON=ON \
        -DPARAVIEW_ENABLE_RAYTRACING=ON \
        -DPARAVIEW_BUILD_WITH_EXTERNAL=ON \
        -DVTK_MODULE_USE_EXTERNAL_VTK_gl2ps=OFF \
        -DVTK_MODULE_USE_EXTERNAL_VTK_libharu=OFF \
        -DVTK_SMP_IMPLEMENTATION_TYPE=TBB \
        -DVTKm_ENABLE_MPI=ON \
        -GNinja

    ninja ${MAKEFLAGS}
}

package() {
    cd build

    DESTDIR="${pkgdir}" ninja install

    # Install license
    install -Dm644 "${srcdir}"/$_pkgname/License_v1.2.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
