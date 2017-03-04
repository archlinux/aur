# Maintainer: Vladislav Tyulbashev <vtyulb@vtyulb.ru>

pkgname=bsa-analytics-git
pkgver=20170304
pkgrel=1
pkgdesc="PRAO BSA telescope data viewer, pulsar searching & analytics software"
arch=('i686' 'x86_64')
url="https://github.com/vtyulb/BSA-Analytics"
license=('GPL')
depends=('qt5-base')
makedepends=('git')

_gitroot="https://github.com/vtyulb/BSA-Analytics.git"
_gitname="BSA-Analytics"

build() {
  cd $srcdir
  msg "Connecting to the GIT server..."
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done"
  msg "Starting make"
  if [[ -d ${srcdir}/BSA-Analytics/build ]]; then
    msg "Cleaning previous build directory..."
    rm -rf ${srcdir}/BSA-Analytics/build
  fi

  mkdir ${srcdir}/BSA-Analytics/build
  cd ${srcdir}/BSA-Analytics/build
  qmake-qt5 ../src
  make -j2
}

package() {
  cd ${srcdir}/BSA-Analytics/build

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/bsa-analytics

  cp -f BSA-Analytics $pkgdir/usr/bin/bsa-analytics
  cp -f ../docs/HandBook.pdf $pkgdir/usr/share/doc/bsa-analytics/
}
