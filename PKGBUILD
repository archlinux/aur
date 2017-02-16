# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=decred
pkgname=('dcrd' 'dcrwallet')
pkgver=0.8.2
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('git' 'glide' 'go')
groups=('decred')
url="https://decred.org"
license=('ISC')
options=('!strip' '!emptydirs')
source=(dcrd-$pkgver.tar.gz::https://codeload.github.com/decred/dcrd/tar.gz/v$pkgver
        dcrwallet-$pkgver.tar.gz::https://codeload.github.com/decred/dcrwallet/tar.gz/v$pkgver)
sha256sums=('86181f67a3d64693be8b824818cd2d6f289c246c05cb3fb3fa2cc875c832c928'
            'bd48c2a8d0faabe0c2c53bce68bbf288159caad38ed8499d14e5a0ccb98aaa57')

prepare() {
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/decred"
  cp -dpr --no-preserve=ownership "$srcdir/dcrd-$pkgver" \
    "$GOPATH/src/github.com/decred/dcrd"
  cp -dpr --no-preserve=ownership "$srcdir/dcrwallet-$pkgver" \
    "$GOPATH/src/github.com/decred/dcrwallet"
}

build() {
  export GOPATH="$srcdir"

  msg2 'Building dcrd and dependencies...'
  cd "$GOPATH/src/github.com/decred/dcrd"
  glide install
  go install $(glide novendor)

  msg2 'Building dcrwallet and dependencies...'
  cd "$GOPATH/src/github.com/decred/dcrwallet"
  glide install
  go install . ./cmd/...

  msg2 'Prepending dcr to unqualified binaries...'
  for _bin in $(find "$srcdir/bin"  \
                        -mindepth 1 \
                        -maxdepth 1 \
                        -type f ! -name "dcr*" -printf '%f\n'); do
    mv "$srcdir/bin/$_bin" "$srcdir/bin/dcr$_bin"
  done
}

package_dcrd() {
  pkgdesc="Decred daemon written in Go"
  provides=('dcrd')
  conflicts=('dcrd')

  msg2 'Installing dcrd license...'
  install -Dm 644 "$srcdir/src/github.com/decred/dcrd/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrd"

  msg2 'Installing dcrd docs...'
  for _doc in CHANGES README.md sample-dcrd.conf; do
    install -Dm 644 "$srcdir/src/github.com/decred/dcrd/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrd"
  done
  cp -dpr --no-preserve=ownership "$srcdir/src/github.com/decred/dcrd/docs" \
    "$pkgdir/usr/share/doc/dcrd"

  msg2 'Installing dcrd...'
  for _bin in dcraddblock \
              dcrcheckdevpremine \
              dcrctl \
              dcrd \
              dcrdbtool \
              dcrfindcheckpoint \
              dcrgencerts; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin"
  done
}

package_dcrwallet() {
  pkgdesc="Secure Decred wallet daemon written in Go"
  provides=('dcrwallet')
  conflicts=('dcrwallet')

  msg2 'Installing dcrwallet license...'
  install -Dm 644 "$srcdir/src/github.com/decred/dcrwallet/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrwallet"

  msg2 'Installing dcrwallet docs...'
  for _doc in CHANGES README.md sample-dcrwallet.conf; do
    install -Dm 644 "$srcdir/src/github.com/decred/dcrwallet/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrwallet"
  done
  cp -dpr --no-preserve=ownership \
    "$srcdir/src/github.com/decred/dcrwallet/docs" \
    "$pkgdir/usr/share/doc/dcrwallet"

  msg2 'Installing dcrwallet...'
  for _bin in dcrmovefunds \
              dcrsweepaccount \
              dcrwallet; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin"
  done
}
