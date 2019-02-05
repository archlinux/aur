# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=packer-builder-arm-image
pkgver=0.1.0
pkgrel=4
pkgdesc="Packer plugin for ARM images"
url="https://github.com/solo-io/packer-builder-arm-image"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('APACHE')
depends=('glibc' 'multipath-tools' 'qemu-user-static')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/solo-io/packer-builder-arm-image/archive/v${pkgver}.tar.gz")
sha256sums=('d7cc1ded82d55e45918b0a269726ca5720ffa81447d03fbe53ee5a6a66283527')

prepare() {
  mkdir -p src/github.com/solo-io/
  ln -rTsf "${pkgname}-${pkgver}" src/github.com/solo-io/packer-builder-arm-image
}

build() {
  export GOPATH="${srcdir}"
  cd src/github.com/solo-io/packer-builder-arm-image
  go install \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    ./...
}

package() {
  install -Dm755 bin/packer-builder-arm-image "${pkgdir}/usr/bin/packer-builder-arm-image"
  # install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
