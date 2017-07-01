# Maintainer: p4block
# Contributor: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum-genoil-ocl-git
pkgver=.20170701.83cb02125
pkgrel=1
pkgdesc="Genoil's Ethereum GPU miner, built with OpenCL support"
arch=('i686' 'x86_64')
depends=(
  'boost'
  'crypto++'
  'leveldb'
  'ocl-icd'
  'libmicrohttpd'
  'miniupnpc'
  'opencl-headers'
)
makedepends=(
  'gcc'
  'cmake'
  'git'
)
optdepends=(
  'solidity: The Solidity Contract-Oriented Programming Language'
)
groups=('ethereum')
url="https://github.com/gemoil/cpp-ethereum"
license=('GPL')
source=(
  "${pkgname%-git}::git+https://github.com/mmstick/cpp-ethereum.git"
)
sha256sums=('SKIP')
provides=(
  'ethminer'
)
conflicts=(
  'ethereum'
  'cpp-ethereum'
)

pkgver() {
  cd ${pkgname%-git}
  echo "`grep -m1 "cpp\-ethereum\ VERSION" CMakeLists.txt | tr -cd '[[:digit:]].'`.`date +%Y%m%d`.`git log --pretty=format:%h -n 1`"
}

build() {
  msg 'Updating...'
  cd ${pkgname%-git}
  git submodule update --init --recursive

  msg 'Building...'
  mkdir -p build && pushd build
  cmake  -DBUNDLE=miner .. -DCMAKE_INSTALL_PREFIX=/usr
  make
  popd
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  make DESTDIR="$pkgdir" install -C build

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
