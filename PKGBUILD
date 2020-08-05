# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Afri 5chdn <aur@5chdn.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethminer-cuda
_pkgname=ethminer
pkgver=0.19.0
pkgrel=1
pkgdesc="Ethereum miner with OpenCL, CUDA and stratum support."
arch=('x86_64')
url="https://github.com/ethereum-mining/ethminer"
license=('MIT')
depends=('mesa' 'pth' 'cuda')
makedepends=('cmake' 'python' 'git')
provides=('ethminer')
conflicts=('ethminer' 'ethminer-git')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build () {
  cd "$_pkgname"
  git submodule update --init --recursive

  # add missing library for linking
  sed -i 's/CLI11 Boost::system)/CLI11 Boost::system Boost::filesystem)/' ethminer/CMakeLists.txt

  mkdir -p build && cd build

  export CC=gcc-8
  export CXX=g++-8
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DETHASHCUDA=ON
  cmake --build .
}

package() {
  cd "$_pkgname/build"
  make DESTDIR=$pkgdir install
}
