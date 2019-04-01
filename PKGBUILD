# Maintainer: Dave Marshall <kalterflex@gmail.com>

pkgname=go1.13-gen
epoch=2
pkgver=1.13
pkgrel=1
pkgdesc='Core compiler tools for the Go programming language (with generics enabled by default)'
arch=(x86_64)
url='https://golang.org/'
license=(BSD)
makedepends=(git go)
source=(https://storage.googleapis.com/golang/go1.12.1.src.tar.gz)
sha256sums=('0be127684df4b842a64e58093154f9d15422f1405f1fcff4b2c36ffc6a15818a')

build() {
  export GOARCH=amd64
  export GOROOT_FINAL=/usr/lib/go
  export GOROOT_BOOTSTRAP=/usr/lib/go
  export GOPATH="$srcdir/"

  for _pkgname in go ; do
    export GOROOT="$srcdir/$_pkgname"
    export GOBIN="$GOROOT/bin"

    cd "$srcdir/$_pkgname/src"
    ./make.bash --no-clean -v

    PATH="$GOBIN:$PATH" go install -v -buildmode=shared std
    PATH="$GOBIN:$PATH" go install -v -race std
  done
}

check() {
  export GOARCH=amd64
  export GOROOT_FINAL=/usr/lib/go
  export GOROOT_BOOTSTRAP=/usr/lib/go
  # Run test suite only for unpatched Go as it expects non-PIE ldBuildmode
  export GOROOT="$srcdir/go"
  export GOBIN="$GOROOT/bin"
  export PATH="$srcdir/go/bin:$PATH"
  export GO_TEST_TIMEOUT_SCALE=2

  cd go/src
  ./run.bash --no-rebuild -v -v -v -k
}

package() {
  export GOARCH=amd64
  export GOROOT_FINAL=/usr/lib/go
  export GOROOT_BOOTSTRAP=/usr/lib/go

  options=(!strip staticlibs)
  cd "$srcdir/go"

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/go" "$pkgdir/usr/share/doc/go"
  cp -a bin pkg src lib misc api test "$pkgdir/usr/lib/go"
  cp -r doc/* "$pkgdir/usr/share/doc/go"

  ln -sf /usr/lib/go/bin/go "$pkgdir/usr/bin/go"
  ln -sf /usr/lib/go/bin/gofmt "$pkgdir/usr/bin/gofmt"
  ln -sf /usr/share/doc/go "$pkgdir/usr/lib/go/doc"

  install -Dm644 VERSION "$pkgdir/usr/lib/go/VERSION"

  rm -rf "$pkgdir/usr/lib/go/pkg/bootstrap" "$pkgdir/usr/lib/go/pkg/tool/*/api"

  # TODO: Figure out if really needed
  rm -rf "$pkgdir"/usr/lib/go/pkg/obj/go-build/*

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/go/LICENSE"
}

# vim: ts=2 sw=2 et
