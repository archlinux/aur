# Maintainer: Dylan <dylan@hashflo.net>

pkg_base=peercoin
pkgname=('peercoin-daemon')
pkgver=0.6.3
_git_branch=master
pkgrel=1
arch=('i686' 'x86_64')
url="http://peercoin.net/"
makedepends=('boost' 'automoc4' 'miniupnpc' 'protobuf')
license=('MIT')
source=(https://github.com/ppcoin/ppcoin/archive/$_git_branch.tar.gz
	https://raw.github.com/ppcoin/ppcoin/$_git_branch/contrib/debian/examples/bitcoin.conf
	https://raw.github.com/ppcoin/ppcoin/$_git_branch/contrib/debian/manpages/bitcoind.1
	https://raw.github.com/ppcoin/ppcoin/$_git_branch/contrib/debian/manpages/bitcoin.conf.5)

sha256sums=('29cc58504c6114fa6ed83be52f943e5a6d4970a328e47a48d83f751c381266b5'
            '9488b7ed7c55b682976dd2fcfed832f0d7e4ff6d4ea4879c89655957b0cd4c13'
            'd9c406a3b79331b5c894b46ea7301b15730c157f4f11df930ac66366fc1c725d'
            'bc012bdbebd4702fa75f2c051a59d5d00e1ab93f55feef6499a58bd09cab50f6')
            
build() {
  cd "$srcdir/ppcoin-$_git_branch"
  CXXFLAGS="$CXXFLAGS -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1"
  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS"
}

package_peercoin-daemon() {
  pkgdesc="Peercoin is a peer-to-peer network based digital currency - daemon"
  depends=(boost-libs miniupnpc openssl)
  cd "$srcdir/ppcoin-$_git_branch"
  install -Dm755 src/ppcoind "$pkgdir"/usr/bin/ppcoind
  install -Dm644 "$srcdir"/bitcoin.conf \
    "$pkgdir/usr/share/doc/$pkgname/examples/peercoin.conf"
  install -Dm644 "$srcdir"/bitcoind.1 \
    "$pkgdir"/usr/share/man/man1/peercoind.1
  install -Dm644 "$srcdir"/bitcoin.conf.5 \
    "$pkgdir"/usr/share/man/man5/peercoin.conf.5
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

