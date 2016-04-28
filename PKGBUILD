# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum-git
pkgver=v1.2.2.r105.gd6a1bce
pkgrel=1
pkgdesc="Ethereum decentralised consensus-based deterministic transaction resolution platform (C++ toolkit, full webthree-umbrella, latest unstable git version)"
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
  'libcl'
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
  'v8-3.15'
  'gperftools'
)
makedepends=(
  'autoconf'
  'automake'
  'cmake'
  'gcc'
  'libtool'
  'yasm'
  'git'
  'clang'
)
groups=('ethereum')
url="https://github.com/ethereum/webthree-umbrella"
license=('GPL')
source=("${pkgname%-git}::git+https://github.com/ethereum/webthree-umbrella")
sha256sums=('SKIP')
provides=(
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
)
conflicts=(
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
)

pkgver() {
  cd ${pkgname%-git}
  git checkout -q develop
  git pull -q
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  msg 'Updating...'
  cd ${pkgname%-git}
  git checkout develop
  git pull
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
