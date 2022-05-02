_bitcoin=bitcoin
pkgdesc="Bitcoin Cash Node"
pkgbase=bitcoin-cash
pkgname=("${pkgbase}" "${pkgbase}-qt")
pkgver=24.0.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://bitcoincashnode.org"
license=('MIT')
source=(https://gitlab.com/bitcoin-cash-node/bitcoin-cash-node/-/archive/v${pkgver}/bitcoin-cash-node-v${pkgver}.tar.bz2
        ${pkgbase}.sysusers
        ${pkgbase}.tmpfiles
        ${_bitcoin}.conf
        ${_bitcoin}.logrotate
        ${_bitcoin}.service
        ${_bitcoin}-reindex.service
        ${_bitcoin}.desktop)
sha256sums=('b5dbef157d3cc00f6f1cd8e122a622a6a9e01a8cae6b66c09f06c910b6822006'
            '27d0d4cf1a5dbf502db709d1d799baf137ecdfe2d9224ba6e599cad72aa80644'
            '24a17167ac26e2b6076266a7360336c7fa989684dd9732ab0408ef010988e715'
            'c30e5c7e0e97b001fdeac5f4510d5ebc0e0499ec086325e845db609a24f2e22f'
            '8f05207b586916d489b7d25a68eaacf6e678d7cbb5bfbac551903506b32f904f'
            '3602be0cc001f6f301b8c7edcf24ea2508655e8fae6addf9ccafc9229f62e6eb'
            '23e11fddd80a43a822e3463816d29d0e4af6e22d2bff7e0390e192240adc66e7'
            '0ba95ed8914f1c3d7fb3601a9735d53be0445aa070a003f7938bfff754677578')
backup=('etc/bitcoin/${_bitcoin}.conf'
        'etc/logrotate.d/${_bitcoin}')
makedepends=('boost' 'cmake' 'desktop-file-utils' 'help2man' 'libevent' 'miniupnpc' 'ninja' 'protobuf' 'qrencode' 'qt5-tools' 'zeromq')

build() {
  cd "$srcdir/bitcoin-cash-node-v$pkgver"

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
  cd "$srcdir/bitcoin-cash-node-v$pkgver"

  msg2 'Testing... (skipped)'
  #ninja check
}

package_bitcoin-cash() {
  pkgdesc="Bitcoin Cash Node with bitcoind, bitcoin-cli, bitcoin-tx, bitcoin-seeder"
  provides=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx' 'bitcoin-seeder' 'bitcoin-cash-node')
  conflicts=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx' 'bitcoin-seeder' 'bitcoin-cash-node')
  depends=('boost-libs' 'libevent' 'desktop-file-utils' 'qt5-base' 'protobuf' 'openssl' 'miniupnpc' 'zeromq' 'qrencode')

  cd "$srcdir/bitcoin-cash-node-v$pkgver"

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

  pushd build
  msg2 'Installing executables and man pages...'
  cmake -DCOMPONENT=bitcoind -P cmake_install.cmake
  cmake -DCOMPONENT=bitcoin-seeder -P cmake_install.cmake
  popd

  msg2 "Installing ${_bitcoin}.conf..."
  install -Dm 600 "$srcdir/${_bitcoin}.conf" -t "$pkgdir/etc/bitcoin/"

  msg2 'Installing bitcoin.service...'
  install -Dm 644 "$srcdir/${_bitcoin}.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm 644 "$srcdir/${_bitcoin}-reindex.service" \
    -t "$pkgdir/usr/lib/systemd/system/"

  msg2 "Installing ${_bitcoin}.logrotate..."
  install -Dm 644 "$srcdir/${_bitcoin}.logrotate" "$pkgdir/etc/logrotate.d/bitcoin"

  msg2 'Installing bash completion...'
  for _compl in bitcoin-cli bitcoin-tx bitcoind; do
    install -Dm 644 "contrib/${_compl}.bash-completion" \
      "$pkgdir/usr/share/bash-completion/completions/$_compl"
  done

  install -vDm 644 "../${_bitcoin}.conf" -t "${pkgdir}/etc/bitcoin/"
  install -vDm 644 "../${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -vDm 644 "../${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

package_bitcoin-cash-qt() {
  pkgdesc="Qt frontend for Bitcoin Cash Node"
  provides=('bitcoin-qt' 'bitcoin-cash-node-qt')
  conflicts=('bitcoin-qt' 'bitcoin-cash-node-qt')
  depends=('boost-libs' 'libevent' 'desktop-file-utils' 'qt5-base' 'protobuf' 'openssl' 'miniupnpc' 'zeromq' 'qrencode' 'bitcoin-cash')

  cd "$srcdir/bitcoin-cash-node-v$pkgver"

  msg2 'Installing desktop shortcut...'
  install -Dm644 "$srcdir/bitcoin.desktop" \
    "$pkgdir"/usr/share/applications/bitcoin.desktop
  install -Dm644 share/pixmaps/bitcoin128.png \
    "$pkgdir"/usr/share/pixmaps/bitcoin128.png

  pushd build
  msg2 'Installing executables and man pages...'
  cmake -DCOMPONENT=bitcoin-qt -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -P cmake_install.cmake
  popd
}
