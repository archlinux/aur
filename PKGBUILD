pkgname=raiblocks-git
pkgver=8.0.r123.g2db8063b
pkgrel=1
pkgdesc="RaiBlocks is a cryptocurrency designed from the ground up for scalable instant transactions and zero transaction fees."
arch=('i686' 'x86_64')
url="http://raiblocks.com/"
license=('BSD 2-clause')
depends=('qt5'  'boost' 'boost-libs')
provides=(raiblocks)
pkgver() {
  cd "raiblocks"
  git describe --long --tags | sed 's/^[vV]//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

source=(git+https://github.com/clemahieu/raiblocks.git
	git+https://github.com/boostorg/beast.git
        git+https://github.com/weidai11/cryptopp.git
        git+https://github.com/LMDB/lmdb.git
        git+https://github.com/miniupnp/miniupnp.git
        git+https://github.com/clemahieu/phc-winner-argon2.git)
noextract=()
md5sums=(SKIP
	 SKIP
	 SKIP
	 SKIP
	 SKIP
	 SKIP)

prepare() {
  cd "$srcdir/raiblocks"

  git submodule init

  git config submodule.beast.url $srcdir/beast
  git config submodule.cryptopp.url $srcdir/cryptopp
  git config submodule.lmdb.url $srcdir/lmdb
  git config submodule.miniupnp.url $srcdir/miniupnp
  git config submodule.phc-winner-argon2.url $srcdir/phc-winner-argon2

  rm *.tar.gz || true 2>/dev/null
  
  git submodule update
  cmake cmake -D RAIBLOCKS_GUI=ON ./
}

build() {
  cd "$srcdir/raiblocks"
  make rai_wallet
  
}

package() {
  cd "$srcdir/raiblocks"

  install -Dm755 rai_wallet "$pkgdir"/usr/bin/rai_wallet
  install -Dm755 rai_node "$pkgdir"/usr/bin/rai_node
}

# vim:set ts=2 sw=2 et:
