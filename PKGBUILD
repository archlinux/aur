# Maintainer: Jonathan Chappelow <chappjc@protonmail.com>

pkgbase=decred
pkgname=('dcrd' 'dcrwallet' 'dcrctl')
pkgver=1.7.4
pkgrel=2
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
pkgdesc="Decred command line applications"
makedepends=('git' 'go>=1.18')
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

  echo 'Building dcrd...'
  cd "$srcdir/dcrd-release-v$pkgver"
  go install -v -trimpath -mod=readonly -modcacherw -v -ldflags "-buildid= -s -w" . ./cmd/...

  echo 'Building dcrwallet...'
  cd "$srcdir/dcrwallet-release-v$pkgver"
  go install -v -trimpath -mod=readonly -modcacherw -v -ldflags "-buildid= -s -w" .

  echo 'Building dcrctl...'
  cd "$srcdir/dcrctl-release-v$pkgver"
  go install -v -trimpath -mod=readonly -modcacherw -v -ldflags "-buildid= -s -w" .

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

  install -Dm 644 "$srcdir/dcrd-release-v$pkgver/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrd"

  for _doc in CHANGES README.md; do
    install -Dm 644 "$srcdir/dcrd-release-v$pkgver/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrd"
  done

  cp -dpr --no-preserve=ownership "$srcdir/dcrd-release-v$pkgver/docs" \
    "$pkgdir/usr/share/doc/dcrd"

  for _bin in dcraddblock \
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

  install -Dm 644 "$srcdir/dcrwallet-release-v$pkgver/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrwallet"

  for _doc in README.md sample-dcrwallet.conf; do
    install -Dm 644 "$srcdir/dcrwallet-release-v$pkgver/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrwallet"
  done
  cp -dpr --no-preserve=ownership \
    "$srcdir/dcrwallet-release-v$pkgver/docs" \
    "$pkgdir/usr/share/doc/dcrwallet"

  install -Dm 755 "$srcdir/bin/dcrwallet" -t "$pkgdir/usr/bin"
}

package_dcrctl() {
  pkgdesc="Decred command line control utility"
  provides=('dcrctl')
  conflicts=('dcrctl')

  install -Dm 644 "$srcdir/dcrctl-release-v$pkgver/sample-dcrctl.conf" \
            -t "$pkgdir/usr/share/doc/dcrd"
  install -Dm 755 "$srcdir/bin/dcrctl" -t "$pkgdir/usr/bin"
}
