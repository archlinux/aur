# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=in
pkgver=1.0
pkgrel=1
pkgdesc='Run a command in a given directory'
arch=('x86_64')
url='https://github.com/xyproto/in'
license=('MIT')
makedepends=('git' 'go')
source=("git+https://github.com/xyproto/in#tag=$pkgver")
md5sums=('SKIP')
_gourl=github.com/xyproto/in

prepare() {
  cd "$pkgname"

  git submodule init
  git submodule update

  cd "$srcdir"

  export GOROOT=/usr/lib/go

  rm -rf build; mkdir -p build/go; cd build/go
  for f in "$GOROOT/"*; do ln -s "$f"; done
  rm pkg; mkdir pkg; cd pkg
  for f in "$GOROOT/pkg/"*; do ln -s "$f"; done

  export GOPATH="$srcdir/build"
  export GOROOT="$GOPATH/go"
  export DESTPATH="$GOPATH/src/$_gourl"

  # Make sure $DESTPATH is empty, but exists
  rm -rf "$DESTPATH"; mkdir -p "$DESTPATH"

  mv "$srcdir/$pkgname" "$(dirname $DESTPATH)"
}

build() {
  cd "$GOPATH/src/$_gourl"

  go build -x
}

package() {
  cd "$GOPATH/src/$_gourl"

  install -Dm755 in "$pkgdir/usr/bin/in"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
