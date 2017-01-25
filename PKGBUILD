# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum
pkgver=1.2.9
pkgrel=2
pkgdesc="Ethereum decentralised consensus-based deterministic transaction resolution platform (C++ toolkit, full webthree-umbrella)"
arch=('i686' 'x86_64')
depends=(
  'argtable'
  'boost'
  'boost-libs'
  'curl'
  'crypto++'
  'gmp'
  'jsoncpp'
  'leveldb'
  'libedit'
  'libjson-rpc-cpp-git'
  'libmicrohttpd'
  'miniupnpc'
  'ncurses'
  'ocl-icd'
  'opencl-headers'
  'openssl'
  'python2'
  'qt5-base'
  'qt5-declarative'
  'qt5-webengine'
  'readline'
  'snappy'
  'gperftools'
)
makedepends=(
  'autoconf'
  'automake'
  'cmake'
  'gcc'
  'libtool'
  'git'
)
groups=('ethereum')
url="https://github.com/ethereum/webthree-umbrella"
license=('GPL')
source=(
  "${pkgname%-git}::git+https://github.com/ethereum/webthree-umbrella"
)
sha256sums=(
  'SKIP'
)
provides=(
  'alethzero'
  'bench'
  'eth'
  'ethkey'
  'ethminer'
  'ethrpctest'
  'ethvm'
  'lllc'
  'mix-ide'
  'rlp'
  'solc'
)
conflicts=(
  'cpp-ethereum'
  'solidity'
  'solidity-git'
  'ethereum-git'
)

build() {

  msg 'Updating...'
  cd ${pkgname%-git}
  git checkout release
  git pull
  git checkout v$pkgver
  git submodule update --init --recursive

  msg 'Building...'
  mkdir -p build && pushd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
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
