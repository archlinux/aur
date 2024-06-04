# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=gdcm
pkgname=$_pkgname-git
pkgver=3.0.24.r304.gf579a558d
pkgrel=1
pkgdesc='Open source implementation of the DICOM standard'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/gdcm'
license=('BSD-3-Clause')
depends=('expat' 'libxml2' 'openssl' 'openjpeg2')
optdepends=('java-runtime>=22: Java wrapper' 'python: Python wrapper')
makedepends=('git' 'cmake' 'swig' 'java-environment>=22' 'python' 'dcmtk-git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/malaterre/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's:^v::;s:-:.r:;s:-:.:'
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
    -DGDCM_USE_SYSTEM_POPPLER=OFF \
    -DGDCM_USE_SYSTEM_SOCKETXX=OFF \
    -DGDCM_USE_SYSTEM_ZLIB=ON \
    -DGDCM_WRAP_JAVA=ON \
    -DGDCM_DEFAULT_JAVA_VERSION=22 \
    -DGDCM_WRAP_PYTHON=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$_pkgname/Copyright.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
