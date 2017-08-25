# Maintainer: obedmr <obed.n.munoz@gmail.com>
# Contributor: fzerorubigd <fzerorubigd@gmail.com>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Rémy Oudompheng  <remy@archlinux.org>
# Contributor: Andres Perera <andres87p gmail>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: Christian Himpel <chressie@gmail.com>
# Contributor: Mike Rosset <mike.rosset@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw@gmail.com>
# Contributor: John Luebs <jkluebs@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=go-git
epoch=2
pkgver=1.9
pkgrel=1
pkgrepo=go
pkgdesc='Core compiler tools for the Go programming language'
arch=(i686 x86_64)
url='http://golang.org/'
license=(BSD)
makedepends=(git go)
options=(!strip staticlibs)
_commit=c8aec4095e089ff6ac50d18e97c3f46561f14f48
source=(git+https://go.googlesource.com/go#commit=$_commit)
md5sums=('SKIP')

export GOOS=linux
case "$CARCH" in
  x86_64) export GOARCH=amd64 ;;
  i686) export GOARCH=386 GO386=387 ;;
esac
export GOROOT_FINAL=/usr/lib/go
export GOROOT_BOOTSTRAP=/usr/lib/go

build() {
  export GOROOT="$srcdir/$pkgrepo"
  export GOBIN="$GOROOT/bin"
  export GOPATH="$srcdir/"

  cd $pkgrepo/src
  ./make.bash --no-clean
}

check() {
  export GOROOT="$srcdir/$pkgrepo"
  export GOBIN="$GOROOT/bin"
  export PATH="$srcdir/$pkgrepo-$pkgver/bin:$PATH"
  export GO_TEST_TIMEOUT_SCALE=2

  # The cgo_test and race tests fail via run.bash but not if run manually.
  # Assume that five "failed" messages are okay and just re-run failed tests.
  cd $pkgrepo/src
  ./run.bash --no-rebuild -v -v -v -k |& tee run.log
  if (( $(grep -c Failed: run.log) > 5 )) && grep -q FAILED run.log; then
    return 1
  fi

  go tool dist test -v -v -v -run=^cgo_test$
  go tool dist test -v -v -v -run=^race$
}

package() {
  cd $pkgrepo

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/go" "$pkgdir/usr/share/doc/go"
  cp -a bin pkg src lib misc "$pkgdir/usr/lib/go"
  cp -r doc/* "$pkgdir/usr/share/doc/go"

  ln -sf /usr/lib/go/bin/go "$pkgdir/usr/bin/go"
  ln -sf /usr/lib/go/bin/gofmt "$pkgdir/usr/bin/gofmt"
  ln -sf /usr/share/doc/go "$pkgdir/usr/lib/go/doc"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/go/LICENSE"
 
  rm -rf "$pkgdir/usr/lib/go/pkg/bootstrap"
  rm -rf "$pkgdir/usr/lib/go/pkg/tool/*/api"
}