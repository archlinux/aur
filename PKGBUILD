# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=bitcoin-abc-qt
pkgver=0.21.2
pkgrel=0
pkgdesc="Bitcoin ABC with bitcoind, bitcoin-cli, bitcoin-tx, bitcoin-seeder and bitcoin-qt"
arch=('i686' 'x86_64')
url="https://bitcoinabc.org"
depends=('boost-libs' 'libevent' 'desktop-file-utils' 'qt5-base' 'protobuf' 'openssl' 'miniupnpc' 'zeromq' 'qrencode')
makedepends=('cmake' 'ninja' 'boost' 'qt5-tools')
license=('MIT')
source=(https://github.com/Bitcoin-ABC/bitcoin-abc/archive/v$pkgver.tar.gz
        bitcoin.conf
        bitcoin.logrotate
        bitcoin.service
        bitcoin-reindex.service
        bitcoin.install)
sha256sums=('2535028562477d8807f3b69ac181795c86e6c230912bef81e87ee3f65485e1b3'
            'b1908344281498d39bfa40c3b9725f9c95bf22602cd46e6120a1f17bad9dae35'
            '8f05207b586916d489b7d25a68eaacf6e678d7cbb5bfbac551903506b32f904f'
            '9643eed2c20d78a9c7347df64099765773615f79d3b8a95693d871c933516880'
            '35ff9331d7df8b90adfc7d82752cca4f8b7ff23a29e5d10b07e4e3fc78050679'
            '6db7458a85a0b469ab95ad78e431d0a5db078d8809a5f4340ee040f304a9dc0d')
backup=('etc/bitcoin/bitcoin.conf'
        'etc/logrotate.d/bitcoin')
provides=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx' 'bitcoin-qt' 'bitcoin-seeder')
conflicts=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx' 'bitcoin-qt' 'bitcoin-seeder')
install=bitcoin.install

build() {
  cd "$srcdir/bitcoin-abc-$pkgver"

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
  cd "$srcdir/bitcoin-abc-$pkgver/build"

  msg2 'Testing...'
  ninja check
}

package() {
  cd "$srcdir/bitcoin-abc-$pkgver"

  msg2 'Installing desktop shortcut...'
  install -Dm644 contrib/debian/bitcoin-qt.desktop \
    "$pkgdir"/usr/share/applications/bitcoin.desktop
  install -Dm644 share/pixmaps/bitcoin-abc128.png \
    "$pkgdir"/usr/share/pixmaps/bitcoin-abc128.png

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname}"

  msg2 'Installing examples...'
  install -Dm644 "contrib/debian/examples/bitcoin.conf" \
    -t "$pkgdir/usr/share/doc/bitcoin/examples"

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
