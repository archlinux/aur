# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=talos
pkgver=0.3.3
pkgrel=1
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('any')
url='https://github.com/talos-systems/talos'
license=('MPL2')
makedepends=('go' 'protobuf' 'protobuf-go')
source=("https://github.com/talos-systems/talos/archive/v${pkgver}.tar.gz")
sha512sums=('70e9a74d0d5f1fb282e488f4d55705c89b320a7b6b15c3b7fef13191f3fb84dfbec9fd4b67e6171095caa2dcdb29f16da62c9b53400988720099fab209417540')

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
