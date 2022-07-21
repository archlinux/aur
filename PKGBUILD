# Maintainer: Dylan <dylan@psilly.com>

_pkgbase=dogecoin
pkgname=('dogecoin-daemon' 'dogecoin-cli' 'dogecoin-tx')
pkgver=1.14.6
pkgrel=1
arch=('x86_64')
url='https://dogecoin.com/'
makedepends=('boost' 'libevent' 'zeromq')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_pkgbase/$_pkgbase/archive/v$pkgver.tar.gz"
        'dogecoin.sysusers'
        'dogecoin.tmpfiles')
sha256sums=('341088d4d59c5086a430ec64ce81c92a9629146ef50d6c4a4d868b31ce2cef79'
            'eae13ea082a6431bb9552b5bddd8d1a5100ba883540c1e520685272d4307ca7f'
            'eaf022a60cb3297a31148b047bd473eef5bb08ec011f6ed29869061a03342d94')
validpgpkeys=('1DDC450B45DB5ADCCF5DDA7F8E4217C6D47D946D')

prepare() {
  cd "$_pkgbase-$pkgver"
  autoreconf -fi
}

build() {
  cd $_pkgbase-$pkgver
  ./configure --prefix=/usr --with-gui=no --with-incompatible-bdb --without-miniupnpc
  make
}

package_dogecoin-daemon() {
  pkgdesc="Dogecoin is a peer-to-peer network based digital currency - daemon"
  depends=(boost-libs libevent zeromq)
  conflicts=(dogecoin-qt)

  cd $_pkgbase-$pkgver
  install -Dm755 src/dogecoind "$pkgdir"/usr/bin/dogecoind
  install -Dm644 contrib/dogecoind.bash-completion \
    "$pkgdir"/usr/share/bash-completion/completions/dogecoind
  install -Dm644 doc/man/dogecoind.1 \
    "$pkgdir"/usr/share/man/man1/dogecoind.1
  install -Dm644 contrib/init/dogecoind.service \
    "$pkgdir/usr/lib/systemd/system/dogecoind.service"
  install -Dm644 "$srcdir/dogecoin.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/dogecoin.conf"
  install -Dm644 "$srcdir/dogecoin.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/dogecoin.conf"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_dogecoin-cli() {
  pkgdesc="Dogecoin is a peer-to-peer network based digital currency - RPC client"
  depends=(boost-libs libevent)

  cd $_pkgbase-$pkgver
  install -Dm755 src/dogecoin-cli "$pkgdir"/usr/bin/dogecoin-cli
  install -Dm644 contrib/dogecoin-cli.bash-completion \
    "$pkgdir"/usr/share/bash-completion/completions/dogecoin-cli
  install -Dm644 doc/man/dogecoin-cli.1 \
    "$pkgdir"/usr/share/man/man1/dogecoin-cli.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_dogecoin-tx() {
  pkgdesc="Dogecoin is a peer-to-peer network based digital currency - Transaction tool"
  depends=(boost-libs openssl)

  cd $_pkgbase-$pkgver
  install -Dm755 src/dogecoin-tx "$pkgdir"/usr/bin/dogecoin-tx
  install -Dm644 contrib/dogecoin-tx.bash-completion \
    "$pkgdir"/usr/share/bash-completion/completions/dogecoin-tx
  install -Dm644 doc/man/dogecoin-tx.1 \
    "$pkgdir"/usr/share/man/man1/dogecoin-tx.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
