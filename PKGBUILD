# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=opencollada
pkgver=20130130
pkgrel=1
pkgdesc="Stream based reader and writer library for COLLADA files"
arch=(i686 x86_64)
url="https://github.com/KhronosGroup/OpenCOLLADA"
license=('GPL')
depends=('libxml2' 'pcre')
makedepends=('git' 'cmake')

_gitroot=git://github.com/KhronosGroup/OpenCOLLADA.git
_gitname=opencollada

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

  [[ -d build ]] && rm -r build
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SHARED=ON
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"

  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
