# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=btcd
pkgname=('btcd' 'btcwallet' 'btcgui')
pkgver=20150711
pkgrel=1
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
    "$pkgdir/usr/share/licenses/btcd/LICENSE"

  msg2 'Installing btcd docs...'
  install -Dm 644 "$srcdir/src/github.com/btcsuite/btcd/CHANGES" \
    "$pkgdir/usr/share/doc/btcd/CHANGES"
  install -Dm 644 "$srcdir/src/github.com/btcsuite/btcd/README.md" \
    "$pkgdir/usr/share/doc/btcd/README.md"
  install -Dm 644 "$srcdir/src/github.com/btcsuite/btcd/sample-btcd.conf" \
    "$pkgdir/usr/share/doc/btcd/sample-btcd.conf"

  msg2 'Installing btcd...'
  for _bin in addblock \
              btcctl \
              btcd \
              dbtest \
              dropafter \
              findcheckpoint \
              gencerts; do
    install -Dm 755 "$srcdir/bin/$_bin" "$pkgdir/usr/bin/$_bin"
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

package_btcwallet() {
  pkgdesc="Daemon handling Bitcoin wallet functions, with asynchronous blockchain queries and notifications over websockets"
  provides=('btcwallet')
  conflicts=('btcwallet')

  msg2 'Installing btcwallet docs...'
  install -Dm 644 "$srcdir/src/github.com/btcsuite/btcwallet/CHANGES" \
    "$pkgdir/usr/share/doc/btcwallet/CHANGES"
  install -Dm 644 "$srcdir/src/github.com/btcsuite/btcwallet/README.md" \
    "$pkgdir/usr/share/doc/btcwallet/README.md"
  install -Dm 644 "$srcdir/src/github.com/btcsuite/btcwallet/sample-btcwallet.conf" \
    "$pkgdir/usr/share/doc/btcwallet/sample-btcwallet.conf"

  msg2 'Installing btcwallet...'
  install -Dm 755 "$srcdir/bin/btcwallet" "$pkgdir/usr/bin/btcwallet"

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
  install -Dm 644 "$srcdir/src/github.com/btcsuite/btcgui/CHANGES" \
    "$pkgdir/usr/share/doc/btcgui/CHANGES"
  install -Dm 644 "$srcdir/src/github.com/btcsuite/btcgui/README.md" \
    "$pkgdir/usr/share/doc/btcgui/README.md"
  install -Dm 644 "$srcdir/src/github.com/btcsuite/btcgui/sample-btcgui.conf" \
    "$pkgdir/usr/share/doc/btcgui/sample-btcgui.conf"

  msg2 'Installing btcgui...'
  install -Dm 755 "$srcdir/bin/btcgui" "$pkgdir/usr/bin/btcgui"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
