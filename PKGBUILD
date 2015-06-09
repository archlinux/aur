# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum-git
pkgver=20150327
pkgrel=1
pkgdesc="Decentralised Consensus-based Deterministic Transaction Resolution Platform"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'curl'
         'crypto++'
         'gmp'
         'jsoncpp'
         'leveldb'
         'libjson-rpc-cpp-git'
         'libmicrohttpd'
         'miniupnpc'
         'ncurses'
         'nodejs'
         'openssl'
         'python2'
         'qt5-base'
         'qt5-declarative'
         'qt5-quick1'
         'qt5-quickcontrols'
         'qt5-webengine'
         'qt5-webkit'
         'readline'
         'snappy')
makedepends=('autoconf'
             'automake'
             'cmake'
             'gcc'
             'git'
             'libtool'
             'yasm')
groups=('ethereum')
url="https://github.com/ethereum/cpp-ethereum"
license=('GPL')
source=(${pkgname%-git}::git+https://github.com/ethereum/cpp-ethereum)
sha256sums=('SKIP')
provides=('abi'
          'alethzero'
          'cpp-ethereum'
          'eth'
          'ethrpctest'
          'ethereum'
          'lllc'
          'mix'
          'neth'
          'rlp'
          'sc'
          'solc')
conflicts=('abi'
           'alethzero'
           'cpp-ethereum'
           'elixir'
           'eth'
           'ethrpctest'
           'ethereum'
           'ethereum-serpent'
           'lllc'
           'mix'
           'neth'
           'rlp'
           'sc'
           'secp256k1'
           'solc')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  mkdir -p build && pushd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release \
           -DVMTRACE=0 \
           -DFATDB=1 \
           -DEVMJIT=0
  #make -j $(cat /proc/cpuinfo | grep processor | wc -l)
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
