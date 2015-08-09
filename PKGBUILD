# Maintainer: neXyon <nexyon at gmail dot com>

pkgname=audaspace-git
pkgver=0.1.127.3f62d90
pkgrel=1
pkgdesc="A feature rich high level audio library."
arch=('i686' 'x86_64')
url="https://github.com/neXyon/audaspace"
license=('MIT')
groups=()
depends=('python' 'openal' 'sdl' 'libsndfile' 'ffmpeg' 'jack')
makedepends=('gcc' 'cmake' 'git' 'python-setuptools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git://github.com/neXyon/audaspace.git")
md5sums=('SKIP')
noextract=()
_gitname="audaspace"

pkgver() {
  cd $_gitname

  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)

  echo 0.1.$revision.$hash
}

build() {
  mkdir -p build
  cd build

  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DBUILD_DEMOS:BOOL=TRUE \
    -DSHARED_LIBRARY:BOOL=TRUE \
    -DWITH_BINDING_DOCS:BOOL=TRUE \
    -DWITH_C:BOOL=TRUE \
    -DWITH_DOCS:BOOL=TRUE \
    -DWITH_FFMPEG:BOOL=TRUE \
    -DWITH_JACK:BOOL=TRUE \
    -DWITH_LIBSNDFILE:BOOL=TRUE \
    -DWITH_OPENAL:BOOL=TRUE \
    -DWITH_PYTHON:BOOL=TRUE \
    -DWITH_SDL:BOOL=TRUE \
    -DDEFAULT_PLUGIN_PATH:PATH=/usr/share/audaspace/plugins \
    -DDOCUMENTATION_INSTALL_PATH:PATH=/usr/share/doc/audaspace || return 1

  make $MAKEFLAGS || return 1
}

package() {
  cd build
  make DESTDIR="$pkgdir" install || return 1
}
