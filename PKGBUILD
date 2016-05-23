# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=dcmtk
pkgname=$_pkgname-snapshot
pkgver=3.6.1_20150924
pkgrel=1
pkgdesc='Collection of libraries and applications implementing large parts the DICOM standard'
arch=('i686' 'x86_64')
url='http://dicom.offis.de/dcmtk'
license=('custom')
depends=('libxml2' 'libjpeg-turbo' 'libpng' 'libtiff')
makedepends=('git' 'cmake' 'libsndfile' 'doxygen')
provides=("$_pkgname")
conflicts=("$_pkgname"{,-git})
source=("http://dicom.offis.de/download/dcmtk/snapshot/old/dcmtk-$pkgver.tar.gz")
sha256sums=('37a3cff61adaec87ff0eae553827b63cb9420c14c88d1d5b719cae7c70510e52')

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
