# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=talos
pkgver=0.3.2
pkgrel=1
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('any')
url='https://github.com/talos-systems/talos'
license=('MPL2')
makedepends=('go' 'protobuf' 'protobuf-go')
source=("https://github.com/talos-systems/talos/archive/v${pkgver}.tar.gz")
sha512sums=('fdaaee4da5cdf9b5d7d0717a607f374c271317f63ee283abb71a706086b0e915fe85208e9bfc731848efa25719bd298973f70fa7be7a0e035ebf9148019bb4cd')

prepare() {
  cd ${pkgname}-${pkgver}
  for i in $(ls "${srcdir}"/${pkgname}-${pkgver}/api/); do
    protoc -I./api --go_out=plugins=grpc:./api/${i} api/${i}/${i}.proto
  done
}

build() {
  cd ${pkgname}-${pkgver}
  go build -trimpath -ldflags "-extldflags ${LDFLAGS}" ./cmd/osctl
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 osctl "${pkgdir}"/usr/bin/osctl
}
