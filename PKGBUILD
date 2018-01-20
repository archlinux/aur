pkgname=raiblocks-cli-git
pkgver=9.0.r136.g92169180
pkgrel=1
pkgdesc="RaiBlocks is a cryptocurrency designed from the ground up for scalable instant transactions and zero transaction fees. Command-line version without wallet GUI or Qt dependencies."
arch=('i686' 'x86_64')
url="http://raiblocks.net/"
license=('BSD 2-clause')
makedepends=('cmake')
depends=('boost>=1.66.0' 'boost-libs>=1.66.0')
provides=(raiblocks)
conflicts=(raiblocks-git)
install=install
pkgver() {
  cd "raiblocks"
  git describe --long --tags | sed 's/^[vV]//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

source=(raiblocks.service
  git+https://github.com/clemahieu/raiblocks.git
  git+https://github.com/weidai11/cryptopp.git
  git+https://github.com/clemahieu/lmdb.git
  git+https://github.com/miniupnp/miniupnp.git
  git+https://github.com/clemahieu/phc-winner-argon2.git)

sha256sums=('53ed2e7cf24c02172e3e804dd8689674867d82ca21b7d03be590d7a9b3a9c8bb'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/raiblocks"
  
  git submodule init

  git config submodule.cryptopp.url $srcdir/cryptopp
  git config submodule.lmdb.url $srcdir/lmdb
  git config submodule.miniupnp.url $srcdir/miniupnp
  git config submodule.phc-winner-argon2.url $srcdir/phc-winner-argon2

  git submodule update --init --recursive

  _flags=( "-D RAIBLOCKS_GUI=OFF" )
  
  if grep -q avx2 /proc/cpuinfo; then
    echo "using AVX2 optimizations"
    _flags+=( "-D ENABLE_AVX2=ON" "-D PERMUTE_WITH_GATHER=ON" "-D PERMUTE_WITH_SHUFFLES=ON" )
  else
    echo "excluding unsupported AVX2 optimizations"
  fi
  if grep -q sse4 /proc/cpuinfo; then
    echo "build with SIMD optimizations"
    _flags+=( "-D RAIBLOCKS_SIMD_OPTIMIZATIONS=ON" )
  else
    echo "excluding unsupported SIMD optimizations"
    _flags+=( "-D RAIBLOCKS_SIMD_OPTIMIZATIONS=OFF" )
  fi
  cmake $_flags ./
}

build() {
  cd "$srcdir/raiblocks"
  make rai_node
  make rai_lib
}

package() {
  cd "$srcdir/raiblocks"


  install -Dm755 rai_node "$pkgdir"/usr/bin/rai_node
  install -Dm644 librai_lib.so "$pkgdir"/usr/lib/librai_lib.so

  install -Dm644 "$srcdir"/raiblocks.service "$pkgdir"/usr/lib/systemd/system/raiblocks-node.service
}

# vim:set ts=2 sw=2 et:
