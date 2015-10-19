# Maintainer: Ordoe ordoe <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum
pkgver=1.0rc2
pkgrel=1
pkgdesc="Ethereum decentralised consensus-based deterministic transaction resolution platform (C++ toolkit, full webthree-umbrella)"
arch=('i686' 'x86_64')
depends=('argtable'
         'boost'
         'boost-libs'
         'curl'
         'crypto++'
         'gmp'
         'jsoncpp'
         'leveldb'
         'libedit'
         'libjson-rpc-cpp'
         'libmicrohttpd'
         'miniupnpc'
         'ncurses'
         'ocl-icd'
         'opencl-headers'
         'openssl'
         'python2'
         'qt5-base'
         'qt5-declarative'
         'qt5-quick1'
         'qt5-quickcontrols'
         'qt5-webengine'
         'qt5-webkit'
         'readline'
         'snappy'
         'llvm'
         'scons'
         'gperftools')
makedepends=('autoconf'
             'automake'
             'cmake'
             'gcc'
             'libtool'
             'v8-3.15'
             'yasm'
             'git'
             'clang')
groups=('ethereum')
url="https://github.com/ethereum/webthree-umbrella"
license=('GPL')
source=(${pkgname%-git}::git+https://github.com/ethereum/webthree-umbrella)
sha256sums=('SKIP')
provides=('alethfive'
          'alethone'
          'alethzero'
          'eth'
          'ethkey'
          'ethminer'
          'ethrpctest'
          'ethvm'
          'exp'
          'lllc'
          'mix'
          'rlp'
          'solc'
          'ethereum'
          'webthree-umbrella')
conflicts=('alethfive'
           'alethone'
           'alethzero'
           'eth'
           'ethkey'
           'ethminer'
           'ethrpctest'
           'ethvm'
           'exp'
           'lllc'
           'mix'
           'rlp'
           'solc'
           'ethereum-git')

build() {
  cd ${pkgname%-git}
  git checkout $pkgver
  git submodule update --init --recursive

  # Fix miniupnpc issue in submodule
  pushd libweb3core
  git cherry-pick 3ae4d8a
  popd

  msg 'Building...'
  mkdir -p build && pushd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release
  make
  popd
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  make DESTDIR="$pkgdir" install -C build
}
