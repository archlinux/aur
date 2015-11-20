# Contributor: Cyker Way <cykerway at gmail dot com>
# Maintainer:  Cyker Way <cykerway at gmail dot com>

pkgname=ncmpy-git
pkgver=20151120
pkgrel=1
pkgdesc="A curses-based MPD client written in Python."
arch=('i686' 'x86_64')
url="http://www.cykerway.com/projects/ncmpy"
license=('GPL3')
depends=('python2' 'python2-mpd')
makedepends=('git')
provides=('ncmpy')
conflicts=('ncmpy')
source=()
noextract=()

_gitroot="git://github.com/cykerway/ncmpy.git"
_gitname="master"

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

  #
  # BUILD HERE
  #
  # Nothing to be done.
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 \
    "$srcdir/$_gitname-build/LICENSE" \
    "$pkgdir/usr/share/licenses/ncmpy/LICENSE"

  install -Dm644 \
    "$srcdir/$_gitname-build/INSTALL" \
    "$pkgdir/usr/share/ncmpy/INSTALL"

  install -Dm644 \
    "$srcdir/$_gitname-build/README.md" \
    "$pkgdir/usr/share/ncmpy/README.md"

  install -Dm644 \
    "$srcdir/$_gitname-build/share/ncmpy.conf.example" \
    "$pkgdir/usr/share/ncmpy/ncmpy.conf.example"
}

# vim:set ts=2 sw=2 et:
