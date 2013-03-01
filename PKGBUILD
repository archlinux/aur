# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=emotion_generic_players-git
pkgver=20130301
pkgrel=1
pkgdesc="Players for Emotion using the 'generic' module - Currently VLC"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl-git' 'vlc')
makedepends=('git')
conflicts=('emotion_generic_players-svn')

_gitroot="git://git.enlightenment.org/core/emotion_generic_players.git"
_gitname="emotion_generic_players"

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

package(){
  cd "$_gitname-build"
  make DESTDIR="$pkgdir" install
  
# install license files
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  
  rm -r "$srcdir/$_gitname-build"
}
