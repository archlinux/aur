# Maintainer: aimileus < $(echo YWltaWxpdXNAcHJvdG9ubWFpbC5jb20K | base64 -d) >
# Contributor: Afri 5chdn <aur@5chdn.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethminer
pkgver=0.13.0
pkgrel=1
pkgdesc="Ethereum miner with OpenCL, CUDA and stratum support."
arch=('x86_64')
url="https://github.com/ethereum-mining/ethminer"
license=('MIT')
depends=('mesa')
makedepends=(
  'cmake'
  'python'
)
optdepends=('cuda: NVIDIA cuda mining support')
conflicts=('ethereum')
source=("https://github.com/ethereum-mining/ethminer/archive/v${pkgver}.tar.gz")
sha256sums=('72bf827a922b797d556f8f03980185c4857bb82074b4c8b5f63b5d5e140893b8')

build () {

  cd $pkgname-$pkgver
  mkdir -p build && cd build

  if [ -f '/opt/cuda/bin/nvcc' ]; then
    export CC=gcc-6
    export CCX=g++-6
    cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DETHASHCUDA=ON
  else
    cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release
  fi

  make
}


package() {
  cd $pkgname-$pkgver/build
  make DESTDIR=$pkgdir install
}
