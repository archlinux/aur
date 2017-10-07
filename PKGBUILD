# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname=redcrane-engine-git
_pkgname=redcrane-engine
pkgver=ad727e5
pkgrel=1
pkgdesc="A (WIP) low-level game engine written in C++ with C and Lua bindings."
arch=('x86_64')
url="https://redcrane.net/"
license=("custom:BSD-3-Clause")
depends=("boost-libs"
         "sdl2"
         "freetype2"
         "bullet"
         "luajit"
         "glm"
         "libuv")
         # "glew"
         # "lua51-mpack"
         # "imagemagick"
source=($_pkgname::git+https://github.com/RedcraneStudio/redcrane-engine)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git rev-parse HEAD | cut -c 1-7
}

build() {
  mkdir -p build
  cd build
  cmake ../$_pkgname -DCMAKE_BUILD_TYPE=Release
  make
}

check() {
  cd build
  make run_all_tests
}

package() {
  cd $pkgdir

  mkdir -p usr/lib/$_pkgname
  mkdir -p usr/bin

  mkdir -p usr/share/licenses/$pkgname
  cp $srcdir/$_pkgname/LICENSE usr/share/licenses/$pkgname/LICENSE

  cp -a $srcdir/build/* usr/lib/$_pkgname
  rm -rf usr/lib/$_pkgname/CMakeFiles
  ln -s /usr/lib/$_pkgname/src/redc usr/bin/redcrane-engine
}
