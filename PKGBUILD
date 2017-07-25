# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum-git
pkgver=1.3.0.20170725.b18e9e4ce
pkgrel=1
pkgdesc="The Cpp-Ethereum platform (C++ toolkit, cpp-ethereum including ethminer and eth, latest unstable git version)"
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
url="https://github.com/ethereum/cpp-ethereum"
license=('GPL')
source=(
  "${pkgname%-git}::git+https://github.com/ethereum/cpp-ethereum#branch=develop"
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
  'cpp-ethereum'
)
optdepends=(
  'geth: The go-ethereum commandline client (geth cli).'
  'parity: The fast, light, robust Ethereum client.'
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
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
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
