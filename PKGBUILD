pkgname=i3refgen
pkgver=1.1
pkgrel=1
pkgdesc="Reads your i3 configuration file and generates a HTML file with the keybindings to print out and put near your screen."
arch=('x86_64')
url="https://github.com/ronthecookie/i3refgen"
license=('MIT')
makedepends=('go-pie' 'dep')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RONTheCookie/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('0a2e5bdf6cc7ab61815b5b541aec9988')

prepare(){
  mkdir -p gopath/src/github.com/ronthecookie
  ln -rTsf "${pkgname}-${pkgver}" gopath/src/github.com/ronthecookie/$pkgname

  cd "gopath/src/github.com/ronthecookie/$pkgname"
  export GOPATH="$srcdir/gopath"
  dep ensure
}

build() {
  export GOPATH="$srcdir/gopath"
  export GOFLAGS="-ldflags=-s -ldflags=-w -gcflags=all=-trimpath=${GOPATH} -asmflags=all=-trimpath=${GOPATH}"
  cd "$GOPATH/src/github.com/ronthecookie/$pkgname"
  go install -v ./...
}

package() {
  install -Dm755 "gopath/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $srcdir/$pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}