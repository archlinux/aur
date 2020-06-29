# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
# Maintainer: Max Shaughnessy <msh@lap.is>

pkgname=dnscontrol
pkgver=2.11
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL"
arch=('x86_64')
url="https://stackexchange.github.io/${pkgname}/"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
provides=("${pkgname}=${pkgver}")
source=("https://github.com/StackExchange/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6570391bb58b6188ad613fb0aef23da988c48e6cea2d697c61aaefe149ddc539')

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
