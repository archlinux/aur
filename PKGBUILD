# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>

pkgname=vtk9
pkgver=9.0.1
pkgrel=4
pkgdesc='A software system for 3D computer graphics, image processing, and visualization'
arch=('x86_64')
url="http://vtk.org"
license=('BSD')
depends=('freetype2' 'jsoncpp' 'libharu' 'libjpeg-turbo' 'libogg' 'libpng' 'libtheora' 'libtiff' 'libxml2' 'lzip' 'python' 'sqlite' 'zlib' 'ospray' 'openimagedenoise' 'libxt' 'double-conversion' 'glew' 'eigen' 'expat' 'lz4' 'hdf5' 'proj' 'utf8cpp' 'pugixml' 'netcdf' 'pegtl' 'gl2ps')
makedepends=('cmake')
provides=('vtk')
conflicts=('vtk')
source=("https://gitlab.kitware.com/vtk/vtk/-/archive/v${pkgver}/vtk-v${pkgver}.tar.gz"
        "freetype.patch")
sha256sums=("15c269946a8a8ed578bbd28a59672c251089185d582cd1268658908bf414e017"
            "aa2daca929f4bc75809dcfe959b1bf6f8b81450a8c29892c73420711823d1438")

prepare() {
    cd "$srcdir/vtk-v${pkgver}"
    patch -p1 < "${srcdir}/freetype.patch"
}

build() {
    cd "$srcdir/vtk-v${pkgver}"
    mkdir -p build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DVTK_BUILD_TESTING=OFF \
          -DBUILD_SHARED_LIBS=ON \
          -DVTK_LEGACY_REMOVE=ON \
          -DVTK_SMP_IMPLEMENTATION_TYPE=TBB \
          -DVTK_WRAP_PYTHON=ON \
          -DVTK_PYTHON_VERSION=3 \
          -DVTK_MODULE_USE_EXTERNAL_VTK_doubleconversion=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_eigen=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_expat=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_freetype=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_gl2ps=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_glew=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_hdf5=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_jpeg=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_jsoncpp=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_libharu=OFF \
          -DVTK_MODULE_USE_EXTERNAL_VTK_libproj=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_libxml2=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_lz4=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_lzma=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_netcdf=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_ogg=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_pegtl=OFF \
          -DVTK_MODULE_USE_EXTERNAL_VTK_png=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_pugixml=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_sqlite=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_theora=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_tiff=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_utf8=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_zlib=ON \
          -DVTK_MODULE_ENABLE_VTK_RenderingRayTracing=WANT \
          -DVTK_ENABLE_OSPRAY=OFF \
          ..
    make
}

package() {
    cd "$srcdir/vtk-v${pkgver}/build"
    make DESTDIR="$pkgdir" install
}

