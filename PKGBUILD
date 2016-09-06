# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=decred
pkgname=('dcrd' 'dcrticketbuyer' 'dcrwallet')
pkgver=0.4.0
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('git' 'glide' 'go')
groups=('decred')
url="https://decred.org"
license=('ISC')
options=('!strip' '!emptydirs')
source=(dcrd-$pkgver.tar.gz::https://codeload.github.com/decred/dcrd/tar.gz/v$pkgver
        dcrticketbuyer-$pkgver::git+https://github.com/decred/dcrticketbuyer#commit=736f3fbd3c26ada655f37d6d42b307798d345186
        dcrwallet-$pkgver.tar.gz::https://codeload.github.com/decred/dcrwallet/tar.gz/v$pkgver)
sha256sums=('648791a98d37f75f395920c8b42fb813bbc92db7f1b9e9acdf409dea6c091b55'
            'SKIP'
            '13be89e0800d404ca492b72fcfe1ad58b758a538a758b50ad77c09815cd509cc')

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
              dcrdbtool \
              dcrfindcheckpoint \
              dcrgencerts; do
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
