# Maintainer: Vladislav Tyulbashev <vladislav.tyulbashev@yandex.ru>

pkgname=rupass-git
pkgver=20130522
pkgrel=1
pkgdesc="Simple password generator"
arch=('i686' 'x86_64')
url="https://github.com/vtyulb/RuPass"
license=('GPL')
depends=('qt5-base')
makedepends=('git')

_gitroot="https://github.com/vtyulb/RuPass.git"
_gitname="RuPass"

build() {
  cd $srcdir
  msg "Conencting to the GIT server..."
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done"
  msg "Starting make"
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning previous build directory..."
    rm -rf ${srcdir}/build
  fi

  cp -r $srcdir/$_gitname ${srcdir}/build
  cd ${srcdir}/build

  qmake-qt5 -makefile
  make
}

package() {
  cd ${srcdir}/build
  mkdir -p $pkgdir/usr/bin
  cp -f RuPass $pkgdir/usr/bin/rupass
}
