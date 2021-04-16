# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=go1.15
pkgver=1.15.8
pkgrel=1
pkgdesc='Core compiler tools for the Go programming language v1.15'
arch=(x86_64)
url='https://golang.org/'
license=(BSD)
makedepends=(git go perl)
options=(!strip staticlibs)
source=(https://storage.googleapis.com/golang/go$pkgver.src.tar.gz{,.asc}
        "fix-color.patch::https://github.com/golang/go/commit/29634436fd741a7c685bf8f242b6fd62f093d1ad.patch")
validpgpkeys=('EB4C1BFD4F042F6DDDCCEC917721F63BD38B4796')
sha256sums=('540c0ab7781084d124991321ed1458e479982de94454a98afab6acadf38497c2'
            'SKIP'
            '6005e40e447b402b07d52604cfa7d444f61152cecd9a19953edbcf88160fa46a')

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

  cd "go/src"
  ./make.bash --no-clean -v

  PATH="$GOBIN:$PATH" go install -v -race std
  PATH="$GOBIN:$PATH" go install -v -buildmode=shared std
}

package() {
  cd go

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
