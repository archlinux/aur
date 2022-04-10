# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgbase=rssguard
pkgbase=$_pkgbase-git
pkgname=($_pkgbase-{,nowebengine-}git)
pkgver=4.2.1.72.g52798f9e
pkgrel=3
pkgdesc='Simple, lightweight and easy-to-use RSS/ATOM feed aggregator developed using Qt'
arch=('i686' 'x86_64')
url='https://github.com/martinrotter/rssguard'
license=('GPL3')
optdepends=('oxygen-icons: fallback icon theme')
makedepends=('git' 'cmake' 'qt5-tools' 'qt5-webengine' 'qt5-multimedia')
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgbase
  git describe --always | sed 's:-:.:g'
}

build() {
  rm -Rf build* && mkdir build{,-nowebengine}
  cd $srcdir/build
  cmake $srcdir/$_pkgbase/ -DCMAKE_BUILD_TYPE=debug -DCMAKE_INSTALL_PREFIX=/usr
  make
  cd $srcdir/build-nowebengine
  cmake $srcdir/$_pkgbase/ -DCMAKE_BUILD_TYPE=debug \
                           -DCMAKE_INSTALL_PREFIX=/usr \
                           -DUSE_WEBENGINE=OFF
  make
}

package_rssguard-git() {
  depends=('qt5-webengine' 'qt5-multimedia')
  provides=("$_pkgbase")
  conflicts=("$_pkgbase" rss-guard{,-git})
  cd build
  make DESTDIR=$pkgdir install
}

package_rssguard-nowebengine-git() {
  pkgdesc+='. Variant without Qt WebEngine support.'
  depends=('qt5-declarative' 'qt5-multimedia')
  provides=("$_pkgbase-nowebengine")
  conflicts=("$_pkgbase-nowebengine")
  cd build-nowebengine
  make DESTDIR=$pkgdir install
}
