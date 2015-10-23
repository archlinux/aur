# Maintainer: Ordoe ordoe <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum-git
pkgver=1.0rc2.r60.g0219ad1
pkgrel=1
pkgdesc="Ethereum decentralised consensus-based deterministic transaction resolution platform (C++ toolkit, full webthree-umbrella, latest unstable git version)"
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
         'qt5-graphicaleffects'
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
source=("${pkgname%-git}::git+https://github.com/ethereum/webthree-umbrella"
        "libethereum-hotfix-boost-1.59.patch"
        "solidity-hotfix-boost-1.59.patch")
sha256sums=('SKIP'
            '6c89b82a5b674bb53401a3d87079c415d4d2c28accceb239beeedb940cf213a0'
            '3d1e45a59c1f9c22564bb04d0aebacb74bffa3c7d72dc475429afb827c8be4f2')
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
           'ethereum')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  msg 'Updating...'
  cd ${pkgname%-git}
  git submodule update --init --recursive

  msg 'Patching...'
  # Fix libethereum compatibility with boost 1.59
  pushd libethereum
  git apply ${srcdir}/libethereum-hotfix-boost-1.59.patch
  popd

  # Fix solidity compatibility with boost 1.59
  pushd solidity
  git apply ${srcdir}/solidity-hotfix-boost-1.59.patch
  popd

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
