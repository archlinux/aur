# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=dnscontrol
pkgver=3.3.0
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL"
arch=('x86_64')
url="https://stackexchange.github.io/${pkgname}/"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
provides=("${pkgname}=${pkgver}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/StackExchange/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('9e4cc7b12dee07d8ae76502b6346efe977091c4c0469572a8e8d53e8d943926e1a68ccc110ccc9e447e49d318093a612dc92ba6d99d24642881d31c31fb421c6')

prepare(){
  mkdir -p gopath/src/github.com/StackExchange
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/StackExchange/dnscontrol
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd gopath/src/github.com/StackExchange/dnscontrol

  go build \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -v .
}

package() {
  install -Dm755 gopath/src/github.com/StackExchange/dnscontrol/$pkgname "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 gopath/src/github.com/StackExchange/dnscontrol/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
