# Maintainer: Endlesseden <eden AT rose DOT place>

pkgname=ethash-lib
_pkgname=ethash
pkgver=0.7.0
pkgrel=1
pkgdesc="C/C++ implementation of Ethash – the Ethereum Proof of Work algorithm."
arch=('x86_64' 'i386' 'i686' 'pentium4' 'core2' 'armv6h' 'armv7h' 'armv8h' 'armv9h' 'arm64')
url="https://github.com/chfast/ethash"
license=('GPL3')
makedepends=('cmake' 'gcc10' 'perl' 'python' 'gzip')
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname" "$pkgname" "$_pkgname-git" "$pkgname-git")
source=($_pkgname.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('935ccbc1ba5f9113cc005b4aad8f068b')
sha256sums=('2cd202e2596cf0e6492fe1d866d537ae41bff62107f577d8d793d5e858173149')
options=(!ccache)
export cuda=0 # change this to cuda=1 if you want to build with cuda.

if [ "$cuda" -gt "0" ]; then
     export cudaopts="-DCMAKE_C_COMPILER=/opt/cuda/bin/gcc -DCMAKE_CXX_COMPILER=/opt/cuda/bin/g++"
     echo "Cuda Superpowers Enabled."
     makedepends+=('cuda')
else
     export cudaopts='-DETHASH_BUILD_TESTS=OFF'
fi


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
  cd "$_pkgname/build"
  make DESTDIR=$pkgdir install
}
