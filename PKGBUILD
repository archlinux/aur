# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=gomobile
pkgver=20160620
pkgrel=1
pkgdesc="Tool for building and running mobile apps written in Go"
arch=('i686' 'x86_64')
makedepends=('git' 'go')
url="https://github.com/golang/mobile"
license=('custom:BSD')
options=('!strip' '!emptydirs')

pkgver() {
  date +%Y%m%d
}

build() {
  export GOPATH="$srcdir"

  msg2 'Building...'
  go get -v golang.org/x/mobile/cmd/gomobile
}

package() {
  msg2 'Installing license...'
  install -Dm 644 "$srcdir/src/golang.org/x/mobile"/{AUTHORS,LICENSE,PATENTS} \
          -t "$pkgdir/usr/share/licenses/gomobile"

  msg2 'Installing documentation...'
  for _doc in CONTRIB* README.md; do
    install -Dm 644 "$srcdir/src/golang.org/x/mobile"/$_doc \
            -t "$pkgdir/usr/share/doc/gomobile"
  done
  cp -dpr --no-preserve=ownership "$srcdir/src/golang.org/x/mobile/doc" \
    "$pkgdir/usr/share/doc/gomobile"

  msg2 'Installing...'
  install -Dm 755 "$srcdir/bin/gomobile" -t "$pkgdir/usr/bin"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
