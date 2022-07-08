# Maintainer: Endlesseden <eden AT rose DOT place>

pkgname=ethash-lib
_pkgname=ethash
pkgver=0.9.0
pkgrel=1
pkgdesc="C/C++ implementation of Ethash – the Ethereum Proof of Work algorithm."
arch=('x86_64' 'i386' 'i686' 'pentium4' 'core2' 'armv6h' 'armv7h' 'armv8h' 'armv9h' 'arm64')
url="https://github.com/chfast/ethash"
license=('GPL3')
makedepends=('cmake' 'perl' 'python' 'gzip')
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname" "$pkgname" "$_pkgname-git" "$pkgname-git")
source=($_pkgname.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('16a49901ee6e76c45d8f39c533ec54bb')
sha256sums=('7d7430129b237afb08a642e180307b82bf5b981c2a6566d0e1d9ec61310f9bfe')
sha512sums=('3fbc6731a9b29f03aa01b0b65f8cab544c96990a3a6416741ba8935ee422b0db31377f972a0ded48df7ac2dc2c1c7e911cc3a6d770717a09002229f16528c1a0')
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
