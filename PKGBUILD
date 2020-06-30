# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=dnscontrol
pkgver=3.2.0
pkgrel=2
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL"
arch=('x86_64')
url="https://stackexchange.github.io/${pkgname}/"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
provides=("${pkgname}=${pkgver}")
source=("https://github.com/StackExchange/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('c0cac1f55b24cd0c1f7e34cd468c569525458767d2e183bde7616213cedcaee8ec8be15983d31e1f67ad7047179f5a4c67b6a9bcf576e42605a7c8d7299f9e9a')

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
