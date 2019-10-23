# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=talos
pkgver=0.2.0
pkgrel=1
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('any')
url='https://github.com/talos-systems/talos'
license=('MPL2')
makedepends=('go' 'protobuf' 'protobuf-go')
source=("https://github.com/talos-systems/talos/archive/v${pkgver}.tar.gz")
sha512sums=('2b2ef42c7bc3a0581e142c890a32e64a2c423a9452d3cbc6d789fc306b05d055319a65243f891dd17a6c8245fdadb747851888c057a47a86d9c1001b9f08f578')

prepare() {
  cd ${pkgname}-${pkgver}
  for i in {osd,trustd,machined,proxyd,ntpd,networkd}; do
    cd "${srcdir}/${pkgname}-${pkgver}/internal/app/${i}"
    protoc -I./proto --go_out=plugins=grpc:proto proto/api.proto
  done
}

build() {
  cd ${pkgname}-${pkgver}
  go build -trimpath -ldflags "-extldflags ${LDFLAGS}" ./cmd/osctl
}

package() {
  cd ${pkgname}-${pkgver}
  install -D -m 755 osctl "${pkgdir}/usr/bin/osctl"
}
