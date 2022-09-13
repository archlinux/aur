pkgbase=decred
pkgname=('dcrd' 'dcrwallet' 'dcrctl')
pkgver=1.7.4
pkgrel=1
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
makedepends=('git' 'go')
groups=('decred')
url="https://decred.org"
license=('ISC')
options=('!strip' '!emptydirs')
source=(dcrd-release-v$pkgver.tar.gz::https://github.com/decred/dcrd/archive/refs/tags/release-v$pkgver.tar.gz
        dcrwallet-release-v$pkgver.tar.gz::https://github.com/decred/dcrwallet/archive/refs/tags/release-v$pkgver.tar.gz
        dcrctl-release-v$pkgver.tar.gz::https://github.com/decred/dcrctl/archive/refs/tags/release-v$pkgver.tar.gz)
sha256sums=('ec58967c3f03a65236af8bf3d17c1e496bc1067f5d975c76fa4a6ddecb2e3daf'
            'ddaeccde9bdcaf4096830b06d95e778593775e8ddb0da81a3b174ce30e383a42'
            'b02d94770d30d6e03dec072646f5790e0082a89382406538301d1c686a0a6b0a')


build() {
  export GOPATH="$srcdir"

  msg2 'Building dcrd...'
  cd "$srcdir/dcrd-release-v$pkgver"
  go install -v -trimpath -mod=readonly -v -ldflags "-buildid= -s -w" . ./cmd/...

  msg2 'Building dcrwallet...'
  cd "$srcdir/dcrwallet-release-v$pkgver"
  go install -v -trimpath -mod=readonly -v -ldflags "-buildid= -s -w" .

  msg2 'Building dcrctl...'
  cd "$srcdir/dcrctl-release-v$pkgver"
  go install -v -trimpath -mod=readonly -v -ldflags "-buildid= -s -w" .

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
  install -Dm 644 "$srcdir/dcrd-release-v$pkgver/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrd"

  msg2 'Installing dcrd docs...'
  for _doc in CHANGES README.md; do
    install -Dm 644 "$srcdir/dcrd-release-v$pkgver/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrd"
  done

  cp -dpr --no-preserve=ownership "$srcdir/dcrd-release-v$pkgver/docs" \
    "$pkgdir/usr/share/doc/dcrd"

  msg2 'Installing dcrd...'
  for _bin in dcraddblock \
              dcrctl \
              dcrd \
              dcrfindcheckpoint \
              dcrgencerts \
              dcrpromptsecret; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin"
  done
}

package_dcrwallet() {
  pkgdesc="Secure Decred wallet daemon written in Go"
  provides=('dcrwallet')
  conflicts=('dcrwallet')

  msg2 'Installing dcrwallet license...'
  install -Dm 644 "$srcdir/dcrwallet-release-v$pkgver/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrwallet"

  msg2 'Installing dcrwallet docs...'
  for _doc in README.md sample-dcrwallet.conf; do
    install -Dm 644 "$srcdir/dcrwallet-release-v$pkgver/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrwallet"
  done
  cp -dpr --no-preserve=ownership \
    "$srcdir/dcrwallet-release-v$pkgver/docs" \
    "$pkgdir/usr/share/doc/dcrwallet"

  msg2 'Installing dcrwallet...'
  install -Dm 755 "$srcdir/bin/dcrwallet" -t "$pkgdir/usr/bin"
}

package_dcrctl() {
  pkgdesc="Decred command line control"
  provides=('dcrctl')
  conflicts=('dcrctl')

  install -Dm 644 "$srcdir/dcrctl-release-v$pkgver/sample-dcrctl.conf" \
            -t "$pkgdir/usr/share/doc/dcrd"
  install -Dm 755 "$srcdir/bin/dcrctl" -t "$pkgdir/usr/bin"
}
