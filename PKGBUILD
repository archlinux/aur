# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=isrcsubmit-git
pkgver=20121018
pkgrel=1
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="https://github.com/JonnyJD/musicbrainz-isrcsubmit"
license=('GPL3')
depends=('python2' 'python2-musicbrainz2>=0.7.0')
makedepends=('git')
provides=('isrcsubmit')
conflicts=('isrcsubmit')
options=(!emptydirs)

_gitroot=https://github.com/JonnyJD/musicbrainz-isrcsubmit.git
_gitname=isrcsubmit

build() {
  cd "$srcdir"
  msg 'Connecting to GIT server....'

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg 'The local files are updated.'
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting build...'

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py build
}
package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
