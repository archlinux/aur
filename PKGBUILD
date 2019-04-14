# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=coyim
pkgver=0.3.11
pkgrel=1
pkgdesc="A safe and secure chat client"
arch=('i686' 'x86_64')
depends=('gtk3')
makedepends=('go-pie')
url="https://coy.im"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/coyim/coyim/tar.gz/v$pkgver)
sha256sums=('4717901462f027578369358c8772eb5b14e22f053fc30e4c9dbcc2b053374a41')

prepare(){
  mkdir -p "$srcdir/gopath/src/github.com/coyim"
  ln -rTsf "$srcdir/$pkgname-$pkgver" "$srcdir/gopath/src/github.com/coyim/$pkgname"
}

build() {
  export GOPATH="$srcdir/gopath"
  cd "$srcdir/gopath/src/github.com/coyim/$pkgname"

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -v .
}

package() {
  cd "$srcdir/gopath/src/github.com/coyim/$pkgname"

  install -Dm 644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname"

  install -Dm 755 "coyim" -t "$pkgdir/usr/bin"
}
