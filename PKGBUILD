# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=enjoy-git
pkgver=20130402
pkgrel=1
pkgdesc="Music player based on EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('elementary-git' 'lightmediascanner')
makedepends=('git')
options=('!libtool')

_gitroot="git://git.enlightenment.org/apps/enjoy.git"
_gitname="enjoy"

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

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir" install

# delete build directory
  rm -r "$srcdir/$_gitname-build"
}
