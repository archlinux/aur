# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
pkgname=dnscontrol
pkgver=0.2.8
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL "
arch=('x86_64')
url="https://stackexchange.github.io/${pkgname}/"
license=('GPL')
depends=('glibc')
makedepends=('go-pie')
provides=("${pkgname}=${pkgver}")

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/StackExchange/${pkgname}/archive/v${pkgver}.tar.gz"
)

sha256sums=('87018f5d05f407ab30db782f26d0b42cf80b340de1e695467c193ca9446d6c5e')

prepare(){
  mkdir -p gopath/src/github.com/StackExchange
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/StackExchange/dnscontrol
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/StackExchange/dnscontrol

  go build \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -v .
}

package() {
  install -Dm755 gopath/src/github.com/StackExchange/dnscontrol/$pkgname "$pkgdir"/usr/bin/$pkgname
}
