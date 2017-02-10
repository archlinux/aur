# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dcrspy
pkgver=0.7.4
pkgrel=1
pkgdesc="Decred data monitor"
arch=('i686' 'x86_64')
makedepends=('git' 'glide' 'go')
groups=('decred')
url="https://github.com/chappjc/dcrspy"
license=('ISC')
options=('!strip' '!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/chappjc/$pkgname/tar.gz/v$pkgver)
sha256sums=('9d52f28e5a53fdda868d6910ca0ec7fda7e74c5a22bd0b5ed276fc8e64afab74')

prepare() {
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/chappjc"
  cp -dpr --no-preserve=ownership "$srcdir/dcrspy-$pkgver" \
    "$GOPATH/src/github.com/chappjc/dcrspy"
}

build() {
  export GOPATH="$srcdir"

  msg2 'Building dcrspy and dependencies...'
  cd "$GOPATH/src/github.com/chappjc/dcrspy"
  glide install
  go install $(glide novendor)
}

package() {
  msg2 'Installing license...'
  install -Dm 644 "$srcdir/src/github.com/chappjc/dcrspy/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcrspy"

  msg2 'Installing docs...'
  for _doc in README.md sample-dcrspy.conf; do
    install -Dm 644 "$srcdir/src/github.com/chappjc/dcrspy/$_doc" \
            -t "$pkgdir/usr/share/doc/dcrspy"
  done

  msg2 'Installing...'
  install -Dm 755 "$srcdir/bin/dcrspy" -t "$pkgdir/usr/bin"
}
