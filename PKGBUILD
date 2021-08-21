# Maintainer: Endlesseden <eden AT rose DOT place>

pkgname=ethash-lib
_pkgname=ethash
pkgver=0.7.0
pkgrel=1
pkgdesc="C/C++ implementation of Ethash – the Ethereum Proof of Work algorithm"
arch=('any')
url="https://github.com/chfast/ethash"
license=('GPL3')
makedepends=('cmake' 'gcc10' 'perl' 'python' 'git')
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname" "$pkgname" "$_pkgname-git" "$pkgname-git")
source=($_pkgname.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
options=(!ccache)

prepare() {
	cd "$srcdir"
	if [ -e "$_pkgname"-"$pkgver" ]; then
	     if [ ! -e "$_pkgname" ]; then
                    mv "$_pkgname"-"$pkgver" "$_pkgname"
	     fi
	fi
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
