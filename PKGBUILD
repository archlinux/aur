# Maintainer: Endlesseden <eden AT rose DOT place>

pkgname=ethash-lib-git
_pkgname=ethash

pkgver=0.7.0.r11.gb784418
pkgrel=1
pkgdesc="C/C++ implementation of Ethash – the Ethereum Proof of Work algorithm"
arch=('any')
url="https://github.com/chfast/ethash"
license=('GPL3')
makedepends=('cmake' 'gcc10' 'perl' 'python' 'git')
provides=("$_pkgname" "$_pkgname-lib" "$_pkgname-git" "$pkgname")
conflicts=("$_pkgname" "$_pkgname-lib" "$_pkgname-git" "$pkgname")
source=($_pkgname-git::"git+$url.git")
sha256sums=('SKIP')
options=(!ccache)

pkgver() {
        cd "$srcdir/"$_pkgname-git""
        git describe | sed 's,v,,g; s,-,.r,; s,-,.,g'
}

prepare () {
  cd "$srcdir"/"$_pkgname-git"
  git submodule update --init --recursive
}


build () {
  cd "$srcdir/$_pkgname-git"

  if [ -d build ]; then
  rm -r build
  fi
  mkdir build && cd build
  
  cmake \
  -DCMAKE_INSTALL_PREFIX="/usr" \
  -DCMAKE_INSTALL_SBINDIR="bin" \
  -DETHASH_NATIVE=ON \
  -DETHASH_BUILD_TESTS=OFF \
  -DNATIVE=ON ..
  #  cmake --build .. # BUGGED!
  make
}

package() {
  cd "$_pkgname-git/build"
  make DESTDIR=$pkgdir install
}
