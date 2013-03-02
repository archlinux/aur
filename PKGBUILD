# Maintainer: mutantmonkey <mutantmonkey@mutantmonkey.in>
pkgname=stag-git
pkgver=20121102
pkgrel=1
pkgdesc="A C curses based mp3/ogg/flac tagging application (git version)"
arch=('i686' 'x86_64')
url="http://cryptm.org/~sturm/stag.html"
license=('custom:none')
groups=()
depends=('ncurses' 'taglib')
makedepends=('git')
options=('!buildflags')
provides=('stag')
conflicts=('stag')

_gitroot=https://github.com/smabie/stag.git
_gitname=stag

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

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm 755 stag $pkgdir/usr/bin/stag
  install -D stag.1 $pkgdir/usr/share/man/man1/stag.1
}

# vim:set ts=2 sw=2 et:
