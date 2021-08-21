# Maintainer: Endlesseden <eden AT rose DOT place>

pkgname=ethash-lib-git
_pkgname=ethash-git
pkgver=0.7.0.r11.gb784418
pkgrel=1
pkgdesc="C/C++ implementation of Ethash – the Ethereum Proof of Work algorithm"
arch=('any')
url="https://github.com/chfast/ethash"
license=('GPL3')
makedepends=('cmake' 'gcc10' 'perl' 'python' 'git')
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname" "$pkgname" "$_pkgname-git" "$pkgname-git")
source=($_pkgname::"git+$url.git")
sha256sums=('SKIP')
options=(!ccache)

pkgver() {
        cd "$srcdir/${_pkgname}"
        git describe | sed 's,v,,g; s,-,.r,; s,-,.,g'
}

prepare () {
  cd "$srcdir"/"${_pkgname}"
  git submodule update --init --recursive
}


build () {
  cd "$srcdir/${_pkgname}"

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
  cd "$_pkgname/build"
  make DESTDIR=$pkgdir install
}
