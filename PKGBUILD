# Maintainer: groestlcoin <groestlcoin@gmail.com>

pkgbase=groestlcoin
pkgname=('groestlcoin-daemon' 'groestlcoin-cli' 'groestlcoin-qt' 'groestlcoin-tx' 'groestlcoin-wallet' 'groestlcoin-util')
pkgver=26.0
pkgrel=1
arch=('x86_64')
url="https://www.groestlcoin.org/groestlcoin-core-wallet/"
makedepends=(
  boost
  db5.3
  gmp
  libevent
  libminiupnpc.so
  libsqlite3.so
  libzmq.so
  qrencode
  qt5-base
  qt5-tools
)
license=('MIT')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Groestlcoin/groestlcoin/releases/download/v$pkgver/groestlcoin-$pkgver.tar.gz"
        "$pkgbase-$pkgver.SHA256SUMS::https://github.com/Groestlcoin/groestlcoin/releases/download/v$pkgver/SHA256SUMS"
        "$pkgbase-$pkgver.SHA256SUMS.asc::https://github.com/Groestlcoin/groestlcoin/releases/download/v$pkgver/SHA256SUMS.asc"
        "groestlcoin.sysusers"
        "groestlcoin.tmpfiles"
        "groestlcoin-qt.desktop"
        "groestlcoin-qt.appdata.xml")
sha256sums=('45ff0c7e58e3e6cd9be4db00f8ba02566249538487f5711e64d4f0187414fb46'
            'ebf227f6714f490e6a40c96e80c8c8cae1b7b5e49c69733f4d014456f46238d9'
            'SKIP'
            '766f1732b72ee105aa4380ab9433bc6e7d957896e0f3d84eaf08202dc7c0fc85'
            '3cc8b772cd5bde500d74ec45c870168834b93b3b69197a8b1aa809d8b9a69d4f'
            '4dc7fe4ae360b2bbd2ffbebab8849417c31145adff2ecdcfbb3bb03835cd1cf7'
            '87f9a2bc6c3a91f7fd9668d84e35e69bdaed221c7d4655d39b54561845424e21')
b2sums=('2dc43490e85e83fdb5c4582afb257b9ae863f58add69be4e21d0273c2e420017a59ff5e70fcac27556c12348567641529f9698a4661d8f1474537f596407a30a'
        '46a75f32997540587b3b5971721b01ba9a770d502ff022468293a5b63c2ca5f2e8b5e2d92165a9453d80eab70f44870bd9eb6f1a1e3f12ea1f8f681fcf9e4213'
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
  #remove _FORTIFY_SOURCE from CXXFLAGS to prevent a duplicate definition warning as configure adds _FORTIFY_SOURCE itself
  CXXFLAGS=${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}
  ./configure --prefix=/usr --with-gui=qt5 BDB_LIBS="-ldb_cxx-5.3" BDB_CFLAGS="-I/usr/include/db5.3"
  make
}

package_groestlcoin-qt() {
  pkgdesc="Groestlcoin is a peer-to-peer network based digital currency - Qt"
  depends=(
    db5.3
    gmp
    hicolor-icon-theme
    libevent
    libminiupnpc.so
    libsqlite3.so
    libzmq.so
    qrencode
    qt5-base
  )

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
  depends=(
    db5.3
    gmp
    libevent
    libminiupnpc.so
    libsqlite3.so
    libzmq.so
  )
  backup=('etc/groestlcoin/groestlcoin.conf')

  cd $pkgbase-$pkgver
  install -Dm755 src/groestlcoind "$pkgdir"/usr/bin/groestlcoind
  install -Dm644 contrib/completions/bash/groestlcoind.bash \
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
  install -Dm644 contrib/completions/bash/groestlcoin-cli.bash \
    "$pkgdir/usr/share/bash-completion/completions/groestlcoin-cli"
  install -Dm644 contrib/completions/fish/groestlcoin-cli.fish \
    -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 doc/man/groestlcoin-cli.1 \
    "$pkgdir"/usr/share/man/man1/groestlcoin-cli.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_groestlcoin-tx() {
  pkgdesc="Groestlcoin is a peer-to-peer network based digital currency - Transaction tool"
  depends=(
    db5.3
    libsqlite3.so
  )

  cd $pkgbase-$pkgver
  install -Dm755 src/groestlcoin-tx "$pkgdir"/usr/bin/groestlcoin-tx
  install -Dm644 contrib/completions/bash/groestlcoin-tx.bash \
    "$pkgdir/usr/share/bash-completion/completions/groestlcoin-tx"
  install -Dm644 contrib/completions/fish/groestlcoin-tx.fish \
    -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 doc/man/groestlcoin-tx.1 \
    "$pkgdir"/usr/share/man/man1/groestlcoin-tx.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_groestlcoin-wallet() {
  pkgdesc="Groestlcoin is a peer-to-peer network based digital currency - Wallet tool"
  depends=(
    db5.3
    libsqlite3.so
  )

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
  depends=(
    db5.3
    libsqlite3.so
  )

  cd $pkgbase-$pkgver
  install -Dm755 src/groestlcoin-util "$pkgdir"/usr/bin/groestlcoin-util
  install -Dm644 contrib/completions/fish/groestlcoin-util.fish \
    -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 doc/man/groestlcoin-util.1 \
    "$pkgdir"/usr/share/man/man1/groestlcoin-util.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
