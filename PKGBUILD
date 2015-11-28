# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=btcd
pkgname=('btcd' 'btcwallet' 'btcgui')
pkgver=20151128
pkgrel=2
arch=('i686' 'x86_64')
makedepends=('git' 'go')
groups=('btcsuite')
url="https://github.com/btcsuite"
license=('ISC')
options=('!strip' '!emptydirs')

pkgver() {
  date +%Y%m%d
}

build() {
  msg2 'Building btcd and dependencies...'
  GOPATH="$srcdir" go get -u github.com/btcsuite/btcd/...

  msg2 'Building btcwallet and dependencies...'
  GOPATH="$srcdir" go get -u github.com/btcsuite/btcwallet/...
}

package_btcd() {
  pkgdesc="An alternative full node Bitcoin implementation written in Go"
  provides=('btcd')
  conflicts=('btcd')

  msg2 'Installing btcd license...'
  install -Dm 644 "$srcdir/src/github.com/btcsuite/btcd/LICENSE" \
          -t "$pkgdir/usr/share/licenses/btcd"

  msg2 'Installing btcd docs...'
  for _doc in CHANGES README.md sample-btcd.conf; do
    install -Dm 644 "$srcdir/src/github.com/btcsuite/btcd/$_doc" \
            -t "$pkgdir/usr/share/doc/btcd"
  done

  msg2 'Installing btcd...'
  find "$srcdir/bin" -mindepth 1 -maxdepth 1 -type f \
       \( ! -name "btcwallet*"  \)                   \
    -a \( ! -name "dropwtxmgr*" \)                   \
    -exec install -Dm 755 '{}' -t "$pkgdir/usr/bin" \;

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

package_btcwallet() {
  pkgdesc="Daemon handling Bitcoin wallet functions, with asynchronous blockchain queries and notifications over websockets"
  provides=('btcwallet')
  conflicts=('btcwallet')

  msg2 'Installing btcwallet docs...'
  for _doc in CHANGES README.md sample-btcwallet.conf; do
    install -Dm 644 "$srcdir/src/github.com/btcsuite/btcwallet/$_doc" \
            -t "$pkgdir/usr/share/doc/btcwallet"
  done

  msg2 'Installing btcwallet...'
  for _bin in btcwallet dropwtxmgr; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin"
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

package_btcgui() {
  pkgdesc="Graphical frontend to btcwallet and btcd written using gotk3"
  makedepends+=('cairo' 'glib2' 'gtk3')
  provides=('btcgui')
  conflicts=('btcgui')

  msg2 'Building btcgui and dependencies...'
  GOPATH="$srcdir" go get -u github.com/btcsuite/btcgui/...

  msg2 'Installing btcgui docs...'
  for _doc in CHANGES README.md sample-btcgui.conf; do
    install -Dm 644 "$srcdir/src/github.com/btcsuite/btcgui/$_doc" \
            -t "$pkgdir/usr/share/doc/btcgui"
  done

  msg2 'Installing btcgui...'
  install -Dm 755 "$srcdir/bin/btcgui" -t "$pkgdir/usr/bin"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
