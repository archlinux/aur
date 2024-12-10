# Maintainer: Butui Hu <hot123tea123@gmail.com>
#
# This PKGBUILD build itk-snap from the source according upstream Dockerfile
# https://github.com/pyushkevich/itksnap/blob/master/Utilities/Docker/itksnap-base/Dockerfile
# and https://github.com/pyushkevich/itksnap/blob/master/Utilities/Docker/itksnap/Dockerfile
#
_itkver=5.4.0
# vtk from community repo is build with qt5, here we need to build it with qt6
_vtkver=9.3.1
pkgname=itk-snap
pkgver=4.2.2
pkgrel=1
pkgdesc="A software application used to segment structures in 3D medical images"
arch=('x86_64')
url="https://www.itksnap.org"
license=('GPL-3.0-or-later')
depends=(
  curl
  expat
  gcc-libs
  glibc
  hdf5
  libglvnd
  libjpeg-turbo
  libpng
  libtiff
  libx11
  qt6-base
  qt6-declarative
  zlib
)
makedepends=(
  cmake
  eigen
  fftw
  gcc
  gendesk
  git
)
options=(!emptydirs)
# this commit is not v4.2.2 but with latest bug fix
source=(
  "vtk-${_vtkver}.tar.gz::https://github.com/Kitware/VTK/archive/refs/tags/v${_vtkver}.tar.gz"
  "itk-${_itkver}.tar.gz::https://github.com/InsightSoftwareConsortium/ITK/archive/refs/tags/v${_itkver}.tar.gz"
  "${pkgname}-${pkgver}::git+https://github.com/pyushkevich/itksnap.git#commit=87db0444a1bb470e0bcbda6959bceb1d7d896061"
)
sha512sums=('484db4fbc82f5484d38bbd425d64756911236284cf9d77a904ce133f4cc6909ee303ca7ca22407a648becea03a10ec2d5692e6357c1d6cd4053c9c9104b5bd8c'
            '3a98ececf258aac545f094dd3e97918c93cc82bc623ddf793c4bf0162ab06c83fbfd4d08130bdec6e617bda85dd17225488bc1394bc91b17f1232126a5d990db'
            '474fa0d670ff19c1114edb4339578f9ade85045d2b50835faa964bf08cd0ad9167e228bdbaad7809dda6ade45284cb0a35c449628e69092cbfbb35699f709811')

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
  # building with system googletest is not working
  cmake \
    -B ${srcdir}/build-itk \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DITK_USE_SYSTEM_LIBRARIES=ON \
    -DITK_USE_SYSTEM_GOOGLETEST=OFF \
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
  make -C ${srcdir}/build package
}

package() {
  # make install is not working in a clean chroot
  # make DESTDIR=${pkgdir} -C ${srcdir}/build install

  # we install all the files manaully by extracting the tarball to destdir
  mkdir -p ${srcdir}/destdir
  tar xfv ${srcdir}/build/*.tar.gz -C ${srcdir}/destdir --strip-components 1
  cp -r ${srcdir}/destdir ${pkgdir}/usr

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/GUI/Qt/Resources/logo_square.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
# vim:set ts=2 sw=2 et:
