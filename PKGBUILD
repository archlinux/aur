# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=btcd
pkgname=('btcd' 'btcwallet')
pkgver=0.21.0.beta
_pkgver_btcd=v0.21.0-beta
_pkgver_btcwallet=walletdb/v1.3.4
pkgrel=1
pkgdesc="btcd an alternative full node Bitcoin implementation written in Go and btcwallet a secure Bitcoin wallet daemon written in Go "
arch=('i686' 'x86_64')
makedepends=('git' 'go')
groups=('btcsuite')
url="https://github.com/btcsuite"
license=('ISC')
options=('!emptydirs')
provides=('btcd' 'btcwallet')
conflicts=('btcd')
source=(git+https://github.com/btcsuite/btcd#tag=$_pkgver_btcd
        git+https://github.com/btcsuite/btcwallet#tag=$_pkgver_btcwallet)
sha256sums=('SKIP'
            'SKIP')

prepare() {
  export GOPATH="$srcdir"
  git clone "$srcdir/btcd" "$GOPATH/src/github.com/btcsuite/btcd"
  git clone "$srcdir/btcwallet" "$GOPATH/src/github.com/btcsuite/btcwallet"
}

build() {
  export GOPATH="$srcdir"

  echo 'Building btcd and dependencies...'
  cd "$GOPATH/src/github.com/btcsuite/btcd"
  go install -buildmode=pie -ldflags -extldflags=-Wl,-z,now,-z,relro . ./cmd/...
  go clean -modcache

  echo 'Building btcwallet and dependencies...'
  cd "$GOPATH/src/github.com/btcsuite/btcwallet"
  go install -buildmode=pie -ldflags -extldflags=-Wl,-z,now,-z,relro . ./cmd/...
  go clean -modcache

  echo 'Prepending btc to unqualified binaries...'
  for _bin in $(find "$srcdir/bin"  \
                        -mindepth 1 \
                        -maxdepth 1 \
                        -type f ! -name "btc*" -printf '%f\n'); do
    mv "$srcdir/bin/$_bin" "$srcdir/bin/btc$_bin"
  done
}

package_btcd() {
  pkgdesc="An alternative full node Bitcoin implementation written in Go"
  provides=('btcd')
  conflicts=('btcd')

  echo 'Installing btcd license...'
  install -Dm 644 "$srcdir/src/github.com/btcsuite/btcd/LICENSE" \
          -t "$pkgdir/usr/share/licenses/btcd"

  echo 'Installing btcd docs...'
  for _doc in CHANGES README.md sample-btcd.conf; do
    install -Dm 644 "$srcdir/src/github.com/btcsuite/btcd/$_doc" \
            -t "$pkgdir/usr/share/doc/btcd"
  done
  cp -dpr --no-preserve=ownership "$srcdir/src/github.com/btcsuite/btcd/docs" \
    "$pkgdir/usr/share/doc/btcd"

  echo 'Installing btcd...'
  for _bin in btcaddblock \
              btcctl \
              btcd \
              btcfindcheckpoint \
              btcgencerts; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin"
  done

  echo 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

package_btcwallet() {
  pkgdesc="Secure Bitcoin wallet daemon written in Go"
  provides=('btcwallet')
  conflicts=('btcwallet')

  echo 'Installing btcwallet license...'
  install -Dm 644 "$srcdir/src/github.com/btcsuite/btcwallet/LICENSE" \
          -t "$pkgdir/usr/share/licenses/btcwallet"

  echo 'Installing btcwallet docs...'
  for _doc in CHANGES README.md sample-btcwallet.conf; do
    install -Dm 644 "$srcdir/src/github.com/btcsuite/btcwallet/$_doc" \
            -t "$pkgdir/usr/share/doc/btcwallet"
  done
  cp -dpr --no-preserve=ownership \
    "$srcdir/src/github.com/btcsuite/btcwallet/docs" \
    "$pkgdir/usr/share/doc/btcwallet"

  echo 'Installing btcwallet...'
  for _bin in btcdropwtxmgr \
              btcsweepaccount \
              btcwallet; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin"
  done

  echo 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

