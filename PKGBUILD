# Maintainer: Max Gonzih <iam@gonzih.org>
# Contributor Diego José <diegoxter1006@gmail.com>

pkgname=plexydesk-git
pkgver=20121102
pkgrel=1
pkgdesc="A Desktop extension which lets you efficiently use your desktop background."
arch=('i686' 'x86_64')
url="http://www.plexyplanet.org/"
license=('GPL')
depends=('qt')
makedepends=('git' 'cmake')
provides=('plexydesk')

_gitroot=https://github.com/plexydesk/plexydesk.git
_gitname=plexydesk

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

  cmake -DCMAKE_INSTALL_PREFIX=/usr/ .
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
