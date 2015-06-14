# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=oktopi-git
pkgver=7eb4ed6
pkgrel=2
pkgdesc='A fork of Pacman’s GUI Octopi for Chakra.'
arch=('i686' 'x86_64')
url='http://gitorious.org/chakra/oktopi'
license=('GPL')
depends=(kdebase-runtime)
makedepends=(git kdelibs cmake automoc4)
provides=(oktopi)
conflicts=(oktopi)
install='oktopi-git.install'
_gitroot='git://gitorious.org/chakra/oktopi.git'
_gitname='oktopi'

pkgver() {
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    git describe --always | sed 's|-|.|g'
  fi
}

build(){
  cd "$srcdir"
  msg2 "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd $_gitname
    git pull --depth 1 origin
    msg2 "The local files are updated."
  else
    git clone --depth 1 $_gitroot $_gitname
    cd $_gitname
  fi
  
  msg2 "GIT checkout done or server timeout"

  [ ! -d build ] && mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) -DCMAKE_BUILD_TYPE=Release
  make
}
package(){
  cd "$srcdir"/$_gitname/build
  make DESTDIR="$pkgdir/" install
}
