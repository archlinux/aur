# Maintainer: Eric Toombs <ee double you toombs at you waterloo dot see eh?>
# Contributor: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum-genoil-git
pkgver=.20170506.8d36c4c92
pkgrel=1
pkgdesc="Ethereum decentralised consensus-based deterministic transaction resolution platform (C++ toolkit, cpp-ethereum including ethminer and eth, Genoil's version)"
arch=('i686' 'x86_64')
depends=(
  'boost'
  'crypto++'
  'leveldb'
  'ocl-icd'
  'libmicrohttpd'
  'miniupnpc'
  'opencl-headers'
  'libjson-rpc-cpp-git'
)
makedepends=(
  'autoconf'
  'automake'
  'gcc'
  'libtool'
  'cmake'
  'git'
)
optdepends=(
  'solidity: The Solidity Contract-Oriented Programming Language'
)
groups=('ethereum')
url="https://github.com/Genoil/cpp-ethereum"
license=('GPL')
source=(
  "${pkgname%-git}::git+https://github.com/Genoil/cpp-ethereum"
)
sha256sums=(
  "SKIP"
)
provides=(
  'bench'
  'eth'
  'ethkey'
  'ethminer'
  'ethvm'
  'rlp'
)
conflicts=(
  'ethereum'
  'ethereum-git'
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
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUNDLE=miner
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
