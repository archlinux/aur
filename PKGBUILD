# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=dcmtk
pkgname=$_pkgname-git
pkgver=3.6.1_20160216.63.g2b6c548
pkgrel=2
pkgdesc='Collection of libraries and applications implementing large parts the DICOM standard'
arch=('i686' 'x86_64')
url='http://dicom.offis.de/dcmtk'
license=('custom')
depends=('libxml2' 'libjpeg-turbo' 'libpng' 'libtiff')
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
  # man pages get created only when compiling inside the source tree
  cd $_pkgname
  cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDCMTK_USE_CXX11_STL=ON \
        -DBUILD_SHARED_LIBS=ON
  make
  make html
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$_pkgname/COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
