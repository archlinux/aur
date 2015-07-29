# Maintainer: Fabio Zanini <fabio.zanini@tuebingen.mpg.de>
pkgname=python2-ffpopsim-git
pkgver=20130404
pkgrel=5
pkgdesc="Fast Forward Population Genetic Simulation"
arch=('i686' 'x86_64')
url="http://webdav.tuebingen.mpg.de/ffpopsim/index.html"
license=('GPL')
provides=('python2-ffpopsim')
conflicts=('python2-ffpopsim')
depends=('gsl' 'python2-numpy')
makedepends=('git' 'swig2' 'boost')
optdepends=('python2-sphinx: generate python documentation',
 'doxygen: generate C++ documentation',
 'graphviz: generate C++ documentation')
source=('ffpopsim::git+https://github.com/iosonofabio/ffpopsim.git')
md5sums=('SKIP')

_gitroot='https://github.com/iosonofabio/ffpopsim.git'
_gitname='ffpopsim'

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin master
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make python SWIG=swig-2
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" python-install
}

# vim:set ts=2 sw=2 et:
