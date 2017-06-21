# Original Author: Johannes Sauer <joh.sauer(at)gmail(dot)com>
# Maintainer: Danilo Bargen <aur at dbrgn dot ch>

name=cloudcompare
pkgname=${name}-git
pkgver=2.8.0.r158.gab5f340a
pkgrel=1
pkgdesc="A 3D point cloud (and triangular mesh) processing software"
arch=('i686' 'x86_64')
url="http://www.danielgm.net/cc/"
license=('GPL2')
depends=('qt5-base' 'glu' 'mesa' 'vxl' 'ffmpeg' 'cgal')
makedepends=('git' 'cmake' 'pcl' 'doxygen' 'liblas')
optdepends=('pcl' 'liblas')
source=("${name}::git+https://github.com/CloudCompare/CloudCompare.git"
        "cgal.patch")
md5sums=('SKIP'
         'c731a6b09c7a54ecc8ba67f4557e2b0c')

prepare() {
  cd ${srcdir}/${name}
  git submodule update --init --recursive
  patch -Np1 -i ../cgal.patch
}

pkgver() {
  cd ${srcdir}/${name}
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${name}
  
  mkdir -p build && cd build
 
  cmake .. \
        -DCMAKE_CXX_FLAGS=-fpermissive \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_QCOMPASS_PLUGIN=ON \
        -DINSTALL_QPCL_PLUGIN=ON \
        -DINSTALL_QBLUR_PLUGIN=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCOMPILE_CC_CORE_LIB_WITH_CGAL=ON \
        -DINSTALL_QHPR_PLUGIN=ON \
        -DINSTALL_QPOISSON_RECON_PLUGIN=ON \
        -DPOISSON_RECON_WITH_OPEN_MP=ON \
        -DINSTALL_QEDL_PLUGIN=ON \
        -DINSTALL_QSRA_PLUGIN=ON \
        -DOPTION_USE_GDAL=ON \
        -DOPTION_USE_DXF_LIB=ON \
        -DINSTALL_QSSAO_PLUGIN=ON \
        -DOPTION_USE_LIBLAS=ON \
        -DINSTALL_QGMMREG_PLUGIN=ON \
        -DINSTALL_QANIMATION_PLUGIN=ON \
        -DINSTALL_QCSF_PLUGIN=ON \
        -DINSTALL_QPHOTOSCAN_IO_PLUGIN=ON \
        -DWITH_FFMPEG_SUPPORT=ON \
        -DFFMPEG_INCLUDE_DIR=/usr/include \
        -DFFMPEG_LIBRARY_DIR=/usr/lib/ \
        -DINSTALL_QFACETS_PLUGIN=ON \
        -DOPTION_USE_SHAPE_LIB=ON \
        -DINSTALL_QPCV_PLUGIN=ON \
        -DINSTALL_QM3C2_PLUGIN=ON \
        -DINSTALL_QBROOM_PLUGIN=true \
        -DINSTALL_QHOUGH_NORMALS_PLUGIN=true \
        -DEIGEN_ROOT_DIR=/usr/include/eigen3 \
        -DLIBLAS_INCLUDE_DIR=/usr/include/liblas \
        -DLIBLAS_RELEASE_LIBRARY_FILE=/usr/lib/liblas.so
  make
}

package() {
  cd ${srcdir}/${name}/build
  make DESTDIR="$pkgdir/" install
}
# vim:set sw=2 ts=2 et:
