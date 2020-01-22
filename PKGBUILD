# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=talos
pkgver=0.3.0
pkgrel=1
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('any')
url='https://github.com/talos-systems/talos'
license=('MPL2')
makedepends=('go' 'protobuf' 'protobuf-go')
source=("https://github.com/talos-systems/talos/archive/v${pkgver}.tar.gz")
sha512sums=('627eadb79eb41aed63463f35b68d305da0621b38f98267be84d8c9bf8f3d9c2de93f398056c01b5a6e67ec68b525c932d7d84bea0d317315e62858b4919a42a8')

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
