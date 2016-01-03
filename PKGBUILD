# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=mixxx_stable-git
pkgver=release.2.0.0.r15.g3702b79
pkgrel=1
pkgdesc="Digital DJ mixing software. Stable version from git with cpu optimization enabled. Note: git branch for 2.0 is still called 1.12"
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
depends=('libid3tag' 'libmad' 'portaudio' 'qt4' 'libshout' 'taglib' 'portmidi' 'protobuf' 'libusbx' 'chromaprint' 'rubberband' 'vamp-plugin-sdk' 'sqlite' 'opus' 'opusfile')
makedepends=('git' 'scons' 'pkgconfig' 'glu')
provides=(mixxx)
conflicts=(mixxx mixxx1.11-git mixxx1.12-git)

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
    git clone -b 1.12 "$_gitroot"/"$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  
  cd "$srcdir/$_gitname-build"
  scons qtdir=/usr/lib/qt4 prefix=/usr install_root="$pkgdir/usr" -j2 virtualize=0 localecompare=1 qt_sqlite_plugin=0 opus=1 optimize=native build=release
}

package() {
  cd "$srcdir/$_gitname-build"
  scons qtdir=/usr/lib/qt4 prefix=/usr install_root="$pkgdir/usr" install
}

