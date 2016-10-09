# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum-git
pkgver=1.3.0.git.b24e8be
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
optdepends=(
  'solidity: The Solidity Contract-Oriented Programming Language'
)
groups=('ethereum')
url="https://github.com/ethereum/cpp-ethereum"
license=('GPL')
source=(
  "${pkgname%-git}::git+https://github.com/ethereum/cpp-ethereum#branch=develop"
  "https://patch-diff.githubusercontent.com/raw/ethereum/cpp-ethereum/pull/3340.patch"
)
sha256sums=(
  "SKIP"
  "bd04ddf927b1e686744fa4de034e4e248f3d48058b74ea6618854d3d92ea9aff"
)
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

pkgver() {
  cd ${pkgname%-git}
  echo "`grep -m1 "cpp\-ethereum\ VERSION" CMakeLists.txt | tr -cd '[[:digit:]].'`.git.`git log --pretty=format:%h -n 1`"
}

build() {
  msg 'Updating...'
  cd ${pkgname%-git}
  git submodule update --init --recursive

  msg 'Patching...'
  git apply ${srcdir}/3340.patch

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
