# Contributor: Johannes Dewemdern  arch at JonnyJD dot net
# Contributor: Adrian Sampson <adrian@radbox.org>

_python=python2
_name=musicbrainzngs

pkgname=$_python-$_name-git
pkgver=20130312
pkgrel=1
pkgdesc="bindings for the MusicBrainz NGS service"
depends=("$_python")
makedepends=("$_python-distribute" 'git')
provides=("$_python-musicbrainzngs=0.3")
conflicts=("$_python-musicbrainzngs")
arch=('any')
source=()
md5sums=()
url="https://github.com/alastair/python-musicbrainz-ngs"
license="BSD"

_gitroot=https://github.com/alastair/python-musicbrainz-ngs.git
_gitname=python-musicbrainz-ngs

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

  $_python setup.py build || return 1
}

check() {
  cd "$srcdir/$_gitname-build"
  $_python setup.py test
}

package() {
  cd "$srcdir/$_gitname-build"
  $_python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
