# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=goxygen
pkgver=0.3.0
pkgrel=1
pkgdesc="Generate a modern Web project with Go, Angular/React/Vue, and MongoDB in seconds"
arch=('x86_64')
url='https://github.com/Shpota/goxygen'
license=('Apache')
depends=('docker'
         'docker-compose'
         'nodejs'
         'npm')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c27cc417605adf01cfa46ea869760b0858c0558736b0b416e1b401c4bb2b8005')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -v -o "../goxygen-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../goxygen-bin "${pkgdir}/usr/bin/goxygen"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -aR templates "${pkgdir}/usr/share/doc/${pkgname}"
  go clean -modcache #Remove go libraries
}