# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=elementary-git
pkgver=20130222
pkgrel=1
pkgdesc="EFL widget toolkit - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('efl-git')
makedepends=('git')
conflicts=('elementary' 'elementary-svn')
provides=('elementary' 'elementary-svn')
options=('!libtool' '!emptydirs' '!strip')

_gitroot="git://git.enlightenment.org/core/elementary.git"
_gitname="elementary"

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

# remove build directory
  rm -r "$srcdir/$_gitname-build"
}
