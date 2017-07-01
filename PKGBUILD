# Maintainer: Rowan Decker <rdecker@scu.edu>
# Contributor: Eric Toombs <ee double you toombs at you waterloo dot see eh?>
# Contributor: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethminer-git
pkgver=0.11.0.0.20170630.7b678d8a4
pkgrel=1
pkgdesc="Ethereum miner with CUDA and stratum support. chfast's version."
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
url="https://github.com/ethereum-mining/ethminer"
license=('GPL')
source=(
  "$pkgname::git+https://github.com/ethereum-mining/ethminer"
)
sha256sums=(
  "SKIP"
)
provides=(
  'ethminer'
)
conflicts=(
  'ethminer'
  'ethereum'
  'ethereum-git'
  'cpp-ethereum'
)

pkgver() {
  cd "$pkgname"
  echo "`grep -m1 "PROJECT_VERSION" CMakeLists.txt | tr -cd '[[:digit:]].'`.`date +%Y%m%d`.`git log --pretty=format:%h -n 1`"
}

build() {
  msg 'Updating...'
  cd "$pkgname"
  git submodule update --init --recursive

  msg 'Building...'
  mkdir -p build && pushd build
  unset CFLAGS #march=native can break the build if set in makepkg.conf
  unset CXXFLAGS
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DETHASHCUDA=ON \
      -DCMAKE_C_COMPILER=/usr/bin/gcc-5 \
      -DCMAKE_CXX_COMPILER=/usr/bin/g++-5 \
      -DCMAKE_RANLIB=/usr/bin/gcc-ranlib-5 \
      -DCMAKE_AR=/usr/bin/gcc-ar-5
  cmake --build .
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
