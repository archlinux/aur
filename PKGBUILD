# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dcrdata
pkgver=1.3.0
pkgrel=1
pkgdesc="Decred block explorer"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
makedepends=('dep' 'git' 'go')
groups=('decred')
url="https://explorer.dcrdata.org"
license=('ISC')
options=('!strip' '!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/decred/$pkgname/tar.gz/v$pkgver)
sha256sums=('d94b2f199b58c616a6bc31397a20ad61d8da87faa1dc63ac5017d88b131288e0')

prepare() {
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/decred"
  cp -dpr --no-preserve=ownership "$srcdir/$pkgname-$pkgver" \
    "$GOPATH/src/github.com/decred/dcrdata"
}

build() {
  export GOPATH="$srcdir"

  msg2 'Building dcrdata and dependencies...'
  cd "$GOPATH/src/github.com/decred/dcrdata"
  dep ensure -v
  go install . ./cmd/...
}

package() {
  msg2 'Installing license...'
  install -Dm 644 "$srcdir/src/github.com/decred/dcrdata/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrdata"

  msg2 'Installing docs...'
  for _doc in CODE_OF_CONDUCT \
              CONTRIBUTING.md \
              README.md \
              sample-dcrdata.conf \
              sample-nginx.conf \
              sample-rate_limiting.html; do
    install -Dm 644 "$srcdir/src/github.com/decred/dcrdata/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrdata"
  done

  msg2 'Installing...'
  install -Dm 755 "$srcdir/bin"/* -t "$pkgdir/usr/bin"
}
