pkgname=nanocurrency
pkgver=16.1
_tag="V$pkgver"
pkgrel=2
pkgdesc="Nano (formerly RaiBlocks) is a cryptocurrency designed from the ground up for scalable instant transactions and zero transaction fees."
arch=('i686' 'x86_64')
url="https://nano.org/"
license=('BSD 2-clause')
makedepends=('cmake')
depends=('qt5-base'  'boost>=1.66.0' 'boost-libs>=1.66.0')
provides=(raiblocks nanocurrency)
conflicts=("raiblocks" "raiblocks-git" "raiblocks-node-git" "nanocurrency-node-git")
install=install

source=(nanowallet.desktop
  nanowallet128.png
  nano-node.service
  "git+https://github.com/nanocurrency/raiblocks.git#tag=${_tag}"
  git+https://github.com/weidai11/cryptopp.git
  "git+https://github.com/nanocurrency/lmdb.git#branch=lmdb_0_9_21"
  git+https://github.com/miniupnp/miniupnp.git
  git+https://github.com/clemahieu/phc-winner-argon2.git)

sha256sums=('6b824bfd5a9f2c1cd8d6a30f858a7bdc7813a448f4894a151da035dac5af2f91'
            '27179351dbc3e000d54b5b13f0c2326b4c4bd06e93b1d0b2ea1849609aeadc2e'
            'c219c91db98f33097e7d96ef0f0c95e4b9d6226ac2ab90e30be7f955c43bfa35'
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

  _flags=( "-D RAIBLOCKS_GUI=ON" )
  
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
  make nano_wallet
  make rai_node
}

package() {
  cd "$srcdir/raiblocks"

  install -Dm755 nano_wallet "$pkgdir"/usr/bin/nano_wallet
  ln -s /usr/bin/nano_wallet "$pkgdir"/usr/bin/rai_wallet
  install -Dm755 rai_node "$pkgdir"/usr/bin/rai_node
  ln -s /usr/bin/rai_node "$pkgdir"/usr/bin/nano_node

  install -Dm644 "$srcdir"/nanowallet128.png "$pkgdir"/usr/share/pixmaps/nanowallet128.png
  install -Dm644 "$srcdir"/nanowallet.desktop "$pkgdir"/usr/share/applications/nanowallet.desktop
  #ln -s /usr/share/applications/nanowallet.desktop "$pkgdir"/usr/lib/systemd/system/raiblocks.service

  install -Dm644 "$srcdir"/nano-node.service "$pkgdir"/usr/lib/systemd/system/nano-node.service
  ln -s /usr/lib/systemd/system/nano-node.service "$pkgdir"/usr/lib/systemd/system/raiblocks-node.service
}

# vim:set ts=2 sw=2 et:
