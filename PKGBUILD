# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=dcmtk
pkgname=$_pkgname-git
pkgver=3.6.8.r54.gc791af76e
pkgrel=1
pkgdesc='Collection of libraries and applications implementing large parts the DICOM standard'
arch=('i686' 'x86_64')
url='https://dicom.offis.de/dcmtk'
license=('custom')
depends=('libxml2' 'libsndfile' 'libpng' 'libtiff' 'libjpeg-turbo')
makedepends=('git' 'cmake' 'doxygen')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/dcmtk-${pkgver%.r*}-DEV/"{dcmpstat,dcmqrprf,dcmqrscp,filelog,logger,printers,storescp,storescu}.cfg)
source=("git+https://git.dcmtk.org/dcmtk.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed 's/^DCMTK-//;s/-/.r/;s/-/./'
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname" \
        -DDCMTK_ENABLE_CHARSET_CONVERSION=ICU \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc \
        -DBUILD_SHARED_LIBS=ON
  make
  make html
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$_pkgname/COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
