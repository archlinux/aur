# Maintainer: Endlesseden <eden AT rose DOT place>

pkgname=ethash-lib-git
_pkgname=ethash
pkgver=0.9.0.r3.g902f37e
pkgrel=1
pkgdesc="C/C++ implementation of Ethash – the Ethereum Proof of Work algorithm. - Git"
arch=('any')
url="https://github.com/chfast/ethash"
license=('GPL3')
makedepends=('cmake' 'perl' 'python' 'git')
provides=("$_pkgname" "$_pkgname-lib" "$_pkgname-git" "$pkgname")
conflicts=("$_pkgname" "$_pkgname-lib")
source=($_pkgname-git::"git+$url.git")
sha256sums=('SKIP')
options=(!ccache)
export cuda=0 # change this to cuda=1 if you want to build with cuda.

if [ "$cuda" -gt "0" ]; then
     export cudaopts="-DCMAKE_C_COMPILER=/opt/cuda/bin/gcc -DCMAKE_CXX_COMPILER=/opt/cuda/bin/g++"
     echo "Cuda Superpowers Enabled."
     makedepends+=('cuda')
else
     export cudaopts='-DETHASH_BUILD_TESTS=OFF'
fi


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
  

  if [ $cuda -gt "0" ]; then
  	echo "Building with Cuda"
  fi

  cmake .. \
  -DCMAKE_INSTALL_PREFIX="/usr" \
  -DCMAKE_INSTALL_SBINDIR="bin" \
  -DETHASH_NATIVE=ON \
  -DNATIVE=ON \
  $cudaopts

  #  cmake --build .. # BUGGED!
  make
}

package() {
  cd "$_pkgname-git/build"
  make DESTDIR=$pkgdir install
}
