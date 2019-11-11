# Maintainer: Mathieu Westphal <mathieu.westphal@kitware.com>

# Follow the paraview PKGBUILD in the official repositories as closely as possible.

_pkgname=paraview
pkgname=$_pkgname-git
pkgrel=1
pkgver=v5.7.0.r726.g5296521c81
pkgdesc="Open-source, multi-platform data analysis and visualization application"
arch=(x86_64)
url="https://www.paraview.org"
provides=(paraview)
conflicts=(paraview)
license=(BSD custom)
depends=(boost-libs qt5-tools qt5-x11extras intel-tbb openmpi ffmpeg ospray
         python-numpy cgns protobuf
         double-conversion expat freetype2 gdal glew hdf5 libjpeg jsoncpp
         libjsoncpp.so libxml2 lz4 xz python-mpi4py netcdf libpng pdal
         libtiff zlib)
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

    # Flags to enable system libs in VTK building, as in VTK package
    # GL2PS has non-upstreamed patches
    # LIBHARU blocked by https://github.com/libharu/libharu/pull/157
    local VTK_USE_SYSTEM_LIB=""
    for lib in doubleconversion eigen expat freetype glew hdf5 jpeg jsoncpp libxml2 lz4 lzma mpi4py netcdf png tiff utf8 zlib
    do
        VTK_USE_SYSTEM_LIB+="-DVTK_MODULE_USE_EXTERNAL_VTK_${lib}:BOOL=ON "
    done
    # Specific system libs for ParaView version
    for lib in cgns protobuf
    do
        VTK_USE_SYSTEM_LIB+="-DVTK_MODULE_USE_EXTERNAL_ParaView_${lib}:BOOL=ON "
    done

    cmake ../$_pkgname \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPARAVIEW_ENABLE_FFMPEG=ON \
        -DPARAVIEW_ENABLE_GDAL=ON \
        -DPARAVIEW_ENABLE_PDAL=ON \
        -DPARAVIEW_ENABLE_PYTHON=ON \
        -DPARAVIEW_ENABLE_XDMF3=ON \
        -DPARAVIEW_ENABLE_MOTIONFX=ON \
        -DPARAVIEW_ENABLE_VISITBRIDGE=ON \
        -DPARAVIEW_INSTALL_DEVELOPMENT_FILES=ON \
        -DPARAVIEW_USE_MPI=ON \
        -DPARAVIEW_USE_RAYTRACING=ON \
        -DVTK_SMP_IMPLEMENTATION_TYPE=TBB \
        -DVTKm_ENABLE_MPI=ON \
        ${VTK_USE_SYSTEM_LIB} \
        -GNinja

    ninja ${MAKEFLAGS}
}

package() {
    cd build

    DESTDIR="${pkgdir}" ninja install

    # Install license
    install -Dm644 "${srcdir}"/$_pkgname/License_v1.2.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
