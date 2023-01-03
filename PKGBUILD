# Maintainer: vertion <vertion@protonmail.com>

pkgbase=vertcoin
pkgname=('vertcoin-daemon' 'vertcoin-cli' 'vertcoin-qt' 'vertcoin-tx' 'vertcoin-wallet' 'vertcoin-util')
pkgver=22.1
pkgrel=1
arch=('x86_64')
url="https://www.vertcoin.org/"
makedepends=('boost' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq' 'gmp' 'db5.3')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vertcoin-project/vertcoin-core/releases/download/v$pkgver/vertcoin-$pkgver.tar.gz"
        "$pkgbase-$pkgver.SHA256SUMS::https://github.com/vertcoin-project/vertcoin-core/releases/download/v$pkgver/SHA256SUMS"
        "$pkgbase-$pkgver.SHA256SUMS.asc::https://github.com/vertcoin-project/vertcoin-core/releases/download/v$pkgver/SHA256SUMS.asc"
        "vertcoin.sysusers"
        "vertcoin.tmpfiles"
        "vertcoin-qt.desktop"
        "vertcoin-qt.appdata.xml")
sha256sums=('601d0b6370198c718f102d4c96768c9df668b140aea8def38f4a23bc3afe55af'
            'a36af7726ae9991aaf50fb71b9e1912f91de28c17328db89b15a4e573f72a819'
            'SKIP'
            '3cd12f27d9af2957cdb163518869de5d162da1247f7677f185c9d70d38882ace'
            'a86e6169531e7cc1dbec67d448c48d586ca97616078d0ce1d0e72ee5c38f2997'
            'b303f138e0d86d9819432a3559bb5397e41ca79a08fa5677a09cfbb15cb85165'
            'd399c2dc411b9978f4d815cfe97ce1c4152bb522135cd00ac8e322655accff94')
b2sums=('4476d3517b556335b13cb8c8fa857a4742b5f68897ad049ef0b55a2333fb03008f3e55e2c6401c6f90b1dab0e54dfbd2189b81f938cbde078d3c6966d341d0b8'
        '91c060e6f91f040c79e59949687cc2b83c682436df5fbfa3cfbc886d8afb6d48aca4827ed9af061abf2c95d7f9eebf983aaf584ad42c666479cb7ec42ccdd4ef'
        'SKIP'
        '257f2d33148559afd622e597b1398c94447f432527bb79776e716944fd2de21f8909d421ddca25f9ae758ccb759d60db91186215f852ac8fc660d49edf2a5d77'
        '38b97d6e7f064af6ad2bef56b87f7067805db921d5a651f04cae255778eecfbf96cf9f439318be10853666e609ff49dc7004be90bc6a774dad36351e75c96971'
        '98feb764243fd3fd6d899dd7d9429996cb3c346cff9f4dcbafd609e68714973a4e78ab3dd1e7e66b81ab73c1a35277fcf1ae6b5cbea5288480b48438c47646fc'
        'e9165e966dcbb5ccbb6ce4a4a7e5d1bcae65a707f2310560aad4d57fdcabda723c84c53fee3fe56a4ce2c7b7a74f2fa9cd1b088edf5385a663f9a54f78816443')
validpgpkeys=(28E72909F1717FE9607754F8A7BEB2621678D37D)
changelog=Changelog

prepare() {
  cd "$pkgbase-$pkgver"
  autoreconf -fi
}

build() {
  cd $pkgbase-$pkgver
  ./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb --disable-tests --disable-bench BDB_LIBS="-ldb_cxx-5.3" BDB_CFLAGS="-I/usr/include/db5.3"
  make
}

package_vertcoin-qt() {
  pkgdesc="Vertcoin is a peer-to-peer network based digital currency - Qt"
  depends=(boost-libs libevent qt5-base miniupnpc libminiupnpc.so qrencode protobuf zeromq hicolor-icon-theme db5.3 gmp)

  cd $pkgbase-$pkgver
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
  depends=(boost-libs db5.3 libevent miniupnpc libminiupnpc.so sqlite zeromq gmp)
  backup=('etc/vertcoin/vertcoin.conf')

  cd $pkgbase-$pkgver
  install -Dm755 src/vertcoind "$pkgdir"/usr/bin/vertcoind
  install -Dm644 contrib/bitcoind.bash-completion \
    "$pkgdir"/usr/share/bash-completion/completions/vertcoind
  install -Dm644 doc/man/vertcoind.1 \
    "$pkgdir"/usr/share/man/man1/vertcoind.1
  install -Dm644 "$srcdir/vertcoin.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/vertcoin.conf"
  install -Dm644 "$srcdir/vertcoin.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/vertcoin.conf"
  install -Dm644 share/examples/vertcoin.conf \
    "$pkgdir/etc/vertcoin/vertcoin.conf"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_vertcoin-cli() {
  pkgdesc="Vertcoin is a peer-to-peer network based digital currency - RPC client"
  depends=(boost-libs libevent)

  cd $pkgbase-$pkgver
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

  cd $pkgbase-$pkgver
  install -Dm755 src/vertcoin-tx "$pkgdir"/usr/bin/vertcoin-tx
  install -Dm644 contrib/bitcoin-tx.bash-completion \
    "$pkgdir"/usr/share/bash-completion/completions/vertcoin-tx
  install -Dm644 doc/man/vertcoin-tx.1 \
    "$pkgdir"/usr/share/man/man1/vertcoin-tx.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_vertcoin-wallet() {
  pkgdesc="Vertcoin is a peer-to-peer network based digital currency - Wallet tool"
  depends=(boost-libs openssl libevent)

  cd $pkgbase-$pkgver
  install -Dm755 src/vertcoin-wallet "$pkgdir"/usr/bin/vertcoin-wallet
  install -Dm644 doc/man/vertcoin-wallet.1 \
    "$pkgdir"/usr/share/man/man1/vertcoin-wallet.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_vertcoin-util() {
  pkgdesc="Vertcoin is a peer-to-peer network based digital currency - Util tool"
  depends=(boost-libs openssl libevent)

  cd $pkgbase-$pkgver
  install -Dm755 src/vertcoin-util "$pkgdir"/usr/bin/vertcoin-util
  install -Dm644 doc/man/vertcoin-util.1 \
    "$pkgdir"/usr/share/man/man1/vertcoin-util.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
