#!/usr/hint/bash
# Maintainer  : bartus <arch-user-repo(at)bartus.33mail.com>
# Contributor : Johannes Sauer <joh.sauer(at)gmail(dot)com>
# Contributor : Danilo Bargen <aur at dbrgn dot ch>
# shellcheck disable=SC2034,SC2154 # allow unused/uninitialized variables.

name=cloudcompare
pkgname=${name}
_fragment="#tag=v2.10.3"
pkgver=2.10.3
pkgrel=2
pkgdesc="A 3D point cloud (and triangular mesh) processing software"
arch=('i686' 'x86_64')
url="http://www.danielgm.net/cc/"
license=('GPL2')
depends=('cgal' 'ffmpeg' 'glew' 'glu' 'mesa' 'pdal' 'qt5-base' 'qt5-tools' 'qt5-svg' 'vxl')
makedepends=('cmake' 'doxygen' 'git' 'laz-perf' 'libharu' 'ninja' 'pcl' 'proj' 'python')
optdepends=('pcl')
source=("${name}::git+https://github.com/CloudCompare/CloudCompare.git${_fragment}"
        CloudCompare.desktop
        ccViewer.desktop)
md5sums=('SKIP'
         '379e09f6996b2b397429c0661c409bd0'
         'b6dcb0dee15cc67011166a2fc774c5ef')

prepare() {
  git -C "${srcdir}/${name}" submodule update --init --recursive
}

pkgver() {
  git -C "${srcdir}/${name}" describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
# shellcheck disable=SC2191
  CMAKE_FLAGS=(
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
  )
  cmake -B build -S "${srcdir}/${name}" -G Ninja "${CMAKE_FLAGS[@]}"
# shellcheck disable=SC2086 # allow slitting for MAKEFLAGS carrying multiple flags.
  ninja -C build ${MAKEFLAGS:--j1}
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # install *.desktop files
  install -D -m 644 "${srcdir}"/*.desktop -t "${pkgdir}"/usr/share/applications/

  # copy icons for *.desktop files
  for size in 16 32 64 256; do
    install -D -m 644 ${name}/qCC/images/icon/cc_icon_${size}.png "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/cc_icon.png
    install -D -m 644 ${name}/qCC/images/icon/cc_viewer_icon_${size}.png "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/cc_viewer_icon.png
  done 
  install -D -m 644 ${name}/qCC/images/icon/cc_icon.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/cc_icon.svg
  install -D -m 644 ${name}/qCC/images/icon/cc_viewer_icon.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/cc_viewer_icon.svg
}
# vim:set sw=2 ts=2 et:
