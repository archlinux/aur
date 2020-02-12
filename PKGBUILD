# Maintainer: Ilaï Deutel

pkgname=scc
pkgver=2.11.0
pkgrel=1
pkgdesc='Sloc, Cloc and Code: a very fast accurate code counter with complexity calculations and COCOMO estimates written in pure Go'
arch=('x86_64' 'i386')
url="https://github.com/boyter/scc"
license=('MIT' 'Unlicense')
depends=('glibc')
makedepends=('go-pie')
source=("$pkgname-$pkgver::https://github.com/boyter/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('04fbfebc92180a72413b68e4475fac590309a7f2fb365ea5105cc36301155300')

prepare(){
  mkdir -p gopath/src/github.com/boyter
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/boyter/$pkgname
  export GOPATH="$srcdir"/gopath

  # the dependencies can be fetched here if needed
  cd gopath/src/github.com/boyter/$pkgname
  # dep ensure fails because it updates vendor/github.com/monochromegane/go-gitignore
  # dep ensure
}

build() {
  export GOPATH="$srcdir"/gopath
  cd "$GOPATH/src/github.com/boyter/$pkgname"
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -v ./...
}

check() {
  export GOPATH="$srcdir"/gopath
  cd "$GOPATH/src/github.com/boyter/$pkgname"
  go test ./...
}

package() {
  install -Dm755 gopath/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
