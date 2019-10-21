pkgname=mhsendmail
pkgver=0.2.0
pkgrel=1
pkgdesc='Mailhog sendmail replacement'
arch=('x86_64')
url="https://github.com/mailhog/mhsendmail"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mailhog/mhsendmail/archive/v${pkgver}.tar.gz")
sha256sums=('8677f539dc14217cd0a4ad87c085d11d484debddbcb538cf22c0b1326a203265')


prepare(){
  mkdir -p gopath/src/github.com/mailhog
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/mailhog/mhsendmail
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/mailhog/mhsendmail
  go get -d ./...
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/mailhog/mhsendmail
  go install \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -v ./...
}

check() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/mailhog/mhsendmail
  go test ./...
}

package() {
  install -Dm755 gopath/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
}
