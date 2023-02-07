# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=bitcoin-cash-node-qt
pkgver=26.0.0
pkgrel=4
pkgdesc="Bitcoin Cash Node with bitcoind, bitcoin-cli, bitcoin-tx, bitcoin-seeder and bitcoin-qt"
arch=('i686' 'x86_64')
url="https://bitcoincashnode.org"
depends=('boost-libs' 'libevent' 'desktop-file-utils' 'qt5-base' 'protobuf' 'openssl' 'miniupnpc' 'zeromq' 'qrencode' )
makedepends=('cmake' 'ninja' 'boost' 'qt5-tools' 'help2man' )
license=('MIT')
source=(https://github.com/bitcoin-cash-node/bitcoin-cash-node/archive/v$pkgver.tar.gz
        bitcoin.conf
        bitcoin.logrotate
        bitcoin.service
        bitcoin-reindex.service
        bitcoin.install
        bitcoin.desktop
        db.patch
        queue.patch)
sha256sums=('c87dfdf97ec8a1ee5ddb6447fcdea6e42714c79bb9424e5312dba5b083a8fcd2'
            'c30e5c7e0e97b001fdeac5f4510d5ebc0e0499ec086325e845db609a24f2e22f'
            '8f05207b586916d489b7d25a68eaacf6e678d7cbb5bfbac551903506b32f904f'
            'f2fd9d8331238727333cf2412ba3759cb194a65b2060eff36808b24c06382104'
            '497dbeefb9cd9792757a9b6e1fbfd92710d19990ee2959add6c30533ae40b6f6'
            'e2d6c370fa9f1564013ce0d255f764b8972284d5909d509a306a43994a49a113'
            '0ba95ed8914f1c3d7fb3601a9735d53be0445aa070a003f7938bfff754677578'
            '4b374456a28d1172933aad0b285aa7dd4e9d67058b9b9958dd0065c6c46acba1'
            'a668667fdcb86ea13b14e4fe3d8878e08f1eb0b0c23eaa1c4e251f93dac7194d')
backup=('etc/bitcoin/bitcoin.conf'
        'etc/logrotate.d/bitcoin')
provides=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx' 'bitcoin-qt' 'bitcoin-seeder')
conflicts=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx' 'bitcoin-qt' 'bitcoin-seeder')
install=bitcoin.install

build() {
  cd "$srcdir/bitcoin-cash-node-$pkgver"
  patch -p0 < ../db.patch
  patch -p0 < ../queue.patch

  msg2 'Building...'
  mkdir -p build
  pushd build

  cmake -GNinja .. \
    -DENABLE_CLANG_TIDY=OFF \
    -DCLIENT_VERSION_IS_RELEASE=ON \
    -DENABLE_REDUCE_EXPORTS=ON \
    -DENABLE_STATIC_LIBSTDCXX=ON \
    -DCMAKE_INSTALL_PREFIX=$pkgdir/usr

  ninja
  popd
}

check() {
  cd "$srcdir/bitcoin-cash-node-$pkgver/build"

  msg2 'Testing...'
  ninja test_bitcoin && src/test/test_bitcoin
}

package() {
  cd "$srcdir/bitcoin-cash-node-$pkgver"

  msg2 'Installing desktop shortcut...'
  install -Dm644 "$srcdir/bitcoin.desktop" \
    "$pkgdir"/usr/share/applications/bitcoin.desktop
  install -Dm644 share/pixmaps/bitcoin128.png \
    "$pkgdir"/usr/share/pixmaps/bitcoin128.png

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname}"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/bitcoin"
  for _doc in \
    $(find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n') \
    release-notes; do
      cp -dpr --no-preserve=ownership "doc/$_doc" \
        "$pkgdir/usr/share/doc/bitcoin/$_doc"
  done

  msg2 'Installing essential directories'
  install -dm 700 "$pkgdir/etc/bitcoin"
  install -dm 755 "$pkgdir/srv/bitcoin"
  install -dm 755 "$pkgdir/run/bitcoin"

  pushd build
  msg2 'Installing executables and man pages...'
  cmake -DCOMPONENT=bitcoind -P cmake_install.cmake
  cmake -DCOMPONENT=bitcoin-qt -P cmake_install.cmake
  cmake -DCOMPONENT=bitcoin-seeder -P cmake_install.cmake
  popd

  msg2 'Installing bitcoin.conf...'
  install -Dm 600 "$srcdir/bitcoin.conf" -t "$pkgdir/etc/bitcoin"

  msg2 'Installing bitcoin.service...'
  install -Dm 644 "$srcdir/bitcoin.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/bitcoin-reindex.service" \
    -t "$pkgdir/usr/lib/systemd/system"

  msg2 'Installing bitcoin.logrotate...'
  install -Dm 644 "$srcdir/bitcoin.logrotate" "$pkgdir/etc/logrotate.d/bitcoin"

  msg2 'Installing bash completion...'
  for _compl in bitcoin-cli bitcoin-tx bitcoind; do
    install -Dm 644 "contrib/${_compl}.bash-completion" \
      "$pkgdir/usr/share/bash-completion/completions/$_compl"
  done
}
