# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=ginkgo-cadx
pkgname=$_pkgname-git
pkgver=3.8.0.11.ga8819b7
pkgrel=1
pkgdesc='Advanced DICOM viewer and dicomizer'
arch=('i686' 'x86_64')
url='https://github.com/gerddie/ginkgocadx'
license=('LGPL3')
depends=('jsoncpp' 'wxgtk' 'dcmtk-git' 'itk-git' 'vtk6' 'openmpi')
makedepends=('git' 'cmake' 'tcp_wrappers-libs' 'glu' 'python2' 'qt5-base' 'qt5-webkit' 'webkitgtk2'
            'gdal' 'unixodbc' 'ffmpeg')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-2" "ginkgocadx-bin")
source=("$_pkgname::git+https://github.com/gerddie/ginkgocadx.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed 's:-:.:g'
}

prepare() {

  # make Ginkgo CADx accept VTK 6.*3*.0
  cd $_pkgname
  sed -i 's:FIND_PACKAGE(VTK 6.2.0 REQUIRED):FIND_PACKAGE(VTK 6.3.0 REQUIRED):' ./CMakeLists.txt

}

build() {
  mkdir -p build ; cd build

  cmake $srcdir/$_pkgname -DVTK_DIR=/opt/vtk6/lib/cmake/vtk-6.3 -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
