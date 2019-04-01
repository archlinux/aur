# Maintainer: Dave Marshall <kalterflex@gmail.com>

pkgbase=go1.13
pkgname=(go1.13 go1.13-pie)
epoch=2
pkgver=1.13
pkgrel=1
arch=(x86_64)
url='https://golang.org/'
license=(BSD)
makedepends=(git go)
source=(https://storage.googleapis.com/golang/go1.12.1.src.tar.gz
        default-buildmode-pie.patch)
sha256sums=('0be127684df4b842a64e58093154f9d15422f1405f1fcff4b2c36ffc6a15818a'
            '9d2f0d201d4e002d74f548cc82bd131139bab5dd62191004c71dd430fdc1666d')

prepare() {
  cp -r go go-pie
  cd go-pie
  patch -p1 -i "$srcdir/default-buildmode-pie.patch"
}

build() {
  export GOARCH=amd64
  export GOROOT_FINAL=/usr/lib/go
  export GOROOT_BOOTSTRAP=/usr/lib/go
  export GOPATH="$srcdir/"

  for _pkgname in go go-pie; do
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

_package() {
  export GOARCH=amd64
  export GOROOT_FINAL=/usr/lib/go
  export GOROOT_BOOTSTRAP=/usr/lib/go

  options=(!strip staticlibs)
  cd "$srcdir/$1"

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

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$1/LICENSE"
}

package_go1.13() {
  pkgdesc='Core compiler tools for the Go programming language'

  _package go
}

package_go1.13-pie() {
  pkgdesc='Core compiler tools for the Go programming language (with PIE enabled by default)'
  provides=(go)
  conflicts=(go)

  _package go-pie

  # linux_amd64 is essentially the content of linux_amd64_shared, however there might
  # be cases where the user could generate the _shared directory as it's missing in go-pie.
  # Make sure it exists without rebuilding std with -buildmode=pie.
  cp -a "$pkgdir/usr/lib/go/pkg/linux_amd64/" "$pkgdir/usr/lib/go/pkg/linux_amd64_shared"
}

# vim: ts=2 sw=2 et
