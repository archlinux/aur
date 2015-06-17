# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=periscope-git
pkgver=20121120
pkgrel=4
pkgdesc="Subtitles searching module written in python."
url="https://github.com/patrickdessalle/periscope"
arch=('any')
license=('GPL3')
depends=('python2-beautifulsoup3')
makedepends=('git' 'python2-setuptools')
conflicts=('periscope' 'periscope-svn')
provides=('periscope' 'periscope-svn')

_gitroot="https://github.com/patrickdessalle/periscope.git"
_gitname="periscope"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  
  cd "$srcdir/$_gitname-build"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

