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
_pkgname=itk-snap
pkgname=itk-snap-git
pkgver=4.0.0.r143.50106ac0
pkgrel=1
pkgdesc="A software application used to segment structures in 3D medical images"
arch=('x86_64')
url="https://www.itksnap.org"
license=('GPL')
depends=(
  curl
  expat
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
  gcc12
  gendesk
  git
  gtest
)
provides=(itk-snap)
conflicts=(itk-snap)
options=(!emptydirs)
# upstream did not create a git tag for 4.0.2
# but according to the git log message, this commit should be release 4.0.2
source=(
  "vtk-${_vtkver}.tar.gz::https://github.com/Kitware/VTK/archive/refs/tags/v${_vtkver}.tar.gz"
  "itk-${_itkver}.tar.gz::https://github.com/InsightSoftwareConsortium/ITK/archive/refs/tags/v${_itkver}.tar.gz"
  "${pkgname}::git+https://github.com/pyushkevich/itksnap.git"
)
sha512sums=('3ccb19cd98e691828e285d2d85aef890c4796d91588e02c401102feefb26c120f9d5195a79d1e7a04b037bf0bf0898b9791a341e0733d92234ca644e62da19b0'
            'cccb64766acaebe49ee2dd8b82b7b5aaa6a35e97f2cc7738ad7f3cd65006b73b880ac59341cd640abd64c2ac665633f01504760071f5492e40aa97e7ba6db2a9'
            'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
  # we need to build itk 5.2.1 with gcc 12, gcc 13 is not working
  # we could just export these envs
  export CC=gcc-12
  export CXX=g++-12
  echo "Creating desktop file"
  gendesk -f -n --pkgname ${_pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories "Education;Graphics;Science;DataVisualization;MedicalSoftware;Viewer" \
    --icon "${_pkgname}" \
    --exec "itksnap"
  cd ${pkgname}
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
    -S ${pkgname}
  make -C ${srcdir}/build
  make -C ${srcdir}/build package
}

package() {
  # make install is not working in a clean chroot
  # make DESTDIR=${pkgdir} -C ${srcdir}/build install

  # we install all the files manaully by extracting the tarball to destdir
  mkdir -p ${pkgdir}/usr
  tar xfv ${srcdir}/build/*.tar.gz -C ${pkgdir}/usr --strip-components 1
}
# vim:set ts=2 sw=2 et:
