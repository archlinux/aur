# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=talos
pkgver=0.3.1
pkgrel=1
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('any')
url='https://github.com/talos-systems/talos'
license=('MPL2')
makedepends=('go' 'protobuf' 'protobuf-go')
source=("https://github.com/talos-systems/talos/archive/v${pkgver}.tar.gz")
sha512sums=('5c5f1d8db63731016abdc84c41e7073bffc466b5dc61ebc206c528b405b148d59fdd2450387afd1a492f3cb2befb551190749642b6fa0e7c9b1e3d0ae6b699c2')

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
