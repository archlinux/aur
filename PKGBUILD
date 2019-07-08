# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=git-chglog
pkgver=0.8.0
pkgrel=1
pkgdesc='git CHANGELOG generator'
url="https://github.com/git-chglog/git-chglog"
arch=(x86_64)
license=(MIT)
depends=(git)
makedepends=(go-pie dep)
source=($pkgname-$pkgver::https://github.com/git-chglog/git-chglog/archive/0.8.0.tar.gz)
sha512sums=('50a9e36f341cf623f8d59a5af65ef58d59db71ed8337fe148df93b0821b08ba341423df64c62182db7d4875811483f67c4637351ebda7ab2513c97f00e3a2434')

prepare(){
  mkdir -p gopath/src/github.com/$pkgname
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/$pkgname/$pkgname
  export GOPATH="$srcdir"/gopath
}

build() {
  export GOPATH="$srcdir/gopath"
  cd gopath/src/github.com/$pkgname/$pkgname
  go install \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -v ./...
}

check() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/$pkgname/$pkgname
  go test ./...
}

package() {
  export GOPATH="$srcdir/gopath"
  install -Dm755 $GOPATH/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
