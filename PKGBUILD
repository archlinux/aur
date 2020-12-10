# Maintainer: Sunner <sunnerlp at gmail dot com>
_pkgname=krunner-jetbrains
_branch=master
pkgname=$_pkgname-git
pkgver=r94.9351091
pkgrel=1
pkgdesc="JetBrains plugin for KRunner"
url='https://github.com/alex1701c/JetBrainsRunner'
arch=('x86_64')
license=('GPL')
depends=('libnotify' 'kcmutils' 'kio')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url#branch=$_branch")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  git submodule update --init

  mkdir -p build
}

build() {
  cd "$srcdir/$_pkgname/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DKDE_INSTALL_QTPLUGINDIR=$(kf5-config --qt-plugins) ..
  make
}


package() {
  cd "$srcdir/$_pkgname/build"
  make -C "$srcdir/$_pkgname/build" DESTDIR="$pkgdir" install
}
