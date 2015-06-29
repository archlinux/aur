# Maintainer: Dylan <dylan@hashflo.net>

pkg_base=dogecoin
pkgname=('dogecoin-daemon')
pkgver=1.8.2
_git_branch=1.8-maint
pkgrel=2
arch=('i686' 'x86_64')
url="http://dogecoin.com/"
makedepends=('boost' 'automoc4' 'miniupnpc' 'protobuf')
license=('MIT')
source=(https://github.com/dogecoin/dogecoin/archive/$_git_branch.tar.gz
	https://raw.github.com/dogecoin/dogecoin/$_git_branch/contrib/debian/examples/bitcoin.conf
	https://raw.github.com/dogecoin/dogecoin/$_git_branch/contrib/debian/manpages/bitcoind.1
	https://raw.github.com/dogecoin/dogecoin/$_git_branch/contrib/debian/manpages/bitcoin.conf.5)
sha256sums=('4dce42a1835348edd9f4816c92e79ee171ab4317abd8ea6713a53421604b4df5'
            'ad93d42db719310b71129ada2e69c5dce438cbaa900c90c2d8ee062a014cbb88'
            '33deda1a0d805a10cae0f16100f32367d4d109b9deac55a67ecd7e2ec49f80e6'
            '20ce26d2953f34a541f8a0b08b7e6093aa729d11044a60bf0ff4574f97dd36af')
            
build() {
  cd "$srcdir/$pkg_base-$_git_branch"
  ./autogen.sh
  CXXFLAGS="$CXXFLAGS -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1"
  ./configure --prefix=/usr --with-incompatible-bdb
  make
}

package_dogecoin-daemon() {
  pkgdesc="Dogecoin is a peer-to-peer network based digital currency - daemon"
  depends=(boost-libs miniupnpc openssl)
  cd "$srcdir/$pkg_base-$_git_branch"
  install -Dm755 src/dogecoind "$pkgdir"/usr/bin/dogecoind
  install -Dm644 "$srcdir"/bitcoin.conf \
    "$pkgdir/usr/share/doc/$pkgname/examples/dogecoin.conf"
  install -Dm644 "$srcdir"/bitcoind.1 \
    "$pkgdir"/usr/share/man/man1/dogecoind.1
  install -Dm644 "$srcdir"/bitcoin.conf.5 \
    "$pkgdir"/usr/share/man/man5/dogecoin.conf.5
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

