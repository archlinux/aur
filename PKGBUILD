# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dcrdata
pkgver=0.8.0
pkgrel=2
pkgdesc="Decred block explorer"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
makedepends=('dep' 'git' 'go')
groups=('decred')
url="https://explorer.dcrdata.org"
license=('ISC')
options=('!strip' '!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/decred/$pkgname/tar.gz/v$pkgver)
sha256sums=('4f5ef533f6fce93f2d69670bd62ed3f8f530903669094548f0521204b3e3fc86')

prepare() {
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/$pkgname"
  cp -dpr --no-preserve=ownership "$srcdir/$pkgname-$pkgver" \
    "$GOPATH/src/github.com/decred/dcrdata"
}

build() {
  export GOPATH="$srcdir"

  msg2 'Building dcrdata and dependencies...'
  cd "$GOPATH/src/github.com/decred/dcrdata"
  dep ensure
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
