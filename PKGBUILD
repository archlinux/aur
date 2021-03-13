# Maintainer: Endlesseden <eden AT rose DOT place>

pkgname=ethash-lib
_pkgname=ethash
pkgver=r506.e4a15c3
pkgrel=1
pkgdesc="C/C++ implementation of Ethash – the Ethereum Proof of Work algorithm"
arch=('any')
url="https://github.com/chfast/ethash"
license=('GPL3')
makedepends=('cmake' 'gcc' 'perl' 'python' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=($_pkgname::"git+${url}.git")
sha256sums=('SKIP')
options=(!ccache)

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "$srcdir/${_pkgname}"
  git submodule update --init --recursive

  if [ -d build ]; then
  rm -r build
  fi
  mkdir build && cd build
  
  cmake \
  -DCMAKE_INSTALL_PREFIX="/usr" \
  -DCMAKE_INSTALL_SBINDIR="bin" \
  -DETHASH_NATIVE=ON \
  -DNATIVE=ON ..
  #  cmake --build .. # BUGGED!
  make
}

package() {
  cd "$_pkgname/build"
  make DESTDIR=$pkgdir install
}
