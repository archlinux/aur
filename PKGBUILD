# Maintainer: p4block
# Contributor: Rowan Decker <rdecker@scu.edu>
# Contributor: Eric Toombs <ee double you toombs at you waterloo dot see eh?>
# Contributor: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethminer-ocl-git
pkgver=0.11.0.0.20170701.7b678d8a4
pkgrel=1
pkgdesc="Ethereum GPU miner, with roots in Genoil's cpp-ethereum fork. Pure OpenCl version."
arch=('i686' 'x86_64')
depends=(
  'crypto++'
  'leveldb'
  'ocl-icd'
)
makedepends=(
  'gcc'
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
  "$pkgname::git+https://github.com/ethereum-mining/ethminer.git"
)
sha256sums=('SKIP')
provides=(
  'ethminer'
)
conflicts=(
  'ethereum'
  'cpp-ethereum'
  'ethereum-genoil-ocl-git'
)
replaces=(
  'ethereum-genoil-ocl-git'
)

pkgver() {
  cd $pkgname
  echo "`grep -m1 "PROJECT_VERSION" CMakeLists.txt | tr -cd '[[:digit:]].'`.`date +%Y%m%d`.`git log --pretty=format:%h -n 1`"
}

build() {
  msg 'Updating...'
  cd $pkgname
  git submodule update --init --recursive
   
  mkdir -p hunter
  
  export HUNTER_ROOT=hunter
  
  unset CFLAGS #march=native can break the build if set in makepkg.conf
  unset CXXFLAGS
  
  msg 'Building...'
  mkdir -p build && pushd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build .
  popd
}

package() {
  cd $pkgname

  msg 'Installing...'
  make DESTDIR="$pkgdir" install -C build

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
