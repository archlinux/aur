# Maintainer: groestlcoin <groestlcoin@gmail.com>

pkgbase=groestlcoin
pkgname=('groestlcoin-daemon' 'groestlcoin-cli' 'groestlcoin-qt' 'groestlcoin-tx' 'groestlcoin-wallet' 'groestlcoin-util')
pkgver=25.0
pkgrel=1
arch=('x86_64')
url="https://www.groestlcoin.org/groestlcoin-core-wallet/"
makedepends=('boost' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq' 'db5.3' 'gmp')
license=('MIT')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Groestlcoin/groestlcoin/releases/download/v$pkgver/groestlcoin-$pkgver.tar.gz"
        "$pkgbase-$pkgver.SHA256SUMS::https://github.com/Groestlcoin/groestlcoin/releases/download/v$pkgver/SHA256SUMS"
        "$pkgbase-$pkgver.SHA256SUMS.asc::https://github.com/Groestlcoin/groestlcoin/releases/download/v$pkgver/SHA256SUMS.asc"
        "groestlcoin.sysusers"
        "groestlcoin.tmpfiles"
        "groestlcoin-qt.desktop"
        "groestlcoin-qt.appdata.xml")
sha256sums=('23d27c2135cce492d7680b1b939ee2dbae1d56df9eb161301e3712eaaa94988e'
            '65e0ec1d0c6605fb398af8e9647b69dbe23660454c98c7094670deda0e03462b'
            'SKIP'
            '766f1732b72ee105aa4380ab9433bc6e7d957896e0f3d84eaf08202dc7c0fc85'
            '3cc8b772cd5bde500d74ec45c870168834b93b3b69197a8b1aa809d8b9a69d4f'
            '4dc7fe4ae360b2bbd2ffbebab8849417c31145adff2ecdcfbb3bb03835cd1cf7'
            '87f9a2bc6c3a91f7fd9668d84e35e69bdaed221c7d4655d39b54561845424e21')
b2sums=('770ff8a5e26b6bbab10c79cd1e6814681ab66861a774c8d224c70d63e585d6645f881902b46d0fa98ca73c965ba3bf44bdce55f1098c032ebc7defd6c85bd10e'
        '857b0feba1b8ad956470d7b928fd52dbe42309ffc1931d2217e185ecc64383476554f715a58382f97ab0bbda7870ef7e13ff02dedd3b902f65eeeedbae37e266'
        'SKIP'
        'f6bfe677aea28c40794f3c37e48d908215543736c558ef9f3f7ada6cf1d9016200821903c6c676f4841092170cfa64ee8f03f697aea19ea82b78877f9167526b'
        'ebf2151e205daeb14ab5260f204040dcb2bf9969d3e6be8c166abdb74f86ef92a05174cc97f2360c8044c81e8bdfd68a74bf1f114dce8b75e421b4184165a54f'
        '3d0fc6a8f970f4415e577c687d154e08763b8ad9bab9018af2687ee940cf423b25624e3581b49e90112ba2a02e385747740f9b30b8dceb0f4c8d5f8f82096ab9'
        'f08bc357fa34653a8d7588b6ce06fb4ff686d4f701bdbe15ca12648ed62bb6afbaf1680f77c340a291735a2f56086a061a2d671ab19b95d95803917c40ce6f9a')
validpgpkeys=(287AE4CA1187C68C08B49CB2D11BD4F33F1DB499)
changelog=Changelog

prepare() {
  sha256sum -c --ignore-missing "$pkgbase-$pkgver.SHA256SUMS"
  cd "$pkgbase-$pkgver"
  autoreconf -fi
}

build() {
  cd $pkgbase-$pkgver
  ./configure --prefix=/usr --with-gui=qt5 BDB_LIBS="-ldb_cxx-5.3" BDB_CFLAGS="-I/usr/include/db5.3"
  make
}

package_groestlcoin-qt() {
  pkgdesc="Groestlcoin is a peer-to-peer network based digital currency - Qt"
  depends=(boost-libs libevent qt5-base miniupnpc libminiupnpc.so qrencode protobuf zeromq hicolor-icon-theme db5.3 gmp)

  cd $pkgbase-$pkgver
  install -Dm755 src/qt/groestlcoin-qt "$pkgdir"/usr/bin/groestlcoin-qt
  install -Dm644 contrib/completions/fish/groestlcoin-qt.fish \
    -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 doc/man/groestlcoin-qt.1 \
    "$pkgdir"/usr/share/man/man1/groestlcoin-qt.1
  install -Dm644 ../groestlcoin-qt.desktop \
    "$pkgdir"/usr/share/applications/groestlcoin-qt.desktop
  install -Dm644 ../groestlcoin-qt.appdata.xml \
    "$pkgdir"/usr/share/metainfo/groestlcoin-qt.appdata.xml
  install -Dm644 src/qt/res/src/groestlcoin.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/groestlcoin-qt.svg

  for i in 16 32 64 128 256; do
    install -Dm644 share/pixmaps/groestlcoin${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/groestlcoin-qt.png
  done

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_groestlcoin-daemon() {
  pkgdesc="Groestlcoin is a peer-to-peer network based digital currency - daemon"
  depends=(boost-libs db5.3 libevent miniupnpc libminiupnpc.so sqlite zeromq gmp)
  backup=('etc/groestlcoin/groestlcoin.conf')

  cd $pkgbase-$pkgver
  install -Dm755 src/groestlcoind "$pkgdir"/usr/bin/groestlcoind
  install -Dm644 contrib/completions/bash/groestlcoind.bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/groestlcoind"
  install -Dm644 contrib/completions/fish/groestlcoind.fish \
    -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 doc/man/groestlcoind.1 \
    "$pkgdir"/usr/share/man/man1/groestlcoind.1
  install -Dm644 contrib/init/groestlcoind.service \
    "$pkgdir/usr/lib/systemd/system/groestlcoind.service"
  install -Dm644 "$srcdir/groestlcoin.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/groestlcoin.conf"
  install -Dm644 "$srcdir/groestlcoin.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/groestlcoin.conf"
  install -Dm644 share/examples/groestlcoin.conf \
    "$pkgdir/etc/groestlcoin/groestlcoin.conf"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_groestlcoin-cli() {
  pkgdesc="Groestlcoin is a peer-to-peer network based digital currency - RPC client"
  depends=(boost-libs libevent)

  cd $pkgbase-$pkgver
  install -Dm755 src/groestlcoin-cli "$pkgdir"/usr/bin/groestlcoin-cli
  install -Dm644 contrib/completions/bash/groestlcoin-cli.bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/groestlcoin-cli"
  install -Dm644 contrib/completions/fish/groestlcoin-cli.fish \
    -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 doc/man/groestlcoin-cli.1 \
    "$pkgdir"/usr/share/man/man1/groestlcoin-cli.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_groestlcoin-tx() {
  pkgdesc="Groestlcoin is a peer-to-peer network based digital currency - Transaction tool"
  depends=(boost-libs)

  cd $pkgbase-$pkgver
  install -Dm755 src/groestlcoin-tx "$pkgdir"/usr/bin/groestlcoin-tx
  install -Dm644 contrib/completions/bash/groestlcoin-tx.bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/groestlcoin-tx"
  install -Dm644 contrib/completions/fish/groestlcoin-tx.fish \
    -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 doc/man/groestlcoin-tx.1 \
    "$pkgdir"/usr/share/man/man1/groestlcoin-tx.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_groestlcoin-wallet() {
  pkgdesc="Groestlcoin is a peer-to-peer network based digital currency - Wallet tool"
  depends=(boost-libs)

  cd $pkgbase-$pkgver
  install -Dm755 src/groestlcoin-wallet "$pkgdir"/usr/bin/groestlcoin-wallet
  install -Dm644 contrib/completions/fish/groestlcoin-wallet.fish \
    -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 doc/man/groestlcoin-wallet.1 \
    "$pkgdir"/usr/share/man/man1/groestlcoin-wallet.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_groestlcoin-util() {
  pkgdesc="Groestlcoin is a peer-to-peer network based digital currency - Util tool"
  depends=(boost-libs)

  cd $pkgbase-$pkgver
  install -Dm755 src/groestlcoin-util "$pkgdir"/usr/bin/groestlcoin-util
  install -Dm644 contrib/completions/fish/groestlcoin-util.fish \
    -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 doc/man/groestlcoin-util.1 \
    "$pkgdir"/usr/share/man/man1/groestlcoin-util.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
