# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=ecrire-git
pkgver=20130227
pkgrel=1
pkgdesc="Simple text editor based on EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('elementary' 'desktop-file-utils')
makedepends=('git' 'cmake')
install=ecrire.install

_gitroot="git://git.enlightenment.org/apps/ecrire.git"
_gitname="ecrire"

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

  mv cmake/Modules/legacy/* cmake/Modules/

  cmake . -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install

  rm -r "$srcdir/$_gitname-build"
}
