# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=coyim
pkgver=0.3.8
pkgrel=3
pkgdesc="A safe and secure chat client"
arch=('i686' 'x86_64')
depends=('gtk3')
makedepends=('go-pie')
url="https://coy.im"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/coyim/coyim/tar.gz/v$pkgver)
sha256sums=('30a86c6c83a8b2d8e0e7966a41fd20e8dcdf3a27ff819d9e363771f867f804ef')

prepare(){
  mkdir -p "$srcdir/gopath/src/github.com/twstrike"
  ln -rTsf "$srcdir/$pkgname-$pkgver" "$srcdir/gopath/src/github.com/twstrike/$pkgname"
}

build() {
  export GOPATH="$srcdir/gopath"
  cd "$srcdir/gopath/src/github.com/twstrike/$pkgname"

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -v .
}

package() {
  cd "$srcdir/gopath/src/github.com/twstrike/$pkgname"

  install -Dm 644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname"

  install -Dm 755 "coyim" -t "$pkgdir/usr/bin"
}
