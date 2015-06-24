# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=mixxx1.11-git
pkgver=20140424.568d9ce
pkgrel=1
pkgdesc="Digital DJ mixing software. Branch 1.11 (stable) from git with cpu optimization enabled"
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
depends=('libid3tag' 'libmad' 'portaudio' 'qt4' 'qtwebkit' 'libogg' 'libvorbis' 'libsndfile' 'libshout' 'taglib' 'portmidi' 'protobuf' 'fftw' 'libusbx' 'chromaprint')
makedepends=('git' 'scons' 'pkgconfig' 'glu')
optdepends=('vamp-plugin-sdk: Vamp support')
provides=(mixxx)
conflicts=(mixxx mixxx-bzr mixxx1.10-bzr mixxx1.11-bzr mixxx-beta mixxx-git mixxxold mixxx-aac)

_gitroot=https://github.com/mixxxdj
_gitname=mixxx

pkgver() {
  cd "$srcdir/$_gitname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone -b 1.11 "$_gitroot"/"$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  
  cd "$srcdir/$_gitname-build/$_gitname"
  scons qtdir=/usr/lib/qt4 prefix=/usr install_root="$pkgdir/usr" tuned=1
}

package() {
  cd "$srcdir/$_gitname-build/$_gitname"
  scons qtdir=/usr/lib/qt4 prefix=/usr install_root="$pkgdir/usr" install
}

