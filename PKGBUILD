# Maintainer: Chris <christopher.r.mullins g-mail>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thiago Franco de Moraes <totonixsame@gmail.com>

pkgname=gdcm
pkgver=3.0.12
pkgrel=1
pkgdesc='a C++ library for DICOM medical files'
arch=('i686' 'x86_64')
url='http://gdcm.sourceforge.net'
license=('BSD')
optdepends=('python: python bindings')
makedepends=(
  'cmake'
  'python'
  'swig'
)
depends=(
  'openjpeg2'
)
source=("https://github.com/malaterre/GDCM/archive/v$pkgver.tar.gz")
sha512sums=('aa40774030de0483e9b56d12fefd1493574855104b5e8371c8c5e9c903aaa764b38ea75ec5afbd27bc50e5d53332e9e415b20cb2e5a65c1c4eb5d05bb692f9e8')

prepare() {
  cd "${pkgname^^}-$pkgver"
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
    -DGDCM_USE_VTK:BOOL=OFF \
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

