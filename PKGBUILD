# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=oktopi-git
pkgver=r1.9895a4b
pkgrel=3
pkgdesc='A fork of Pacman’s GUI Octopi for Chakra.'
arch=('i686' 'x86_64')
url='http://gitorious.org/chakra/oktopi'
license=('GPL')
depends=(kdebase-runtime)
makedepends=(git kdelibs cmake automoc4)
provides=(oktopi)
conflicts=(oktopi)
source=(oktopi.desktop)
sha512sums=('4ce42d0249afd9c307ce1ce67b209fd69996646fc5c3cc261faf4bbf3f2e0a785b69bf1f3ea4ade1b75c95a4140278a2e0d615abad8a9dd706bfb9aebe548f28')
_gitroot='https://gitorious.org/chakra/oktopi.git'
_gitname='oktopi'

pkgver(){
  cd "$srcdir"
  if [[ ! -d "$_gitname" ]]; then
    git clone --depth 1 "$_gitroot" "$_gitname"
  else
    ( cd "$_gitname"
    git pull >&2 )
  fi

  cd "$srcdir"/$_gitname
  ( set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
}

build(){
  cd "$srcdir"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"


  [ ! -d build ] && mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) -DCMAKE_BUILD_TYPE=Release
  make
}
package(){
  cd "$srcdir"/$_gitname-build/build
  make DESTDIR="$pkgdir/" install
  install -Dm644 $srcdir/oktopi.desktop $pkgdir/usr/share/applications/oktopi.desktop
  install -Dm644 ../resources/images/oktopi_yellow.png \
    $pkgdir/usr/share/icons/hicolor/64x64/apps/oktopi.png
}
