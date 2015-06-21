# Maintainer: schuay <jakob.gruber@gmail.com>

pkgname=picmi-git
pkgver=20130301
pkgdesc="A nonogram logic game for KDE"
pkgrel=1
arch=('i686' 'x86_64')
url="http://github.com/schuay/picmi/"
license=('GPL')
conflicts=('picmi')
depends=('kdebase-runtime' 'libkdegames')
makedepends=('cmake' 'git' 'automoc4')

_gitroot=git://github.com/schuay/picmi.git
_gitname=picmi-git

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
