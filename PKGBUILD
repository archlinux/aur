# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname=redcrane-engine-git
_pkgname=redcrane-engine
pkgver=bb4ae5b
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
source=("$_pkgname::git+https://github.com/RedcraneStudio/redcrane-engine"
        "redcrane-engine.sh")
md5sums=('SKIP'
         '772bd491a84a817838627d80d29733aa')

pkgver() {
  cd $_pkgname
  git rev-parse HEAD | cut -c 1-7
}

build() {
  mkdir -p build
  cd build
  cmake ../$_pkgname -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
  cp $srcdir/redcrane-engine.sh $srcdir/build/redcrane-engine
}

check() {
  cd build
  make run_all_tests
}

package() {
  cd $srcdir/build
  rm -rf $(find . -name "*.cmake") $(find . -name "*.make") $(find . -name "Makefile") tests/ src/*/CMakeFiles/ src/*/*/CMakeFiles/ */CMakeFiles/ CMakeCache.txt 

  cd $pkgdir

  mkdir -p usr/lib/$_pkgname
  cp -a $srcdir/build/* usr/lib/$_pkgname
  rm -rf usr/lib/$_pkgname/CMakeFiles

  mkdir -p usr/bin
  ln -s /usr/lib/$_pkgname/redcrane-engine usr/bin/redcrane-engine

  mkdir -p usr/share/licenses/$pkgname
  cp $srcdir/$_pkgname/LICENSE usr/share/licenses/$pkgname/LICENSE
}
