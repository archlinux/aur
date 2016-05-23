# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=dcmtk
pkgname=$_pkgname-snapshot
pkgver=3.6.1_20160216
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
sha256sums=('51c1075a5c0b631ac0849a967862eaa55466df0aa8c4704f9d67b541bedba812')

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
