# Maintainer: Michael Düll <mail@akurei.me> PGP-Key: 6D666EC8

pkgname=gr-ais-git
pkgrel=1
pkgver=20160213
pkgdesc="Automatic Information System decoder for shipborne position reporting for the Gnuradio project"

arch=('i686' 'x86_64')
url="https://github.com/bistromath/gr-ais"
license=('GPL')
depends=('gnuradio')
makedepends=('git' 'cmake')
provides=('gr-ais')

_gitroot="https://github.com/bistromath/gr-ais.git"
_gitname="gr-ais"

pkgver() {
    date +%Y%m%d
}

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
  cd "$srcdir/$_gitname-build/"

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
  make
}

package() {
  cd "$srcdir/$_gitname-build/build/"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
