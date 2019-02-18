# Original Author: Johannes Sauer <joh.sauer(at)gmail(dot)com>
# Maintainer: Danilo Bargen <aur at dbrgn dot ch>

name=cloudcompare
pkgname=${name}-git
pkgver=2.10.1.r69.ga98751c4
pkgrel=1
pkgdesc="A 3D point cloud (and triangular mesh) processing software"
arch=('i686' 'x86_64')
url="http://www.danielgm.net/cc/"
license=('GPL2')
depends=('qt5-base' 'qt5-tools' 'qt5-svg' 'glu' 'glew' 'mesa' 'vxl' 'ffmpeg' 'cgal' 'pdal')
makedepends=('git' 'cmake' 'pcl' 'libharu' 'proj' 'python' 'doxygen' 'laz-perf')
optdepends=('pcl')
source=("${name}::git+https://github.com/CloudCompare/CloudCompare.git"
        "constexpr.patch"
        )
md5sums=('SKIP'
         'c1ea23f8a38cf1326196bb42de07e020')

prepare() {
  cd ${srcdir}/${name}
  git submodule update --init --recursive
  git apply ${srcdir}/constexpr.patch
}

pkgver() {
  cd ${srcdir}/${name}
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${name}
  
  mkdir -p build && cd build
 
  cmake .. \
        -Wno-dev \
        -DCMAKE_CXX_FLAGS=-fpermissive \
        -DOPTION_PDAL_LAS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_QRANSAC_SD_PLUGIN=ON \
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
        -DEIGEN_ROOT_DIR=/usr/include/eigen3 
  make
}

package() {
  cd ${srcdir}/${name}/build
  make DESTDIR="$pkgdir/" install
}
# vim:set sw=2 ts=2 et:
