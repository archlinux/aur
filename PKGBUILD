# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=liblikely-git
pkgver=r582.58f1e78
pkgrel=1
pkgdesc='An image recognition runtime for heterogenous architectures'
arch=(i686 x86_64)
url='http://liblikely.org/'
license=(Apache2)
depends=(xz libjpeg libpng libtiff jasper ncurses)
makedepends=(git cmake)
options=(!emptydirs)
_branch=gh-pages
source=(git://github.com/biometrics/likely#branch=$_branch
        git://github.com/biometrics/likely-data
        git://github.com/llvm-mirror/llvm
        git://github.com/LuaDist/lua
        git://github.com/Itseez/opencv
        git://git.gitorious.org/qcustomplot/qcustomplot.git
        git://github.com/bagder/curl)
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

pkgver() {
  cd likely
  # liblikely repo does not have any git tags yet
  echo r$(git rev-list --count $_branch).$(git rev-parse --short $_branch)
}

prepare() {
  cd likely

  git submodule init
  git config submodule.data.url "$srcdir/data"
  git config submodule.llvm.url "$srcdir/llvm"
  git config submodule.lua.url "$srcdir/lua"
  git config submodule.opencv.url "$srcdir/opencv"
  git config submodule.qcustomplot.url "$srcdir/qcustomplot"
  git config submodule.curl.url "$srcdir/curl"
  git submodule update

  mkdir build
}

build() {
  cd likely/build
  cmake "$srcdir/likely" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd likely/build
  make test
}

package() {
  cd likely/build
  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/benchmark" # benchmark binary is useless on a user machine
}
