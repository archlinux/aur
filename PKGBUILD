# Maintainer: Ilaï Deutel

pkgname=scc
pkgver=2.12.0
pkgrel=2
pkgdesc='Sloc, Cloc and Code: a very fast accurate code counter with complexity calculations and COCOMO estimates written in pure Go'
arch=('x86_64' 'i386')
url="https://github.com/boyter/scc"
license=('MIT' 'Unlicense')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver::https://github.com/boyter/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('48baba45e76ef02bb23ded3d1d904fed7e19297066a47b7e6b46baadc50c1eb1')

prepare(){
  mkdir -p gopath/src/github.com/boyter
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/boyter/$pkgname
  export GOPATH="$srcdir"/gopath

  # dep ensure fails because it updates vendor/github.com/monochromegane/go-gitignore
  # cd gopath/src/github.com/boyter/$pkgname
  # dep ensure
}

build() {
  export GOPATH="$srcdir"/gopath
  cd "$GOPATH/src/github.com/boyter/$pkgname"
  go install \
    -trimpath \
    -buildmode=pie \
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
