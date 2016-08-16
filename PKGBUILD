# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum-git
pkgver=v1.3.0.r18580.g6859b4a
pkgrel=1
pkgdesc="Ethereum decentralised consensus-based deterministic transaction resolution platform (C++ toolkit, cpp-ethereum including ethminer and eth, latest unstable git version)"
arch=('i686' 'x86_64')
depends=(
  'boost'
  'crypto++'
  'leveldb'
  'libcl'
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
groups=('ethereum')
url="https://github.com/ethereum/cpp-ethereum"
license=('GPL')
source=("${pkgname%-git}::git+https://github.com/ethereum/cpp-ethereum")
sha256sums=('SKIP')
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

#pkgver() {
#  cd ${pkgname%-git}
#  git checkout -q develop
#  git pull -q
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

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
