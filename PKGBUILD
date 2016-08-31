# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=tavor-git
pkgver=20160321
pkgrel=1
pkgdesc="A generic fuzzing and delta-debugging framework"
arch=('i686' 'x86_64')
makedepends=('git' 'go' 'make')
url="https://github.com/zimmski/tavor"
license=('MIT')
source=(git+https://github.com/zimmski/tavor)
sha256sums=('SKIP')
provides=('tavor')
conflicts=('tavor')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  export GOPATH="$srcdir"

  msg2 'Building...'
  TMPDIR=/tmp go get -v github.com/zimmski/tavor/
  cd "$GOPATH/src/github.com/zimmski/tavor"
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/tavor"
  cp -dpr --no-preserve=ownership doc examples "$pkgdir/usr/share/doc/tavor"

  msg2 'Installing executable...'
  install -Dm 755 "$srcdir/bin/tavor" -t "$pkgdir/usr/bin"
}
