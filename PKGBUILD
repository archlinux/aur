# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dcrdata-git
pkgver=20171009
pkgrel=1
pkgdesc="Decred block explorer"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
makedepends=('dep' 'git' 'go')
groups=('decred')
url="https://github.com/dcrdata/dcrdata"
license=('ISC')
options=('!strip' '!emptydirs')
source=(git+https://github.com/dcrdata/dcrdata)
sha256sums=('SKIP')
provides=('dcrdata')
conflicts=('dcrdata')

pkgver() {
  date +%Y%m%d
}

prepare() {
  export GOPATH="$srcdir"
  git clone "$srcdir/dcrdata" "$GOPATH/src/github.com/dcrdata/dcrdata"
}

build() {
  export GOPATH="$srcdir"

  msg2 'Building dcrdata and dependencies...'
  cd "$GOPATH/src/github.com/dcrdata/dcrdata"
  dep ensure
  go install . ./cmd/...
}

package() {
  msg2 'Installing license...'
  install -Dm 644 "$srcdir/src/github.com/dcrdata/dcrdata/LICENSE" \
          -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  msg2 'Installing docs...'
  for _doc in CODE_OF_CONDUCT \
              CONTRIBUTING.md \
              README.md \
              sample-dcrdata.conf \
              sample-nginx.conf \
              sample-rate_limiting.html; do
    install -Dm 644 "$srcdir/src/github.com/dcrdata/${pkgname%-git}/$_doc" \
            -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  done

  msg2 'Installing...'
  install -Dm 755 "$srcdir/bin"/* -t "$pkgdir/usr/bin"
}
