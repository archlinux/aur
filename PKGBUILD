# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dcrseeder
pkgver=20180515
pkgrel=1
pkgdesc="Decred daemon written in Go"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
makedepends=('dep' 'git' 'go')
groups=('decred')
url="https://decred.org"
license=('ISC')
options=('!strip' '!emptydirs')
source=(git+https://github.com/decred/dcrseeder)
sha256sums=('SKIP')

pkgver() {
  date +%Y%m%d
}

prepare() {
  export GOPATH="$srcdir"
  git clone "$srcdir/dcrseeder" "$GOPATH/src/github.com/decred/dcrseeder"
}

build() {
  export GOPATH="$srcdir"

  msg2 'Building dcrseeder and dependencies...'
  cd "$GOPATH/src/github.com/decred/dcrseeder"
  dep ensure -v
  go install . ./cmd/...
}

package() {
  msg2 'Installing dcrseeder license...'
  install -Dm 644 "$srcdir/src/github.com/decred/dcrseeder/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrseeder"

  msg2 'Installing dcrseeder docs...'
  for _doc in README.md; do
    install -Dm 644 "$srcdir/src/github.com/decred/dcrseeder/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrseeder"
  done

  msg2 'Installing dcrseeder...'
  for _bin in dcrseeder; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin"
  done
}
