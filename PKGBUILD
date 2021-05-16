# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Afri 5chdn <aur@5chdn.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethminer-cuda
_pkgname=ethminer
pkgver=0.19.0
pkgrel=4
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

  # fix https://github.com/ethereum-mining/ethminer/issues/2027
  sed -i '/arch=compute_30/d' libethash-cuda/CMakeLists.txt

  # fix https://github.com/ethereum-mining/ethminer/issues/2290
  git cherry-pick 9ceee532cded1983fe0cf6a5cc3be9b39b409705
  git cherry-pick 671949a73c942593a3cf8318bf67fdb76ac91530

  # fix https://github.com/ethereum-mining/ethminer/pull/2262
  git cherry-pick 6f85e225748029ab8888fec090305f2a7405f046

  mkdir -p build && cd build

  export CC=gcc
  export CXX=g++
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DETHASHCUDA=ON
  cmake --build .
}

package() {
  cd "$_pkgname/build"
  make DESTDIR=$pkgdir install
}
