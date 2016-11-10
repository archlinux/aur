# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=gdcm
pkgname=$_pkgname-git
pkgver=2.6.6.364.g05a664a
pkgrel=1
pkgdesc='Open source implementation of the DICOM standard'
arch=('i686' 'x86_64')
url='http://gdcm.sourceforge.net'
license=('BSD')
depends=('poppler')
optdepends=('java-environment: Java wrapper' 'python: Python wrapper')
makedepends=('git' 'cmake' 'libxslt' 'dcmtk-git' 'swig' 'python' 'java-environment')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://git.code.sf.net/p/gdcm/gdcm")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's:^v::;s:-:.:g'
}

build() {
  rm -Rf build && mkdir build
  cd build
  cmake $srcdir/$_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DGDCM_BUILD_APPLICATIONS=ON \
    -DGDCM_BUILD_SHARED_LIBS=ON \
    -DGDCM_LEGACY_REMOVE=ON \
    -DGDCMV2_0_COMPATIBILITY=OFF \
    -DGDCM_USE_SYSTEM_CHARLS=OFF \
    -DGDCM_USE_SYSTEM_EXPAT=ON \
    -DGDCM_USE_SYSTEM_JSON=OFF \
    -DGDCM_USE_SYSTEM_LIBXML2=ON \
    -DGDCM_USE_SYSTEM_LJPEG=OFF \
    -DGDCM_USE_SYSTEM_OPENJPEG=ON \
    -DGDCM_USE_SYSTEM_OPENSSL=ON \
    -DGDCM_USE_SYSTEM_POPPLER=ON \
    -DGDCM_USE_SYSTEM_SOCKETXX=OFF \
    -DGDCM_USE_SYSTEM_ZLIB=ON \
    -DGDCM_WRAP_JAVA=ON \
    -DGDCM_WRAP_PYTHON=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$_pkgname/Copyright.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
