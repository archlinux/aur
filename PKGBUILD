# Maintainer: Butui Hu <hot123tea123@gmail.com>
#
# This PKGBUILD build itk-snap from the source according upstream Dockerfile
# https://github.com/pyushkevich/itksnap/blob/master/Utilities/Docker/itksnap-base/Dockerfile
# and https://github.com/pyushkevich/itksnap/blob/master/Utilities/Docker/itksnap/Dockerfile
#
# upstream use itk 5.2.1, and itk > 5.2.1 is not working
_itkver=5.2.1
# upstream uses vtk 9.1.0, but 9.2.6 also works with qt6
# vtk from community repo is build with qt5, here we need to build it with qt6
# _vtkver=9.1.0
_vtkver=9.2.6
pkgname=itk-snap
pkgver=4.0.0
pkgrel=1
pkgdesc="A software application used to segment structures in 3D medical images"
arch=('x86_64')
url="https://www.itksnap.org"
license=('GPL')
depends=(
  qt6-base
  qt6-declarative
)
makedepends=(
  cmake
  eigen
  expat
  fftw
  gendesk
  git
  gtest
  hdf5
  libjpeg-turbo
  libpng
  libtiff
  qt6-base
  qt6-declarative
  qt6-tools
  zlib
)
source=(
  "vtk-${_vtkver}.tar.gz::https://github.com/Kitware/VTK/archive/refs/tags/v${_vtkver}.tar.gz"
  "itk-${_itkver}.tar.gz::https://github.com/InsightSoftwareConsortium/ITK/archive/refs/tags/v${_itkver}.tar.gz"
  "${pkgname}-${pkgver}::git+https://github.com/pyushkevich/itksnap.git#tag=v${pkgver}"
)
sha512sums=('3ccb19cd98e691828e285d2d85aef890c4796d91588e02c401102feefb26c120f9d5195a79d1e7a04b037bf0bf0898b9791a341e0733d92234ca644e62da19b0'
            'cccb64766acaebe49ee2dd8b82b7b5aaa6a35e97f2cc7738ad7f3cd65006b73b880ac59341cd640abd64c2ac665633f01504760071f5492e40aa97e7ba6db2a9'
            'SKIP'
)

prepare() {
  echo "Creating desktop file"
  gendesk -f -n --pkgname ${pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories "Education;Graphics;Science;DataVisualization;MedicalSoftware;Viewer" \
    --icon "${pkgname}" \
    --exec "itksnap"
  cd ${pkgname}-${pkgver}
  git submodule update --init --recursive
}

build() {
  # build itk
  cmake \
    -B ${srcdir}/build-itk \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DITK_USE_SYSTEM_LIBRARIES=ON \
    -DModule_MorphologicalContourInterpolation=ON \
    -S ${srcdir}/ITK-${_itkver}
  make -C ${srcdir}/build-itk

  # build vtk with qt6
  cmake \
    -B ${srcdir}/build-vtk \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DVTK_BUILD_EXAMPLES=OFF \
    -DVTK_BUILD_TESTING=OFF \
    -DVTK_GROUP_ENABLE_Qt=YES \
    -DVTK_MODULE_ENABLE_VTK_GUISupportQtQuick=NO \
    -DVTK_MODULE_ENABLE_VTK_GUISupportQtSQL=NO \
    -DVTK_QT_VERSION=6 \
    -S ${srcdir}/VTK-${_vtkver}
  make -C ${srcdir}/build-vtk

  # build itk-snap
  cmake \
    -B ${srcdir}/build \
    -DBUILD_TESTING=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DITK_DIR=${srcdir}/build-itk \
    -DVTK_DIR=${srcdir}/build-vtk \
    -S ${pkgname}-${pkgver}
  make -C ${srcdir}/build
}

package() {
  # make install is not working in a clean chroot
  # make DESTDIR=${pkgdir} -C ${srcdir}/build install

  # we install all the files manaully
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/lib/snap-${pkgver}"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/GUI/Qt/Resources/logo_square.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm755 "${srcdir}/build/ITK-SNAP" "${pkgdir}/usr/lib/snap-4.0.0/ITK-SNAP"
  install -Dm755 "${srcdir}/build/Submodules/c3d/c2d" "${pkgdir}/usr/bin/c2d"
  install -Dm755 "${srcdir}/build/Submodules/c3d/c3d" "${pkgdir}/usr/bin/c3d"
  install -Dm755 "${srcdir}/build/Submodules/c3d/c3d_affine_tool" "${pkgdir}/usr/bin/c3d_affine_tool"
  install -Dm755 "${srcdir}/build/Submodules/c3d/c4d" "${pkgdir}/usr/bin/c4d"
  install -Dm755 "${srcdir}/build/Submodules/greedy/greedy" "${pkgdir}/usr/bin/greedy"
  install -Dm755 "${srcdir}/build/Submodules/greedy/greedy_template_average" "${pkgdir}/usr/bin/greedy_template_average"
  install -Dm755 "${srcdir}/build/Utilities/Forwarding/itksnap" "${pkgdir}/usr/bin/itksnap"
  install -Dm755 "${srcdir}/build/Utilities/Workspace/itksnap-wt" "${pkgdir}/usr/bin/itksnap-wt"

  # staticlibs and headers if you need
  # install -dm755 "${pkgdir}/usr/include"
  # install -Dm644 "${srcdir}/build/Submodules/c3d/libcnd_maxflow.a" "${pkgdir}/usr/lib/libcnd_maxflow.a"
  # install -Dm644 "${srcdir}/build/Submodules/c3d/libcnd_driver.a" "${pkgdir}/usr/lib/libcnd_driver.a"
  # install -Dm644 "${srcdir}/build/Submodules/c3d/libcnd_api.a" "${pkgdir}/usr/lib/libcnd_api.a"
  # install -Dm644 "${srcdir}/${pkgname}-${pkgver}/Submodules/c3d/api/ConvertAPI.h" "${pkgdir}/usr/include/ConvertAPI.h"
}
# vim:set ts=2 sw=2 et:
