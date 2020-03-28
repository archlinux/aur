# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=git-chglog
pkgver=0.9.1
pkgrel=1
pkgdesc='git CHANGELOG generator'
url="https://github.com/git-chglog/git-chglog"
arch=(x86_64)
license=(MIT)
depends=(git)
makedepends=(go-pie dep)
source=($pkgname-$pkgver.tar.gz::https://github.com/git-chglog/git-chglog/archive/${pkgver}.tar.gz)
sha512sums=('1ce04dd88ce2350b6a9146ba28a6fe4740e35d44f052f28904f090b5cc409a1f0975c7e3e63b24452228dc51b66add2d993c30f36d1e582c71286504eeb30f66')

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
