# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ParMmg
pkgname=${_name,,}
pkgver=1.5.0
pkgrel=1
pkgdesc="Parallel remesher built on Mmg: distributed tetrahedral mesh adaptation"
arch=('x86_64')
url="https://github.com/MmgTools/$_name"
license=('LGPL-3.0-or-later')
depends=('glibc'
         'openmpi'
         'mmg'
         'metis'
         'scotch'
         'vtk'
         'hdf5-openmpi')
makedepends=('cmake'
             'gcc-fortran'
             'git'
             'netcdf'
             'proj'
             'qt6-base'
             'glew'
             'python'
             'libogg'
             'libtheora'
             'fmt'
             'onetbb')
_testcommit=5091f86924742f90eed744d231984a4fdbfc2a31
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "testparmmg::git+https://gitlab.inria.fr/$_name/testparmmg.git#commit=$_testcommit")
sha256sums=('0baec7914e49a26bdbb849ab64dcd92147eff79ac02ef3b2599cb05104901a7a'
            '72c9fa9514dc67be3eaeef072c8ca02a9fe869a790bcfaea4af0a53d56ecc9c1')

build() {
  cd "$_name-$pkgver"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DDOWNLOAD_MMG=OFF -DMMG_DIR=/usr -DDOWNLOAD_METIS=OFF -DMETIS_DIR=/usr -DUSE_SCOTCH=ON -DUSE_VTK=ON -DUSE_HDF5=ON -DBUILD_SHARED_LIBS=ON -DLIBPARMMG_STATIC=OFF -DBUILD_TESTING=ON -DCI_DIR="$srcdir/testparmmg" -DMPI_ARGS=--oversubscribe -Wno-dev
  cmake --build build
}

check() {
  cd "$_name-$pkgver"
  ctest --test-dir build --output-on-failure
}

package() {
  cd "$_name-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
