# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=dcmtk
pkgname=$_pkgname-snapshot
pkgver=3.6.1_20161102
pkgrel=2
pkgdesc='Collection of libraries and applications implementing large parts the DICOM standard'
arch=('i686' 'x86_64')
url='http://dicom.offis.de/dcmtk'
license=('custom')
depends=('libxml2' 'libwrap' 'libjpeg-turbo' 'libpng' 'libtiff')
makedepends=('git' 'cmake' 'libsndfile' 'doxygen')
provides=("$_pkgname")
conflicts=("$_pkgname"{,-git})
backup=("etc/dcmtk/"{dcmpstat,dcmqrscp,filelog,logger,printers,storescp,storescu}.cfg)
source=("http://dicom.offis.de/download/dcmtk/snapshot/dcmtk-$pkgver.tar.gz")
sha256sums=('657adb3811e0c5c08d8f143a6d878afcd92fac7dcf0d3c89860eecffd5a1a873')

build() {
  # man pages are copied only when compiling inside the source tree
  # http://forum.dcmtk.org/viewtopic.php?f=3&t=4475
  cd $_pkgname-$pkgver
  cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDCMTK_INSTALL_ETCDIR=/etc/dcmtk \
        -DBUILD_SHARED_LIBS=ON
  make
  make html
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$_pkgname-$pkgver/COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
