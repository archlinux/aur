# Maintainer: Chris <christopher.r.mullins g-mail>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thiago Franco de Moraes <totonixsame@gmail.com>

pkgname=gdcm
pkgver=3.0.9
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
source=("https://github.com/malaterre/GDCM/archive/v$pkgver.tar.gz"
        "https://github.com/malaterre/GDCM/commit/1c971ff1697d29c63e404403d345f869768c0bdb.patch")
sha512sums=('5220ea12ac94d83ee7046a3a070cec7ef83752d2f3d838e7db8d0379b5606d19a94d5bfdc04e8ec4c72e0c3b4397751f54fad49a04a283ee9b760b59183e8f7a'
            '67ddd28837253bae450b587d36e8f3c08cfa2779593718430e8bda3fb53f336a6e131c96be2808202b84957b445f7cd5998c2cda73a112d86e7c29900acef220')

prepare() {
  cd "${pkgname^^}-$pkgver"
  patch -p1 -i "$srcdir/1c971ff1697d29c63e404403d345f869768c0bdb.patch"
}

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

