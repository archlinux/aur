pkgname=bitcoincashd
pkgver=24.1.0
pkgrel=2
pkgdesc="Bitcoin Cash Node with bitcoincashd, bitcoincash-tx, and bitcoincash-cli"
arch=('i686' 'x86_64')
url="https://bitcoincashnode.org"
depends=('boost-libs' 'libevent' 'openssl' 'zeromq' 'miniupnpc')
makedepends=('cmake' 'ninja' 'boost')
license=('MIT')
source=(https://github.com/bitcoin-cash-node/bitcoin-cash-node/archive/v$pkgver.tar.gz
        bitcoincash.conf
        bitcoincash.logrotate
        bitcoincash.service
        bitcoincash.sysusers
        bitcoincash.tmpfiles)
sha256sums=('2f2ff3c3759480b1c8f2d0d4b80c2b9f3c10d58d5e8ee9125584f2b5491c793d'
            '53d49ed7fbf6e0ed25c6c8d77d3ac1e40ac90804161eb3393c71e8c3071cca27'
            '98a89a694437c74950b8f2b157c24e07a2a99c7a78b73e86e989aa0bffc5442b'
            '8521616ae515786dca8b49bf2b156e18fd174955f8224bb94a409eccc8809f3c'
            'd65c37451f6838cfa64fb543c06165711ac1166997145fa7e9290f5c79560159'
            '9f81b4bfaefad0a5cc3573f216e0d5a0b18e5fa782b5feb4261aa2e1081b650b')
backup=('etc/bitcoincash/bitcoincash.conf'
        'etc/logrotate.d/bitcoincash')
provides=('bitcoincash-cli' 'bitcoincash-daemon' 'bitcoincash-tx')

build() {
  cd "$srcdir/bitcoin-cash-node-$pkgver"

  msg2 'Building...'
  mkdir -p build
  pushd build

  cmake -GNinja .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_CLANG_TIDY=OFF \
    -DCLIENT_VERSION_IS_RELEASE=ON \
    -DENABLE_REDUCE_EXPORTS=ON \
    -DENABLE_STATIC_LIBSTDCXX=ON \
    -DBUILD_BITCOIN_WALLET=OFF \
    -DBUILD_BITCOIN_QT=OFF \
    -DENABLE_MAN=OFF \
    -DBUILD_BITCOIN_SEEDER=OFF \
    -DBUILD_LIBBITCOINCONSENSUS=OFF \
    -DCMAKE_INSTALL_PREFIX=$pkgdir/usr

  ninja
  popd
}

package() {
  cd "$srcdir/bitcoin-cash-node-$pkgver"

  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/bitcoincash"

  install -dm 755 "$pkgdir/usr/share/doc/bitcoincash"
  for _doc in \
    $(find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n') \
    release-notes; do
      cp -dpr --no-preserve=ownership "doc/$_doc" \
        "$pkgdir/usr/share/doc/bitcoincash/$_doc"
  done

  pushd build
  cmake -DCOMPONENT=bitcoind -P cmake_install.cmake
  popd
  mv "$pkgdir/usr/bin/bitcoind" "$pkgdir/usr/bin/bitcoincashd"
  mv "$pkgdir/usr/bin/bitcoin-cli" "$pkgdir/usr/bin/bitcoincash-cli"
  mv "$pkgdir/usr/bin/bitcoin-tx" "$pkgdir/usr/bin/bitcoincash-tx"

  install -Dm 600 "$srcdir/bitcoincash.conf" -t "$pkgdir/etc/bitcoincash"
  install -Dm 644 "$srcdir/bitcoincash.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/bitcoincash.logrotate" "$pkgdir/etc/logrotate.d/bitcoincash"
  install -Dm 644 "$srcdir/bitcoincash.sysusers" "${pkgdir}/usr/lib/sysusers.d/bitcoincash.conf"
  install -Dm 644 "$srcdir/bitcoincash.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bitcoincash.conf"

  install -Dm 644 "contrib/bitcoin-cli.bash-completion" \
    "$pkgdir/usr/share/bash-completion/completions/bitcoincash-cli"
  install -Dm 644 "contrib/bitcoin-tx.bash-completion" \
    "$pkgdir/usr/share/bash-completion/completions/bitcoincash-tx"
  install -Dm 644 "contrib/bitcoind.bash-completion" \
    "$pkgdir/usr/share/bash-completion/completions/bitcoincashd"
}
