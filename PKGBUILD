# Maintainer: vertion <vertion@protonmail.com>

pkgbase=vertcoin
pkgname=('vertcoin-daemon' 'vertcoin-cli' 'vertcoin-qt' 'vertcoin-tx')
pkgver=0.18.0
pkgrel=1
arch=('x86_64')
url="https://www.vertcoin.org/"
makedepends=('boost' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq' 'gmp')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vertcoin-project/vertcoin-core/archive/refs/tags/$pkgver.tar.gz"

        "vertcoin.sysusers"
        "vertcoin.tmpfiles"
        "vertcoin-qt.desktop"
        "vertcoin-qt.appdata.xml")
sha256sums=('c49c477b214fe4b47ba17861a9305aca15074554170599811332372a334a60b5'
            '3cd12f27d9af2957cdb163518869de5d162da1247f7677f185c9d70d38882ace'
            'a86e6169531e7cc1dbec67d448c48d586ca97616078d0ce1d0e72ee5c38f2997'
            'b303f138e0d86d9819432a3559bb5397e41ca79a08fa5677a09cfbb15cb85165'
            'e6894e103f6f438070723a592cd7a905ec304aaa3592fe2aad72e9eb6cd618d5')
b2sums=('762ad7095c8a297a6becfa834f89de8ea2ab52701c4b3d941335234465b737cab69420ff7c2e0326432d7056983fb84873be9a59de698c3f8c9231390c8c7f78'
        '257f2d33148559afd622e597b1398c94447f432527bb79776e716944fd2de21f8909d421ddca25f9ae758ccb759d60db91186215f852ac8fc660d49edf2a5d77'
        '38b97d6e7f064af6ad2bef56b87f7067805db921d5a651f04cae255778eecfbf96cf9f439318be10853666e609ff49dc7004be90bc6a774dad36351e75c96971'
        '98feb764243fd3fd6d899dd7d9429996cb3c346cff9f4dcbafd609e68714973a4e78ab3dd1e7e66b81ab73c1a35277fcf1ae6b5cbea5288480b48438c47646fc'
        '8671f280b84b092c9c5d2011fdad646130c4c03cf3c67da5a70025e8646ce5f268884307f1b9d4a4652227a448ee50c59757391d81be698f8912e1a45350c285')
validpgpkeys=(28E72909F1717FE9607754F8A7BEB2621678D37D)
changelog=Changelog

prepare() {
  cd "$pkgbase-core-$pkgver"
  autoreconf -fi
}

build() {
  cd $pkgbase-core-$pkgver
  ./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb --disable-tests --disable-bench --disable-dependency-tracking
  make
}

package_vertcoin-qt() {
  pkgdesc="Vertcoin is a peer-to-peer network based digital currency - Qt"
  depends=(boost-libs libevent qt5-base miniupnpc libminiupnpc.so qrencode protobuf zeromq hicolor-icon-theme db gmp)

  cd $pkgbase-core-$pkgver
  install -Dm755 src/qt/vertcoin-qt "$pkgdir"/usr/bin/vertcoin-qt
  install -Dm644 doc/man/vertcoin-qt.1 \
    "$pkgdir"/usr/share/man/man1/vertcoin-qt.1
  install -Dm644 ../vertcoin-qt.desktop \
    "$pkgdir"/usr/share/applications/vertcoin-qt.desktop
  install -Dm644 ../vertcoin-qt.appdata.xml \
    "$pkgdir"/usr/share/metainfo/vertcoin-qt.appdata.xml
  install -Dm644 share/pixmaps/vertcoin256.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vertcoin-qt.png

  for i in 16 32 64 128 256; do
    install -Dm644 share/pixmaps/vertcoin${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/vertcoin-qt.png
  done

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_vertcoin-daemon() {
  pkgdesc="Vertcoin is a peer-to-peer network based digital currency - daemon"
  depends=(boost-libs db libevent miniupnpc libminiupnpc.so sqlite zeromq gmp)
  backup=('etc/vertcoin/vertcoin.conf')

  cd $pkgbase-core-$pkgver
  install -Dm755 src/vertcoind "$pkgdir"/usr/bin/vertcoind
  install -Dm644 contrib/bitcoind.bash-completion \
    "$pkgdir"/usr/share/bash-completion/completions/vertcoind
  install -Dm644 doc/man/vertcoind.1 \
    "$pkgdir"/usr/share/man/man1/vertcoind.1
  install -Dm644 "$srcdir/vertcoin.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/vertcoin.conf"
  install -Dm644 "$srcdir/vertcoin.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/vertcoin.conf"
  mv share/examples/bitcoin.conf share/examples/vertcoin.conf
  install -Dm644 share/examples/vertcoin.conf \
    "$pkgdir/etc/vertcoin/vertcoin.conf"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_vertcoin-cli() {
  pkgdesc="Vertcoin is a peer-to-peer network based digital currency - RPC client"
  depends=(boost-libs libevent)

  cd $pkgbase-core-$pkgver
  install -Dm755 src/vertcoin-cli "$pkgdir"/usr/bin/vertcoin-cli
  install -Dm644 contrib/bitcoin-cli.bash-completion \
    "$pkgdir"/usr/share/bash-completion/completions/vertcoin-cli
  install -Dm644 doc/man/vertcoin-cli.1 \
    "$pkgdir"/usr/share/man/man1/vertcoin-cli.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_vertcoin-tx() {
  pkgdesc="Vertcoin is a peer-to-peer network based digital currency - Transaction tool"
  depends=(boost-libs openssl)

  cd $pkgbase-core-$pkgver
  install -Dm755 src/vertcoin-tx "$pkgdir"/usr/bin/vertcoin-tx
  install -Dm644 contrib/bitcoin-tx.bash-completion \
    "$pkgdir"/usr/share/bash-completion/completions/vertcoin-tx
  install -Dm644 doc/man/vertcoin-tx.1 \
    "$pkgdir"/usr/share/man/man1/vertcoin-tx.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
