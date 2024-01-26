# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thomas Pointhuber <thomas.pointhuber@gmx.at>
# Contributor: Thorsten Liebig
_base=openEMS
pkgname=${_base,,}
pkgver=0.0.36
pkgrel=1
pkgdesc="free and open electromagnetic field solver using the FDTD method"
arch=(i686 x86_64)
url="https://${_base}.de"
license=(GPL3)
depends=(hdf5-openmpi boost cgal tinyxml qt5-base unixodbc
  vtk fmt verdict libxcursor glew jsoncpp ospray openxr openvr ffmpeg
  postgresql-libs netcdf pdal mariadb-libs liblas cgns adios2 libharu gl2ps)
makedepends=(git cmake nlohmann-json python-h5py-openmpi)
optdepends=() # octave paraview hyp2mat
source=(${_base}-${pkgver}::git+https://github.com/thliebig/${_base}-Project.git#tag=v${pkgver}
  github.com-thliebig-csxcad::git+https://github.com/thliebig/CSXCAD.git
  github.com-thliebig-qcsxcad::git+https://github.com/thliebig/QCSXCAD.git
  github.com-thliebig-appcsxcad::git+https://github.com/thliebig/AppCSXCAD.git
  github.com-thliebig-openems::git+https://github.com/thliebig/openEMS.git
  github.com-thliebig-fparser::git+https://github.com/thliebig/fparser.git
  github.com-thliebig-ctb::git+https://github.com/thliebig/CTB.git)
sha512sums=('SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')

prepare() {
  cd ${_base}-${pkgver}
  sed -i 's/..\/CSXCAD.git/https:\/\/github.com\/thliebig\/CSXCAD.git/' .gitmodules
  sed -i 's/..\/QCSXCAD.git/https:\/\/github.com\/thliebig\/QCSXCAD.git/' .gitmodules
  sed -i 's/..\/AppCSXCAD.git/https:\/\/github.com\/thliebig\/AppCSXCAD.git/' .gitmodules
  sed -i 's/..\/openEMS.git/https:\/\/github.com\/thliebig\/openEMS.git/' .gitmodules
  sed -i 's/..\/fparser.git/https:\/\/github.com\/thliebig\/fparser.git/' .gitmodules
  sed -i 's/..\/CTB.git/https:\/\/github.com\/thliebig\/CTB.git/' .gitmodules
  git submodule init

  git config submodule.CSXCAD.url "${srcdir}/github.com-thliebig-csxcad"
  git config submodule.QCSXCAD.url "${srcdir}/github.com-thliebig-qcsxcad"
  git config submodule.AppCSXCAD.url "${srcdir}/github.com-thliebig-appcsxcad"
  git config submodule.openEMS "${srcdir}/github.com-thliebig-openems"
  git config submodule.fparser "${srcdir}/github.com-thliebig-fparser"
  git config submodule.CTB "${srcdir}/github.com-thliebig-ctb"

  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${_base}-${pkgver}
  ./update_openEMS.sh ${PWD}/bin \
    --with-hyp2mat \
    --with-CTB \
    --with-MPI \
    --python
}

package() {
  cd ${_base}-${pkgver}/bin

  install -d "$pkgdir/usr"
  cp -r * "$pkgdir/usr/"
}
