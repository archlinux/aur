# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=cashshuffle
pkgver=0.5.0
pkgrel=0
pkgdesc="CashShuffle server for BCH."
arch=('i686' 'x86_64')
url="http://github.com/cashshuffle/cashshuffle"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("s=${pkgver}")
source=("https://github.com/cashshuffle/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('59dc2c1d70f1dd9e640f73000a301a0be7a72a93f4693d88d27218ebbb23a2d2')

build() {
  mkdir -p "${srcdir}/go/src/github.com/cashshuffle"
  export GOPATH="${srcdir}/go"
  export GOBIN="$GOPATH/bin"

  mv "$pkgname-$pkgver" "$GOPATH/src/github.com/cashshuffle/cashshuffle"
  cd "$GOPATH/src/github.com/cashshuffle/cashshuffle"

  go get -u github.com/FiloSottile/gvt
  $GOBIN/gvt restore

  go build .
}

package() {
  cd "${srcdir}/go/src/github.com/cashshuffle/cashshuffle"

  install -Dm 775 "cashshuffle" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
