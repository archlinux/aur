# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=nameinator
pkgver=0.0.4
pkgrel=1
pkgdesc='Open-source DNS benchmark utility - successor of namebench'
arch=(any)
url='https://github.com/mwiora/NAMEinator'
license=(Apache)
makedepends=('go' 'git')
source=(https://github.com/mwiora/NAMEinator/archive/v${pkgver}.tar.gz)
sha512sums=('a981e75bd8e3c228cbb194f14416476ac1a222fb490bc0343fe8319ea9d3105db9e571f252c57c8e7d956102b4e1adecaa26ee71a077aba0855bb70d1e878d5b')

prepare() {
  export GOPATH="${srcdir}"/gopath
  mv NAMEinator-${pkgver} ${pkgname}-${pkgver}
  mkdir -p gopath/src/github.com/mwiora/
  ln -rTsf ${pkgname}-${pkgver} gopath/src/github.com/mwiora/${pkgname}
  go get github.com/miekg/dns
}

build() {
  export GOPATH="${srcdir}"/gopath
  cd gopath/src/github.com/mwiora/${pkgname}
  go install \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -v ./...
}

package() {
  install -Dm755 ${srcdir}/gopath/bin/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
