# Maintainer: Eric Toombs <ee double you toombs at you waterloo dot see eh?>
# Contributor: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum-genoil-git
pkgver=1.1.7.20170511.8d36c4c92
pkgrel=1
pkgdesc="Ethereum decentralised consensus-based deterministic transaction resolution platform (C++ toolkit, cpp-ethereum including ethminer and eth, Genoil's version)"
arch=('i686' 'x86_64')
depends=(
  'boost'
  'crypto++'
  'cuda'
  'leveldb'
  'ocl-icd'
  'libmicrohttpd'
  'miniupnpc'
  'libjson-rpc-cpp-git'
)
makedepends=(
  'gcc5'
  'cmake'
  'git'
  'opencl-headers'
)
optdepends=(
  'solidity: The Solidity Contract-Oriented Programming Language'
)
groups=('ethereum')
url="https://github.com/Genoil/cpp-ethereum"
license=('GPL')
source=(
  "$pkgname::git+https://github.com/Genoil/cpp-ethereum"
)
sha256sums=(
  "SKIP"
)
provides=(
  'ethminer'
)
conflicts=(
  'ethereum'
  'ethereum-git'
  'cpp-ethereum'
)

pkgver() {
  cd "$pkgname"
  echo "`grep -m1 "GENOIL_VERSION" CMakeLists.txt | tr -cd '[[:digit:]].'`.`date +%Y%m%d`.`git log --pretty=format:%h -n 1`"
}

build() {
  msg 'Updating...'
  cd "$pkgname"
  git submodule update --init --recursive

  msg 'Building...'
  mkdir -p build && pushd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUNDLE=cudaminer \
      -DCMAKE_C_COMPILER=/usr/bin/gcc-5 \
      -DCMAKE_CXX_COMPILER=/usr/bin/g++-5 \
      -DCMAKE_RANLIB=/usr/bin/gcc-ranlib-5 \
      -DCMAKE_AR=/usr/bin/gcc-ar-5
  make
  popd
}

package() {
  cd "$pkgname"

  msg 'Installing...'
  make DESTDIR="$pkgdir" install -C build

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
