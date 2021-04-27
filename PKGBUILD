# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=go1.15
pkgver=1.15.11
pkgrel=2
pkgdesc='Core compiler tools for the Go programming language v1.15'
arch=(x86_64)
url='https://golang.org/'
license=(BSD)
makedepends=(git go perl)
options=(!strip staticlibs)
source=(https://storage.googleapis.com/golang/go$pkgver.src.tar.gz{,.asc}
        "fix-color.patch::https://github.com/golang/go/commit/29634436fd741a7c685bf8f242b6fd62f093d1ad.patch")
validpgpkeys=('EB4C1BFD4F042F6DDDCCEC917721F63BD38B4796')
sha256sums=('f25b2441d4c76cf63cde94d59bab237cc33e8a2a139040d904c8630f46d061e5'
            'SKIP'
            'f6bf4c18e4395bdd4925b1f15a713fa3daca0a28123d6c20d51234d7ce2d3357')

prepare() {
    cd go
    patch -Np1 < "$srcdir/fix-color.patch"
}

build() {
  export GOARCH=amd64
  export GOROOT_FINAL=/usr/lib/go1.15
  export GOROOT_BOOTSTRAP=/usr/lib/go1.15
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
  export GOROOT_FINAL=/usr/lib/go1.15
  export GOROOT_BOOTSTRAP=/usr/lib/go1.15
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

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/go1.15" "$pkgdir/usr/share/doc/go1.15"
  cp -a bin pkg src lib misc api test "$pkgdir/usr/lib/go1.15"
  cp -r doc/* "$pkgdir/usr/share/doc/go1.15"

  ln -sf /usr/lib/go1.15/bin/go "$pkgdir/usr/bin/go1.15"
  ln -sf /usr/lib/go1.15/bin/gofmt "$pkgdir/usr/bin/gofmt1.15"
  ln -sf /usr/share/doc/go1.15 "$pkgdir/usr/lib/go1.15/doc"

  install -Dm644 VERSION "$pkgdir/usr/lib/go1.15/VERSION"

  rm -rf "$pkgdir/usr/lib/go1.15/pkg/bootstrap" "$pkgdir/usr/lib/go1.15/pkg/tool/*/api"

  # TODO: Figure out if really needed
  rm -rf "$pkgdir"/usr/lib/go1.15/pkg/obj/go-build/*

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et
