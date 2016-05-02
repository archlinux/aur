# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=gdcm
pkgname=$_pkgname-git
pkgver=r9344.a18f94b
pkgrel=1
pkgdesc='Open source implementation of the DICOM standard'
arch=('i686' 'x86_64')
url='http://gdcm.sourceforge.net'
license=('BSD')
makedepends=('git' 'cmake' 'poppler' 'openjpeg2' 'python' 'swig' 'java-environment')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://git.code.sf.net/p/gdcm/gdcm")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build
  cd build
  cmake $srcdir/$_pkgname \
    -DGDCM_BUILD_APPLICATIONS=ON \
    -DGDCM_BUILD_SHARED_LIBS=ON \
    -DGDCM_BUILD_TESTING=ON \
    -DGDCM_DOCUMENTATION=OFF \
    -DGDCMV2_0_COMPATIBILITY=OFF \
    -DGDCM_USE_SYSTEM_ZLIB=ON \
    -DGDCM_USE_SYSTEM_OPENSSL=ON \
    -DGDCM_USE_SYSTEM_EXPAT=ON \
    -DGDCM_USE_SYSTEM_JSON=ON \
    -DGDCM_USE_SYSTEM_PAPYRUS3=OFF \
    -DGDCM_USE_SYSTEM_SOCKETXX=ON \
    -DGDCM_USE_SYSTEM_LJPEG=OFF \
    -DGDCM_USE_SYSTEM_OPENJPEG=ON \
    -DGDCM_USE_SYSTEM_CHARLS=ON \
    -DGDCM_USE_SYSTEM_POPPLER=ON \
    -DGDCM_USE_SYSTEM_LIBXML2=ON \
    -DGDCM_WRAP_PYTHON=ON \
    -DGDCM_WRAP_PERL=OFF \
    -DGDCM_WRAP_JAVA=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$_pkgname/Copyright.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
