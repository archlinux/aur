# Maintainer: EndlessEden <endlesseden@users.noreply.github.com>

pkgname=ethash-lib
_pkgname=ethash
pkgver=1.1.0
pkgrel=1
pkgdesc="C/C++ implementation of Ethash – the Ethereum Proof of Work algorithm."
arch=('x86_64' 'i386' 'i686' 'pentium4' 'core2' 'armv6h' 'armv7h' 'armv8h' 'armv9h' 'arm64')
url="https://github.com/chfast/ethash"
license=('GPL3')
makedepends=('cmake' 'perl' 'python' 'gzip')
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname" "$pkgname" "$_pkgname-git" "$pkgname-git")
source=($_pkgname.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('19878a61ba274b2b364fc297dc780927')
sha256sums=('73b327f3c23f407389845d936c1138af6328c5841a331c1abe3a2add53c558aa')
sha512sums=('5d583614323fc77855ea9c3990c0c373a99e790e11ca48f2ee5be3e64f4d4cdc1198a65a21c07659fca7399ec44859ff8b374a65a3b015eddf047cfc58ea0cc6')
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
