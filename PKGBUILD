# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: bemasher <bemasher@gmail.com>

pkgname=rtlamr
pkgver=0.9.1
pkgrel=2
pkgdesc="An rtl-sdr receiver for Itron ERT compatible smart meters operating in the 900MHz ISM band."
arch=('any')
url="https://github.com/bemasher/rtlamr"
source=("https://github.com/bemasher/rtlamr/archive/v${pkgver}.tar.gz")
md5sums=('8d47164413f6b6ca2aa188fb2a164f63')
license=('AGPL3')
depends=('go' 'rtl-sdr')
options=('!strip' '!emptydirs')
_gourl=github.com/bemasher/rtlamr

prepare(){
  mkdir -p gopath/src/${_gourl%/*}
  ln -rTsf $pkgname-$pkgver gopath/src/$_gourl
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/$_gourl
  go install \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -v ./...
}

check() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/$_gourl
  go test ./...
}


package() {
  install -p -Dm755 gopath/bin/rtlamr "$pkgdir/usr/bin/rtlamr"
}

# vim:set ts=2 sw=2 et:
