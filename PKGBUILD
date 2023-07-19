pkgname=smtpdane
pkgver=0.5.1
pkgrel=1
pkgdesc='SMTP DANE testing tool'
arch=('x86_64')
url="https://github.com/PennockTech/smtpdane"
license=('MIT')
makedepends=('go')
source=("https://github.com/PennockTech/$pkgname/archive/v$pkgver.zip")
sha256sums=('7c08042e84071e8aaee6e2c010bda53dafa2bbe0fad7be0cd1baf3ff355c4548')


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
