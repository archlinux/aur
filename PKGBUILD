# Maintainer: Lukas Sabota <lukas@lwsabota.com>
# Contributor: Lukas Sabota <lukas@lwsabota.com>
pkgname=qjoypad-panzi-git
pkgver=v4.2.1.r1.gf9816ca
pkgrel=1
pkgdesc="Panzi's fork of QJoyPad with some small additional features and some bug/memory leak fixes."
arch=('i686' 'x86_64')
url="https://github.com/panzi/qjoypad"
license=('GPL2')
depends=('qt4' 'libxt' 'libsystemd')
makedepends=('git')
provides=('qjoypad')
conflicts=('qjoypad')

_gitroot=https://github.com/panzi/qjoypad.git
_gitname=qjoypad

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi

  pkgver=pkgver

  msg "GIT checkout done or server timeout"
}

build() {
  cd "$srcdir"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "$srcdir/$_gitname-build"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
