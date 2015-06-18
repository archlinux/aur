# Maintainer: Fabio Zanini <fabio.zanini@tuebingen.mpg.de>
pkgname=python2-ffpopsim-git
pkgver=20130404
pkgrel=3
pkgdesc="Fast Forward Population Genetic Simulation"
arch=('i686' 'x86_64')
url="http://webdav.tuebingen.mpg.de/ffpopsim/index.html"
license=('GPL')
provides=('python2-ffpopsim')
conflicts=('python2-ffpopsim')
depends=('gcc-libs' 'gsl' 'boost' 'python2' 'python2-numpy')
makedepends=('git' 'swig2')
optdepends=('python2-sphinx: generate python documentation',
 'doxygen: generate C++ documentation',
 'graphviz: generate C++ documentation')
source=('ffpopsim::git+htts://github.com/iosonofabio/ffpopsim.git#branch=master')
md5sums=() #generate with 'makepkg -g'

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

  make python
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" python-install
}

# vim:set ts=2 sw=2 et:
