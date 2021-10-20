# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>

pkgname=vtk9
pkgver=9.0.3
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization'
arch=('x86_64')
url="http://vtk.org"
license=('BSD')
depends=('freetype2' 'jsoncpp' 'libharu' 'libjpeg-turbo' 'libogg' 'libpng' 'libtheora' 'libtiff' 'libxml2' 'lzip' 'python' 'sqlite' 'zlib' 'ospray' 'openimagedenoise' 'libxt' 'double-conversion' 'glew' 'eigen' 'expat' 'lz4' 'hdf5' 'proj' 'utf8cpp' 'pugixml' 'netcdf' 'pegtl' 'gl2ps')
makedepends=('cmake' 'eigen' )
provides=('vtk')
conflicts=('vtk')
source=("https://gitlab.kitware.com/vtk/vtk/-/archive/v${pkgver}/vtk-v${pkgver}.tar.gz"
        "freetype.patch"
	"limits.patch")
sha256sums=("4d27b42d208bd61506f8508cbb1c35ee803a4432b4146fd8ac0d45bf1a7ffce8"
            "aa2daca929f4bc75809dcfe959b1bf6f8b81450a8c29892c73420711823d1438"
            "e626da07b165c59fcd54db8be2218696b76c5d239688b12bf229a4972c54bd1f")

prepare() {
    cd "$srcdir/vtk-v${pkgver}"
    patch -p1 < "${srcdir}/freetype.patch"
    patch -p1 < "${srcdir}/limits.patch"
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
          -DVTK_USE_EXTERNAL=ON \
          -DVTK_MODULE_USE_EXTERNAL_VTK_libharu=OFF \
          -DVTK_MODULE_USE_EXTERNAL_VTK_pegtl=OFF \
          -DVTK_MODULE_USE_EXTERNAL_VTK_libproj=OFF \
          -DVTK_MODULE_ENABLE_VTK_RenderingRayTracing=WANT \
          -DVTK_ENABLE_OSPRAY=OFF \
          ..
    make
}

package() {
    cd "$srcdir/vtk-v${pkgver}/build"
    make DESTDIR="$pkgdir" install
}

