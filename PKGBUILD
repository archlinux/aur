# Contributor: Cyker Way <cykerway at gmail dot com>
# Maintainer:  Cyker Way <cykerway at gmail dot com>

pkgname=blrm-git
pkgver=20161210
pkgrel=1
pkgdesc="A wrapper of rm command with user-defined blacklist."
arch=('i686' 'x86_64')
url="http://projects.cykerway.com/blrm"
license=('GPL3')
depends=('python')
makedepends=('git')
provides=('blrm')
conflicts=('blrm')
source=()
noextract=()

_gitroot="git://github.com/cykerway/blrm.git"
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
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 \
    "$srcdir/$_gitname-build/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/blrm/LICENSE.txt"

  install -Dm644 \
    "$srcdir/$_gitname-build/README.rst" \
    "$pkgdir/usr/share/blrm/README.rst"

  install -Dm644 \
    "$srcdir/$_gitname-build/share/blrm.conf.example" \
    "$pkgdir/usr/share/blrm/blrm.conf.example"

  install -Dm644 \
    "$srcdir/$_gitname-build/share/blacklist.example" \
    "$pkgdir/usr/share/blrm/blacklist.example"
}

# vim:set ts=2 sw=2 et:
