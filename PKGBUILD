# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=nameinator
pkgver=0.0.4
pkgrel=1
pkgdesc='Open-source DNS benchmark utility - successor of namebench'
arch=('any')
url='https://github.com/mwiora/NAMEinator'
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/mwiora/NAMEinator/archive/v${pkgver}.tar.gz")
b2sums=('cf0a60a82127d0e336247a503bd509e713daa773f789f2301a85e8e9d1a6cd31e3cfb6184c5ccb4869ac53678aa2c131d3377b2f70a063866682e5e5e05fa283')

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
