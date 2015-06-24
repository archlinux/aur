# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=mixxx1.12-git
pkgver=beta1.r71.g20ddd8f
pkgrel=1
pkgdesc="Digital DJ mixing software. Branch 1.12 (beta) from git with cpu optimization enabled"
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
depends=('libid3tag' 'libmad' 'portaudio' 'qt4' 'libshout' 'taglib' 'portmidi' 'protobuf' 'libusbx' 'chromaprint' 'rubberband')
makedepends=('git' 'scons' 'pkgconfig' 'glu')
provides=(mixxx)
conflicts=(mixxx mixxx-bzr mixxx1.10-bzr mixxx1.11-bzr mixxx-beta mixxx-git mixxx1.11-git mixxxold mixxx-aac )

_gitroot=https://github.com/mixxxdj
_gitname=mixxx

pkgver() {
  cd "$srcdir/$_gitname"
  # cutting off 'release-1.12.0-' prefix from the git tag (the dirty way)
  echo "$(git describe --tags | sed -r 's/release-1\.12\.0-//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone -b 1.12 "$_gitroot"/"$_gitname"
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

