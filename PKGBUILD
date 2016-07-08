# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=dcmtk
pkgname=$_pkgname-snapshot
pkgver=3.6.1_20160630
pkgrel=1
pkgdesc='Collection of libraries and applications implementing large parts the DICOM standard'
arch=('i686' 'x86_64')
url='http://dicom.offis.de/dcmtk'
license=('custom')
depends=('libxml2' 'libjpeg-turbo' 'libpng' 'libtiff')
makedepends=('git' 'cmake' 'libsndfile' 'doxygen')
provides=("$_pkgname")
conflicts=("$_pkgname"{,-git})
source=("http://dicom.offis.de/download/dcmtk/snapshot/dcmtk-$pkgver.tar.gz")
sha256sums=('7dacf0e704f9b5a3a92bd40f1391be3e4473c06c0adb4dbf5855b5c5ddc5f12a')

build() {
  # man pages get created only when compiling inside the source tree
  cd $_pkgname-$pkgver
  cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDCMTK_USE_CXX11_STL=ON \
        -DBUILD_SHARED_LIBS=ON
  make
  make html
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$_pkgname-$pkgver/COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
