# Maintainer: Afri 5chdn <aur@cach.co>

pkgname=solidity
pkgver=0.4.0
pkgrel=1
pkgdesc="The Solidity Contract-Oriented Programming Language (Including solc and lllc)"
arch=('i686' 'x86_64')
depends=(
  'boost'
  'boost-libs'
  'crypto++'
  'jsoncpp'
  'glibc'
)
makedepends=(
  'autoconf'
  'automake'
  'cmake'
  'gcc'
  'gcc-libs'
  'libtool'
  'yasm'
  'git'
)
groups=('ethereum')
url="https://github.com/ethereum/solidity"
license=('GPL')
source=("${pkgname%-git}::git+https://github.com/ethereum/solidity")
sha256sums=('SKIP')
provides=(
  'lll'
  'lllc'
  'liblll'
  'solidity'
  'solc'
  'libsoldevcore'
  'libsolevmasm'
  'libsolidity'
)

build() {

  msg 'Updating...'
  cd ${pkgname%-git}
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
