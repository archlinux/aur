# Maintainer: Afri 5chdn <aur@cach.co>

pkgname=solidity-git
pkgver=v0.4.0.r2.g8a057e3
pkgrel=1
pkgdesc="The Solidity Contract-Oriented Programming Language (Including solc, lllc; from latest unstable git version)"
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
