# Maintainer: Butui Hu <hot123tea123@gmail.com>
#
# This PKGBUILD build itk-snap from the source according upstream Dockerfile
# https://github.com/pyushkevich/itksnap/blob/master/Utilities/Docker/itksnap-base/Dockerfile
# and https://github.com/pyushkevich/itksnap/blob/master/Utilities/Docker/itksnap/Dockerfile
#
_itkver=5.4.0
_vtkver=9.3.1
_pkgname=itk-snap
pkgname=itk-snap-git
pkgver=4.4.0.beta2.r13.97099054
pkgrel=1
pkgdesc="A software application used to segment structures in 3D medical images"
arch=('x86_64')
url="https://www.itksnap.org"
license=('GPL-3.0-or-later')
depends=(
  curl
  expat
  gcc14-libs
  glibc
  hdf5
  libglvnd
  libjpeg-turbo
  libpng
  libssh
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
  gcc14
  gendesk
  git
  ninja
  qt6-tools
  vulkan-headers
)
provides=(itk-snap)
conflicts=(itk-snap)
options=(!emptydirs)
source=(
  "vtk-${_vtkver}.tar.gz::https://github.com/Kitware/VTK/archive/refs/tags/v${_vtkver}.tar.gz"
  "itk-${_itkver}.tar.gz::https://github.com/InsightSoftwareConsortium/ITK/archive/refs/tags/v${_itkver}.tar.gz"
  "${pkgname}::git+https://github.com/pyushkevich/itksnap.git"
  "0001.fix-building-with-eigen.patch::https://github.com/InsightSoftwareConsortium/ITK/commit/ada8399edb0259ba9272c957ab4033978bdfdded.patch"
)
sha512sums=('484db4fbc82f5484d38bbd425d64756911236284cf9d77a904ce133f4cc6909ee303ca7ca22407a648becea03a10ec2d5692e6357c1d6cd4053c9c9104b5bd8c'
            '3a98ececf258aac545f094dd3e97918c93cc82bc623ddf793c4bf0162ab06c83fbfd4d08130bdec6e617bda85dd17225488bc1394bc91b17f1232126a5d990db'
            'SKIP'
            '61b059db3d883226f56912bcd1349f9c13e1b24e2f417df4f171a05fb7de6eae5582cd0a97e5e450ae2d2dd0964f8b3b52d15b7f38da52280ede9852d2c7c008')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
  echo "Creating desktop file"
  gendesk -f -n --pkgname ${_pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories "Education;Graphics;Science;DataVisualization;MedicalSoftware;Viewer" \
    --icon "${_pkgname}" \
    --exec "itksnap"
  cd ${pkgname}
  git submodule update --init --recursive
  cd ${srcdir}/ITK-${_itkver}
  patch -p1 -i ${srcdir}/0001.fix-building-with-eigen.patch
}

build() {
  # build with gcc14
  export CC=gcc-14
  export CXX=g++-14
  # build itk
  # building with system googletest is not working
  echo "building itk..."
  cmake \
    -B ${srcdir}/build-itk \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DITK_USE_SYSTEM_LIBRARIES=OFF \
    -DITK_USE_SYSTEM_GOOGLETEST=OFF \
    -DModule_MorphologicalContourInterpolation=ON \
    -GNinja \
    -S ${srcdir}/ITK-${_itkver}
  cmake --build ${srcdir}/build-itk

  # build vtk with qt6
  echo "building vtk..."
  cmake \
    -B ${srcdir}/build-vtk \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DVTK_BUILD_EXAMPLES=OFF \
    -DVTK_BUILD_TESTING=OFF \
    -DVTK_GROUP_ENABLE_Qt=YES \
    -DVTK_MODULE_ENABLE_VTK_GUISupportQtQuick=NO \
    -DVTK_MODULE_ENABLE_VTK_GUISupportQtSQL=NO \
    -DVTK_MODULE_ENABLE_VTK_RenderingExternal=YES \
    -DVTK_QT_VERSION=6 \
    -GNinja \
    -S ${srcdir}/VTK-${_vtkver}
  cmake --build ${srcdir}/build-vtk

  # build itk-snap
  echo "building itk-snap..."
  cmake \
    -B ${srcdir}/build \
    -DBUILD_TESTING=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DITK_DIR=${srcdir}/build-itk \
    -DVTK_DIR=${srcdir}/build-vtk \
    -GNinja \
    -S ${pkgname}
  cmake --build ${srcdir}/build
}

package() {
  DESTDIR=${pkgdir} cmake --install ${srcdir}/build
  install -Dm644 "${srcdir}/${pkgname}/GUI/Qt/Resources/logo_square.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  # fix translations files
  mv -v "${pkgdir}/usr/share/qt6/translations" "${pkgdir}/usr/lib/snap-4.4.0"
}
# vim:set ts=2 sw=2 et:
