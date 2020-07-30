# Maintainer: Chris <christopher.r.mullins g-mail>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thiago Franco de Moraes <totonixsame@gmail.com>

pkgname=gdcm
pkgver=3.0.7
pkgrel=1
pkgdesc='a C++ library for DICOM medical files'
arch=('i686' 'x86_64')
url='http://gdcm.sourceforge.net'
license=('BSD')
depends=('vtk')
optdepends=('python: python bindings')
makedepends=('cmake'
             'openjpeg2'
             'python'
             'swig'
             'vtk'
             'qt5-base'
             'glew'
             'openmpi'
             'proj'
             'netcdf'
             'hdf5'
             'libogg'
             'libtheora'
)
source=("https://github.com/malaterre/GDCM/archive/v$pkgver.tar.gz")
sha512sums=('f0e54a1280692ef50bf8428d5b3a8774f294103bf4c59830cf37841c16e192c303d92f6c22eac923b4357041243f2fff034aa037d87185c7186de1d26d77c879')

build() {
  pysitepackages=$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')
  echo $pysitepackages
  cd "$srcdir"
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    -DGDCM_BUILD_APPLICATIONS:BOOL=ON \
    -DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
    -DGDCM_BUILD_TESTING:BOOL=OFF \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DGDCM_BUILD_DOCBOOK_MANPAGES:BOOL=OFF \
    -DGDCM_USE_SYSTEM_OPENJPEG:BOOL=ON \
    -DGDCM_USE_VTK:BOOL=ON \
    -DGDCM_WRAP_PYTHON:BOOL=ON \
    -DGDCM_INSTALL_PYTHONMODULE_DIR:STRING="$pysitepackages" \
    ../"GDCM-$pkgver"
    make
}

package() {
  cd "$srcdir"/"GDCM-$pkgver"
  install -Dm644 Copyright.txt "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING

  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}

