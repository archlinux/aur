# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=dcmtk
pkgname=$_pkgname-git
pkgver=3.6.1_20161102.4.g7872b1c
pkgrel=1
pkgdesc='Collection of libraries and applications implementing large parts the DICOM standard'
arch=('i686' 'x86_64')
url='http://dicom.offis.de/dcmtk'
license=('custom')
depends=('libxml2' 'libwrap' 'libjpeg-turbo' 'libpng' 'libtiff')
makedepends=('git' 'cmake' 'libsndfile' 'doxygen')
provides=("$_pkgname")
conflicts=("$_pkgname"{,-snapshot})
source=("git://git.dcmtk.org/dcmtk.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed 's:^DCMTK-::;s:-:.:g'
}

build() {
  # man pages are created only when compiling inside the source tree
  # http://forum.dcmtk.org/viewtopic.php?f=3&t=4475
  cd $_pkgname
  cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON
  make
  make html
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$_pkgname/COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
