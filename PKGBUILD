pkgname=smtpdane
pkgver=0.3.2
pkgrel=1
pkgdesc='SMTP DANE testing tool'
arch=('x86_64')
url="https://github.com/PennockTech/smtpdane"
license=('MIT')
makedepends=('go')
source=("https://github.com/PennockTech/$pkgname/archive/v$pkgver.zip")
sha256sums=('2e522524e3e3f07b340ad920467af5a680baa800e7917dbb6596cb2f963907c0')


prepare(){
  mkdir -p gopath/src/go.pennock.tech
  ln -rTsf $pkgname-$pkgver gopath/src/go.pennock.tech/$pkgname
  export GOPATH="$srcdir"/gopath
  go get github.com/miekg/dns
  go get golang.org/x/crypto/ocsp
}


build() {
  cd $pkgname-$pkgver
  export GOPATH="$srcdir"/gopath
  
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
