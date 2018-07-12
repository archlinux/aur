# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=lms8suite-git
_pkgname=LMS8Suite
pkgver=18.06.0
pkgrel=1
pkgdesc="Utilities for use with hardware based upon LMS8001 RFICs from Lime Microsystems."
arch=('any')
url="https://github.com/myriadrf/LMS8Suite"
license=('Apache')
depends=('wxgtk3' 'opengl-driver' 'libusb>=1.0' 'soapysdr')
makedepends=('git' 'cmake')
provides=('lms8suite')
conflicts=('lms8suite')
source=("git+$url"
	'lms8suite.desktop')
sha256sums=('SKIP'
	    'ee741f0659c55f11e266cea102549d6c154692d970886684cd8207450aaed6ca')

prepare() {
  # Fix build
  sed -i "s|#include <mutex>|#include <mutex>\n#include <functional>|" "$srcdir"/$_pkgname/src/lms8001/lmsComms.h
}

build() {
  mkdir -p "$srcdir"/$_pkgname/build
  cd "$srcdir"/$_pkgname/build

  cmake ../src \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  # Binary
  install -Dm 775 "$srcdir"/$_pkgname/build/bin/lms8suite "$pkgdir"/usr/bin/lms8suite

  # .desktop file
  install -Dm 664 "$srcdir"/lms8suite.desktop "$pkgdir"/usr/share/applications/lms8suite.desktop

  # .ini files
  mkdir -p "$pkgdir"/usr/share/$_pkgname
  cp -dr --no-preserve=ownership "$srcdir"/$_pkgname/ini/ "$pkgdir"/usr/share/$_pkgname/
}
