# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=opencollada
pkgver=20130222
pkgrel=1
pkgdesc="Stream based reader and writer library for COLLADA files"
arch=(i686 x86_64)
url="https://github.com/KhronosGroup/OpenCOLLADA"
license=('GPL')
depends=('libxml2' 'pcre')
makedepends=('git' 'cmake')
source=('opencollada.conf')
md5sums=('5f7e9d79ab86756648b648ee5ed6ce1d')

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
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"

  make DESTDIR=$pkgdir install

  install -Dm644 $srcdir/opencollada.conf $pkgdir/etc/ld.so.conf.d/opencollada.conf
}

# vim:set ts=2 sw=2 et:
