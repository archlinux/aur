#!/usr/hint/bash
# Maintainer  : bartus <arch-user-repo(at)bartus.33mail.com>
# Contributor : Johannes Sauer <joh.sauer(at)gmail(dot)com>
# Contributor : Danilo Bargen <aur at dbrgn dot ch>
# shellcheck disable=SC2034,SC2154 # allow unused/uninitialized variables.

name=cloudcompare
pkgname=${name}
_fragment="#tag=v2.11.0"
pkgver="${_fragment###tag=v}"
pkgrel=2
pkgdesc="A 3D point cloud (and triangular mesh) processing software"
arch=('i686' 'x86_64')
url="http://www.danielgm.net/cc/"
license=('GPL2')
depends=('cgal' 'ffmpeg' 'glew' 'glu' 'mesa' 'pdal' 'qt5-base' 'qt5-tools' 'qt5-svg' 'tbb' 'vxl')
makedepends=('cmake' 'doxygen' 'git' 'laz-perf' 'libharu' 'ninja' 'pcl' 'proj' 'python')
optdepends=('pcl')
source=("${name}::git+https://github.com/CloudCompare/CloudCompare.git${_fragment}"
        constexpr.patch
        pcl.patch
        CloudCompare.desktop
        ccViewer.desktop)
md5sums=('SKIP'
         '7b254561200ba7d51817e4860f589426'
         'b93f216458129507f154ea6d19a5fed0'
         '379e09f6996b2b397429c0661c409bd0'
         'b6dcb0dee15cc67011166a2fc774c5ef')

prepare() {
  git -C "${srcdir}/${name}" submodule update --init --recursive
  git -C "${srcdir}/${name}" apply -v "${srcdir}"/*patch
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
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DCOMPILE_CC_CORE_LIB_WITH_CGAL=ON \
        -DCOMPILE_CC_CORE_LIB_WITH_TBB=ON \
        -DFFMPEG_INCLUDE_DIR=/usr/include \
        -DFFMPEG_LIBRARY_DIR=/usr/lib/ \
        -DOPTION_USE_DXF_LIB=ON \
        -DOPTION_USE_GDAL=ON \
        -DOPTION_USE_SHAPE_LIB=ON \
        -DPLUGIN_GL_QEDL=ON \
        -DPLUGIN_GL_QSSAO=ON \
        -DPLUGIN_IO_QADDITIONAL=ON \
        -DPLUGIN_IO_QCORE=ON \
        -DPLUGIN_IO_QCSV_MATRIX=ON \
        -DPLUGIN_IO_QE57=ON \
        -DPLUGIN_IO_QFBX=OFF \
        -DPLUGIN_IO_QPDAL=ON \
        -DPLUGIN_IO_QPHOTOSCAN=ON \
        -DPLUGIN_IO_QRDB=OFF \
        -DPLUGIN_STANDARD_QANIMATION=ON \
        -DPLUGIN_STANDARD_QBROOM=ON \
        -DPLUGIN_STANDARD_QCANUPO=OFF \
        -DPLUGIN_STANDARD_QCOMPASS=ON \
        -DPLUGIN_STANDARD_QCORK=OFF \
        -DPLUGIN_STANDARD_QCSF=ON \
        -DPLUGIN_STANDARD_QCSF=ON \
        -DPLUGIN_STANDARD_QFACETS=ON \
        -DPLUGIN_STANDARD_QHOUGH_NORMALS=ON \
        -DPLUGIN_STANDARD_QHPR=ON \
        -DPLUGIN_STANDARD_QM3C2=ON \
        -DPLUGIN_STANDARD_QPCL=ON \
        -DPLUGIN_STANDARD_QPCV=ON \
        -DPLUGIN_STANDARD_QPOISSON_RECON=ON \
        -DPLUGIN_STANDARD_QRANSAC_SD=ON \
        -DPLUGIN_STANDARD_QSRA=ON \
        -DPOISSON_RECON_WITH_OPEN_MP=ON \
        -DWITH_FFMPEG_SUPPORT=ON \
        -DEIGEN_ROOT_DIR=/usr/include/eigen3 
  )
  cmake -B build -S "${srcdir}/${name}" -G Ninja "${CMAKE_FLAGS[@]}" -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-deprecated-declarations"
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
