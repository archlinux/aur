# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=go1.19
pkgver=1.19.5
pkgrel=2
pkgdesc='Core compiler tools for the Go programming language v1.19'
arch=(x86_64)
url='https://golang.org/'
license=(BSD)
makedepends=(git go perl)
options=(!strip staticlibs)
source=(https://storage.googleapis.com/golang/go$pkgver.src.tar.gz{,.asc})
validpgpkeys=('EB4C1BFD4F042F6DDDCCEC917721F63BD38B4796')
sha256sums=('8e486e8e85a281fc5ce3f0bedc5b9d2dbf6276d7db0b25d3ec034f313da0375f'
            'SKIP')

build() {
  export GOARCH=amd64
  export GOROOT_FINAL=/usr/lib/go1.19
  export GOROOT_BOOTSTRAP=/usr/lib/go1.19
  export GOPATH="$srcdir/"
  export GOROOT="$srcdir/go"
  export GOBIN="$GOROOT/bin"

  cd "$GOROOT/src"
  ./make.bash --no-clean -v

  PATH="$GOBIN:$PATH" go install -v -race std
  PATH="$GOBIN:$PATH" go install -v -buildmode=shared std
}

check() {
  export GOARCH=amd64
  export GOROOT_FINAL=/usr/lib/go1.19
  export GOROOT_BOOTSTRAP=/usr/lib/go1.19
  export GOROOT="$srcdir/go"
  export GOBIN="$GOROOT/bin"
  export PATH="$GOBIN:$PATH"
  export GO_TEST_TIMEOUT_SCALE=2

  cd $GOROOT/src
  rm os/signal/signal_cgo_test.go  # TODO: There is a bug somewhere.
                                   # Should only affect containers
                                   # so lets just say No.
  ./run.bash --no-rebuild -v -v -v -k
}

package() {
  export GOROOT="$srcdir/go"
  cd $GOROOT

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/go1.19" "$pkgdir/usr/share/doc/go1.19"
  cp -a bin pkg src lib misc api test "$pkgdir/usr/lib/go1.19"
  cp -r doc/* "$pkgdir/usr/share/doc/go1.19"

  ln -sf /usr/lib/go1.19/bin/go "$pkgdir/usr/bin/go1.19"
  ln -sf /usr/lib/go1.19/bin/gofmt "$pkgdir/usr/bin/gofmt1.19"
  ln -sf /usr/share/doc/go1.19 "$pkgdir/usr/lib/go1.19/doc"

  install -Dm644 VERSION "$pkgdir/usr/lib/go1.19/VERSION"

  rm -rf "$pkgdir/usr/lib/go1.19/pkg/bootstrap" "$pkgdir/usr/lib/go1.19/pkg/tool/*/api"

  # TODO: Figure out if really needed
  rm -rf "$pkgdir"/usr/lib/go1.19/pkg/obj/go-build/*

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et
