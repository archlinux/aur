# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=mixxx-git
pkgver=release.1.12.0.beta1.r747.gab53f56
pkgrel=1
pkgdesc="Digital DJ mixing software. Development branch from git with cpu optimization enabled"
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
depends=('libid3tag' 'libmad' 'portaudio' 'qt4' 'libshout' 'taglib' 'portmidi' 'protobuf' 'fftw' 'libusbx' 'chromaprint' 'rubberband')
makedepends=('git' 'scons' 'pkgconfig' 'glu')
provides=(mixxx)
conflicts=(mixxx mixxx-bzr mixxx1.10-bzr mixxx1.11-bzr mixxx-beta mixxx1.11-git mixxx1.12-git mixxxold mixxx-aac)

_gitroot=https://github.com/mixxxdj
_gitname=mixxx

pkgver() {
  cd "$srcdir/$_gitname"
  echo "$(git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"/"$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  
  cd "$srcdir/$_gitname-build"  
  scons qtdir=/usr/lib/qt4 prefix=/usr install_root="$pkgdir/usr" tuned=1
}

package() {
  cd "$srcdir/$_gitname-build"
  scons qtdir=/usr/lib/qt4 prefix=/usr install_root="$pkgdir/usr" install
}

