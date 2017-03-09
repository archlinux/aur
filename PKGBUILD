# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=dcmtk
pkgname=$_pkgname-snapshot
pkgver=3.6.1_20170228
pkgrel=2
pkgdesc='Collection of libraries and applications implementing large parts the DICOM standard'
arch=('i686' 'x86_64')
url='http://dicom.offis.de/dcmtk'
license=('custom')
depends=('libxml2' 'libwrap' 'libjpeg-turbo' 'libpng' 'libtiff')
makedepends=('cmake' 'libsndfile' 'doxygen')
provides=("$_pkgname")
conflicts=("$_pkgname"{,-git})
backup=("etc/dcmtk/"{dcmpstat,dcmqrscp,filelog,logger,printers,storescp,storescu}.cfg)
source=("http://dicom.offis.de/download/dcmtk/snapshot/dcmtk-$pkgver.tar.gz")
sha256sums=('8de2f2ae70f71455288ec85c96a2579391300c7462f69a4a6398e9ec51779c11')

build() {
  # man pages are copied only when compiling inside the source tree
  # http://forum.dcmtk.org/viewtopic.php?f=3&t=4475
  cd $_pkgname-$pkgver
  cmake . \
        -DDCMTK_ENABLE_CHARSET_CONVERSION=ICU \
        -DDCMTK_USE_CXX11_STL=ON \
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
