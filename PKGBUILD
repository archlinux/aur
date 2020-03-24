# Original Author: Johannes Sauer <joh.sauer(at)gmail(dot)com>
# Maintainer: Danilo Bargen <aur at dbrgn dot ch>

name=cloudcompare
pkgname=${name}
_fragment="#tag=v2.10.3"
pkgver=2.10.3
pkgrel=2
pkgdesc="A 3D point cloud (and triangular mesh) processing software"
arch=('i686' 'x86_64')
url="http://www.danielgm.net/cc/"
license=('GPL2')
depends=('qt5-base' 'qt5-tools' 'qt5-svg' 'glu' 'glew' 'mesa' 'vxl' 'ffmpeg' 'cgal' 'pdal')
makedepends=('git' 'cmake' 'pcl' 'libharu' 'proj' 'python' 'doxygen' 'laz-perf')
optdepends=('pcl')
source=("${name}::git+https://github.com/CloudCompare/CloudCompare.git${_fragment}"
        CloudCompare.desktop
        ccViewer.desktop)
md5sums=('SKIP'
         '379e09f6996b2b397429c0661c409bd0'
         'b6dcb0dee15cc67011166a2fc774c5ef')

prepare() {
  cd ${srcdir}/${name}
  git submodule update --init --recursive
}

pkgver() {
  cd ${srcdir}/${name}
  git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${name}
  
  mkdir -p build && cd build
 
  cmake .. \
        -Wno-dev \
        -DCMAKE_CXX_STANDARD=14 \
        -DCMAKE_CXX_FLAGS=-fpermissive \
        -DOPTION_PDAL_LAS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
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

  # install *.desktop files
  install -D -m 644 ${srcdir}/*.desktop -t ${pkgdir}/usr/share/applications/

  # copy icons for *.desktop files
  cd ${srcdir}/${name}
  for size in 16 32 64 256; do
    install -D -m 644 qCC/images/icon/cc_icon_${size}.png ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/cc_icon.png
    install -D -m 644 qCC/images/icon/cc_viewer_icon_${size}.png ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/cc_viewer_icon.png
  done 
  install -D -m 644 qCC/images/icon/cc_icon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/cc_icon.svg
  install -D -m 644 qCC/images/icon/cc_viewer_icon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/cc_viewer_icon.svg
}
# vim:set sw=2 ts=2 et:
