# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=decred
pkgname=('dcrd' 'dcrticketbuyer' 'dcrwallet')
pkgver=0.2.0
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('git' 'glide' 'go')
groups=('decred')
url="https://decred.org"
license=('ISC')
options=('!strip' '!emptydirs')
source=(dcrd-$pkgver.tar.gz::https://codeload.github.com/decred/dcrd/tar.gz/v$pkgver
        dcrticketbuyer-$pkgver.tar.gz::https://codeload.github.com/decred/dcrticketbuyer/tar.gz/v$pkgver
        dcrwallet-$pkgver.tar.gz::https://codeload.github.com/decred/dcrwallet/tar.gz/v$pkgver)
sha256sums=('d514d2df9775825286901fa7611592caa6cec551cfc0a764f94f5a48d2ba346b'
            '7aab22b69db014b499ea8e5c896080fe4edb6d2065d6a667b7c1ff33a0a7422a'
            'babf5485678e4eb74c8ca94d74fdaf518105c16c382c7fe2244c50fe406c6f37')

prepare() {
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/decred"
  cp -dpr --no-preserve=ownership "$srcdir/dcrd-$pkgver" \
    "$GOPATH/src/github.com/decred/dcrd"
  cp -dpr --no-preserve=ownership "$srcdir/dcrwallet-$pkgver" \
    "$GOPATH/src/github.com/decred/dcrwallet"
  cp -dpr --no-preserve=ownership "$srcdir/dcrticketbuyer-$pkgver" \
    "$GOPATH/src/github.com/decred/dcrticketbuyer"
}

build() {
  export GOPATH="$srcdir"

  msg2 'Building dcrd and dependencies...'
  cd "$GOPATH/src/github.com/decred/dcrd"
  glide install
  go install $(glide novendor)

  msg2 'Building dcrticketbuyer and dependencies...'
  cd "$GOPATH/src/github.com/decred/dcrticketbuyer"
  glide install
  go install

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
              dcrdropafter \
              dcrfindcheckpoint \
              dcrgencerts \
              dcrshowblock; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin"
  done
}

package_dcrticketbuyer() {
  pkgdesc="Smart ticket purchasing bot for the automatic purchase of tickets from a Decred wallet"
  provides=('dcrticketbuyer')
  conflicts=('dcrticketbuyer')

  msg2 'Installing dcrticketbuyer license...'
  install -Dm 644 "$srcdir/src/github.com/decred/dcrticketbuyer/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrticketbuyer"

  msg2 'Installing dcrticketbuyer docs...'
  for _doc in README.md ticketbuyer-example.conf; do
    install -Dm 644 "$srcdir/src/github.com/decred/dcrticketbuyer/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrticketbuyer"
  done

  msg2 'Installing dcrticketbuyer...'
  install -Dm 755 "$srcdir/bin/dcrticketbuyer" -t "$pkgdir/usr/bin"
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
  for _bin in dcrdropwtxmgr \
              dcrmovefunds \
              dcrsweepaccount \
              dcrwallet; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin"
  done
}
