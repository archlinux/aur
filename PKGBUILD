# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dcraddrgen
pkgver=20170815
pkgrel=1
pkgdesc="Simple offline address generator for Decred"
arch=('i686' 'x86_64')
makedepends=('git' 'glide' 'go')
groups=('decred')
url="https://github.com/decred/dcraddrgen"
license=('ISC')
options=('!strip' '!emptydirs')
source=(git+https://github.com/decred/dcraddrgen)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  export GOPATH="$srcdir"
  git clone "$srcdir/dcraddrgen" "$GOPATH/src/github.com/decred/dcraddrgen"
}

build() {
  export GOPATH="$srcdir"

  msg2 'Building dcraddrgen and dependencies...'
  cd "$GOPATH/src/github.com/decred/dcraddrgen"
  glide install
  go install
}

package() {
  msg2 'Installing license...'
  install -Dm 644 "$srcdir/src/github.com/decred/dcraddrgen/LICENSE" \
          -t "$pkgdir/usr/share/licenses/dcraddrgen"

  msg2 'Installing dcraddrgen docs...'
  for _doc in README.md; do
    install -Dm 644 "$srcdir/src/github.com/decred/dcraddrgen/$_doc" \
            -t "$pkgdir/usr/share/doc/dcraddrgen"
  done

  msg2 'Installing dcraddrgen...'
  for _bin in dcraddrgen; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin"
  done
}
